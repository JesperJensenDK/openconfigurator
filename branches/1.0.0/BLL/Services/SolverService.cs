﻿// Developed by OpenConfigurator Core Team
// 
// Distributed under the MIT license
// ===========================================================
// Copyright (c) 2012 - Radu Mitache
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, 
// publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR 
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
// OTHER DEALINGS IN THE SOFTWARE.
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Z3;
using System.Linq.Expressions;
using System.IO;
using BLL.SolverEngines;
using BLL.Parsers;

namespace BLL.Services
{
    public class SolverService
    {
        //Fields
        IParser _ruleParser;
        DatabindParser _databindParser;
        const string featuresCategory = "Features", attributesCategory = "Attributes", relationsCategory = "Relations",
            groupRelationsCategory = "GroupRelations", compositionRulesCategory = "CompositionRules";



        //Private methods
        private static ISolverContext InitializeContextFromModel(BusinessObjects.Model model)
        {
            //Create a new SolverContext
            ISolverContext context = new Z3Context();

            //Create variables for Features and Attributes
            foreach (BLL.BusinessObjects.Feature feature in model.Features)
            {
                //Add a variable for the Feature
                context.AddVariable(feature.Name, feature.ID.ToString(), featuresCategory, VariableDataTypes.Boolean);

                ////Add variables for its Attributes
                //feature.Attributes.ForEach(attribute =>
                //{
                //    if (attribute.AttributeDataType == BusinessObjects.AttributeDataTypes.Integer)
                //        context.AddAttributeVariable(attribute.FeatureID.ToString(), attribute.Name, attribute.ID.ToString(), attributesCategory, VariableDataTypes.Integer);
                //});
                //feature.Attributes.ForEach(attribute =>
                //{
                //    if (attribute.AttributeDataType == BusinessObjects.AttributeDataTypes.Integer && !String.IsNullOrEmpty(attribute.ConstantValue))
                //        context.AddFeatureAttributeValueAssumption(feature.ID.ToString(), featuresCategory, attribute.ID.ToString(), attributesCategory, VariableDataTypes.Integer, int.Parse(attribute.ConstantValue));
                //});
            }

            //Create constraints
            model.Relations.ForEach(rel => context.AddConstraint(relationsCategory, TransformToStatement(context, rel)));
            model.GroupRelations.ForEach(groupRel => context.AddConstraint(groupRelationsCategory, TransformToStatement(context, groupRel)));
            model.CompositionRules.ForEach(compositionRule => context.AddConstraint(compositionRulesCategory, TransformToStatement(context, compositionRule)));
            model.Constraints.ForEach(constraint => context.AddConstraint(compositionRulesCategory, TransformToStatement(context, constraint)));

            //Create an initial restore point and return the new context
            context.CreateInitialRestorePoint();
            return context;
        }
        private bool VerifyAssumption(string variableID, string categoryName, VariableDataTypes dataType, object valueToTest)
        {
            return false;
        }
        private bool ApplyFeedbackAlgorithm(ref ConfiguratorSession configSession)
        {
            //Variables
            bool validity = true;

            //Loop through all FeatureSelections
            foreach (BLL.BusinessObjects.FeatureSelection featureSelection in configSession.Configuration.FeatureSelections)
            {
                //Determine the state of each Feature - so as to keep the validity of the configuration 
                if (featureSelection.ToggledByUser == false)
                {
                    bool CanBeTrue = configSession.Context.IsValid(featureSelection.FeatureID.ToString(), featuresCategory, VariableDataTypes.Boolean, true);
                    bool CanBeFalse = configSession.Context.IsValid(featureSelection.FeatureID.ToString(), featuresCategory, VariableDataTypes.Boolean, false);

                    //Feature cannot be false nor true - configuration INVALID  
                    if (!CanBeFalse && !CanBeTrue)
                    {
                        
                        validity = false;
                    }
                    //Feature has to be false
                    else if (!CanBeTrue)
                    {
                        featureSelection.SelectionState = BusinessObjects.FeatureSelectionStates.Deselected;
                        featureSelection.Disabled = true;
                    }
                    //Feature has to be true
                    else if (!CanBeFalse)
                    {
                        
                        featureSelection.SelectionState = BusinessObjects.FeatureSelectionStates.Selected;
                        featureSelection.Disabled = true;
                    }
                    //Feature can be anything
                    else if (CanBeFalse && CanBeTrue)
                    {
                        
                        featureSelection.SelectionState = BusinessObjects.FeatureSelectionStates.Unselected;
                        featureSelection.Disabled = false;
                    }
                }
            }

            //
            return validity;
        }
        private static ISolverStatement TransformToStatement(ISolverContext context, BLL.BusinessObjects.Relation relation)
        {
            ISolverStatement returnStatement = null;
            switch (relation.RelationType)
            {
                case BusinessObjects.RelationTypes.Mandatory:
                    returnStatement = context.MakeEquivalence(featuresCategory, relation.ParentFeatureID.ToString(), relation.ChildFeatureID.ToString());
                    break;
                case BusinessObjects.RelationTypes.Optional:
                    returnStatement = context.MakeImplies(featuresCategory, relation.ChildFeatureID.ToString(), relation.ParentFeatureID.ToString());
                    break;
            }
            return returnStatement;
        }
        private static ISolverStatement TransformToStatement(ISolverContext context, BLL.BusinessObjects.GroupRelation groupRelation)
        {
            ISolverStatement returnStatement = null;
            switch (groupRelation.GroupRelationType)
            {
                case BusinessObjects.GroupRelationTypes.OR:
                    ISolverStatement innerOr1 = context.MakeOr(featuresCategory, groupRelation.ChildFeatureIDs.Select(k => k.ToString()).ToArray());
                    returnStatement = context.MakeEquivalence(featuresCategory, groupRelation.ParentFeatureID.ToString(), innerOr1);
                    break;
                case BusinessObjects.GroupRelationTypes.XOR:
                    ISolverStatement orStatement = context.MakeOr(featuresCategory, groupRelation.ChildFeatureIDs.Select(k => k.ToString()).ToArray());
                    ISolverStatement negatedAnds = context.MakeNotAndCombinations(featuresCategory, groupRelation.ChildFeatureIDs.Select(k => k.ToString()).ToArray());
                    ISolverStatement equivalence2 = context.MakeEquivalence(featuresCategory, groupRelation.ParentFeatureID.ToString(), orStatement);
                    returnStatement = context.MakeAnd(equivalence2, negatedAnds);
                    break;
                case BusinessObjects.GroupRelationTypes.Cardinal:

                    //Sum value constraint statement :  >= lowerbound AND <= upperbound
                    List<ISolverStatement> intConversions = new List<ISolverStatement>();
                    groupRelation.ChildFeatureIDs.ForEach(childFeatureID => intConversions.Add(context.MakeBoolToInt(childFeatureID.ToString(), featuresCategory)));
                    ISolverStatement sumLesserThan = context.MakeLowerOrEqual(context.MakeAdd(intConversions.ToArray()), context.MakeNumeral((int)groupRelation.UpperBound));
                    ISolverStatement sumGreaterThan = context.MakeGreaterOrEqual(context.MakeAdd(intConversions.ToArray()), context.MakeNumeral((int)groupRelation.LowerBound));
                    ISolverStatement sumEqualsZero = context.MakeEquals(context.MakeAdd(intConversions.ToArray()), context.MakeNumeral(0));
                    ISolverStatement sumValStatement = context.MakeAnd(sumLesserThan, context.MakeOr(sumGreaterThan, sumEqualsZero));

                    //Commented out due to a bug - when lowerbound is = 0, the solver does not allow all elements in a groupRelation to be set to 0
                    ISolverStatement orStatement2 = context.MakeOr(featuresCategory, groupRelation.ChildFeatureIDs.Select(k => k.ToString()).ToArray());
                    ISolverStatement equivalence3 = context.MakeEquivalence(featuresCategory, groupRelation.ParentFeatureID.ToString(), orStatement2);
                    returnStatement = context.MakeAnd(equivalence3, sumValStatement);

                    break;
            }
            return returnStatement;
        }
        private static ISolverStatement TransformToStatement(ISolverContext context, BLL.BusinessObjects.CompositionRule compositionRule)
        {
            ISolverStatement returnStatement = null;
            switch (compositionRule.CompositionRuleType)
            {
                case BusinessObjects.CompositionRuleTypes.Dependency:
                    returnStatement = context.MakeImplies(featuresCategory, compositionRule.FirstFeatureID.ToString(), compositionRule.SecondFeatureID.ToString());
                    break;
                case BusinessObjects.CompositionRuleTypes.MutualDependency:
                    returnStatement = context.MakeEquivalence(featuresCategory, compositionRule.FirstFeatureID.ToString(), compositionRule.SecondFeatureID.ToString());
                    break;
                case BusinessObjects.CompositionRuleTypes.MutualExclusion:
                    returnStatement = context.MakeExcludes(featuresCategory, compositionRule.FirstFeatureID.ToString(), compositionRule.SecondFeatureID.ToString());
                    break;
            }
            return returnStatement;
        }
        private static ISolverStatement TransformToStatement(ISolverContext context, BLL.BusinessObjects.Constraint constraint)
        {
            ISolverStatement returnStatement = null;
            
            return returnStatement;
        }

        //Constructors
        public SolverService()
        {
            //
            _ruleParser = new StandardParser();
            _databindParser = new DatabindParser();
        }

        //Public methods  
        public static ISolverContext CreateNewContext(BusinessObjects.Model model)
        {
            ISolverContext context = InitializeContextFromModel(model);
            return context;
        }
        public bool UserToggleSelection(ref ConfiguratorSession configSession, int FeatureID, BLL.BusinessObjects.FeatureSelectionStates newState)
        {
            //Get the FeatureSelection corresponding to the given FeatureID
            BLL.BusinessObjects.FeatureSelection fSelection = configSession.Configuration.FeatureSelections.First(k => k.FeatureID == FeatureID);

            //Set the bool value in the context and in the appropriate FeatureSelection
            switch (newState)
            {
                case BusinessObjects.FeatureSelectionStates.Selected: //Assert-decision  :Selected
                    configSession.Context.AddOrModifyValueAssumption(FeatureID.ToString(), featuresCategory, VariableDataTypes.Boolean, true);
                    fSelection.SelectionState = BusinessObjects.FeatureSelectionStates.Selected;
                    fSelection.ToggledByUser = true;
                    break;
                case BusinessObjects.FeatureSelectionStates.Deselected: //Assert-decision  :Deselected
                    configSession.Context.AddOrModifyValueAssumption(FeatureID.ToString(), featuresCategory, VariableDataTypes.Boolean, false);
                    fSelection.SelectionState = BusinessObjects.FeatureSelectionStates.Deselected;
                    fSelection.ToggledByUser = true;
                    break;
                case BusinessObjects.FeatureSelectionStates.Unselected: //Retract-decision  :Unselected
                    configSession.Context.RemoveValueAssumption(FeatureID.ToString(), featuresCategory);
                    fSelection.SelectionState = BusinessObjects.FeatureSelectionStates.Unselected;
                    fSelection.ToggledByUser = false;
                    break;
            }

            //Make changes so that the user cannot break the validity of the model in the next change
            bool decisionIsValid = ApplyFeedbackAlgorithm(ref configSession);

            //
            return decisionIsValid;
        }
        public object EvalExpression(ref ConfiguratorSession configSession, string expression)
        {
            //
            List<object> resultSet = new List<object>();

            //Evaluat the expression
            IEvalResult[] expResult = _databindParser.EvalExpression(ref configSession, expression);

            //Loop through individual results and add them to the resultSet List
            if (expResult != null)
            {
                expResult.ToList().ForEach(returnResult =>
                {
                    object obj = returnResult.GetGenericReturnValue();
                    var resultEntry = new
                    {
                        BusinessObject = obj,
                        Type = obj.GetType().Name
                    };

                    resultSet.Add(resultEntry);
                });
            }

            //
            return resultSet;
        }
    }
    public class ConfiguratorSession
    {
        //Fields
        private BusinessObjects.Model _model;
        private ISolverContext _context;
        private BusinessObjects.Configuration _configuration;

        //Properties
        public BusinessObjects.Model Model
        {
            get { return _model; }
            set { _model = value; }
        }
        public ISolverContext Context
        {
            get { return _context; }
            set { _context = value; }
        }
        public BusinessObjects.Configuration Configuration
        {
            get { return _configuration; }
            set { _configuration = value; }
        }

        //Constructor
        public ConfiguratorSession(BusinessObjects.Model model, BusinessObjects.Configuration configuration, ISolverContext context)
        {
            _model = model;
            _context = context;
            _configuration = configuration;
        }

    }
}
