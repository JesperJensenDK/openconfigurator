//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;

namespace DAL.DataEntities
{
    public partial class CompositionRule : IDataEntity
    {
        #region Primitive Properties
    
        public virtual int ID
        {
            get;
            set;
        }
    
        public virtual int ModelID
        {
            get { return _modelID; }
            set
            {
                if (_modelID != value)
                {
                    if (Model != null && Model.ID != value)
                    {
                        Model = null;
                    }
                    _modelID = value;
                }
            }
        }
        private int _modelID;
    
        public virtual int CompositionRuleTypeID
        {
            get { return _compositionRuleTypeID; }
            set
            {
                if (_compositionRuleTypeID != value)
                {
                    if (CompositionRule_Types != null && CompositionRule_Types.ID != value)
                    {
                        CompositionRule_Types = null;
                    }
                    _compositionRuleTypeID = value;
                }
            }
        }
        private int _compositionRuleTypeID;
    
        public virtual int FirstFeatureID
        {
            get { return _firstFeatureID; }
            set
            {
                if (_firstFeatureID != value)
                {
                    if (FirstFeature != null && FirstFeature.ID != value)
                    {
                        FirstFeature = null;
                    }
                    _firstFeatureID = value;
                }
            }
        }
        private int _firstFeatureID;
    
        public virtual int SecondFeatureID
        {
            get { return _secondFeatureID; }
            set
            {
                if (_secondFeatureID != value)
                {
                    if (SecondFeature != null && SecondFeature.ID != value)
                    {
                        SecondFeature = null;
                    }
                    _secondFeatureID = value;
                }
            }
        }
        private int _secondFeatureID;
    
        public virtual string Name
        {
            get;
            set;
        }
    
        public virtual string Description
        {
            get;
            set;
        }

        #endregion
        #region Navigation Properties
    
        public virtual CompositionRule_Type CompositionRule_Types
        {
            get { return _compositionRule_Types; }
            set
            {
                if (!ReferenceEquals(_compositionRule_Types, value))
                {
                    var previousValue = _compositionRule_Types;
                    _compositionRule_Types = value;
                    FixupCompositionRule_Types(previousValue);
                }
            }
        }
        private CompositionRule_Type _compositionRule_Types;
    
        public virtual Model Model
        {
            get { return _model; }
            set
            {
                if (!ReferenceEquals(_model, value))
                {
                    var previousValue = _model;
                    _model = value;
                    FixupModel(previousValue);
                }
            }
        }
        private Model _model;
    
        public virtual Feature FirstFeature
        {
            get { return _firstFeature; }
            set
            {
                if (!ReferenceEquals(_firstFeature, value))
                {
                    var previousValue = _firstFeature;
                    _firstFeature = value;
                    FixupFirstFeature(previousValue);
                }
            }
        }
        private Feature _firstFeature;
    
        public virtual Feature SecondFeature
        {
            get { return _secondFeature; }
            set
            {
                if (!ReferenceEquals(_secondFeature, value))
                {
                    var previousValue = _secondFeature;
                    _secondFeature = value;
                    FixupSecondFeature(previousValue);
                }
            }
        }
        private Feature _secondFeature;

        #endregion
        #region Association Fixup
    
        private void FixupCompositionRule_Types(CompositionRule_Type previousValue)
        {
            if (previousValue != null && previousValue.CompositionRules.Contains(this))
            {
                previousValue.CompositionRules.Remove(this);
            }
    
            if (CompositionRule_Types != null)
            {
                if (!CompositionRule_Types.CompositionRules.Contains(this))
                {
                    CompositionRule_Types.CompositionRules.Add(this);
                }
                if (CompositionRuleTypeID != CompositionRule_Types.ID)
                {
                    CompositionRuleTypeID = CompositionRule_Types.ID;
                }
            }
        }
    
        private void FixupModel(Model previousValue)
        {
            if (previousValue != null && previousValue.CompositionRules.Contains(this))
            {
                previousValue.CompositionRules.Remove(this);
            }
    
            if (Model != null)
            {
                if (!Model.CompositionRules.Contains(this))
                {
                    Model.CompositionRules.Add(this);
                }
                if (ModelID != Model.ID)
                {
                    ModelID = Model.ID;
                }
            }
        }
    
        private void FixupFirstFeature(Feature previousValue)
        {
            if (previousValue != null && previousValue.CompositionRules.Contains(this))
            {
                previousValue.CompositionRules.Remove(this);
            }
    
            if (FirstFeature != null)
            {
                if (!FirstFeature.CompositionRules.Contains(this))
                {
                    FirstFeature.CompositionRules.Add(this);
                }
                if (FirstFeatureID != FirstFeature.ID)
                {
                    FirstFeatureID = FirstFeature.ID;
                }
            }
        }
    
        private void FixupSecondFeature(Feature previousValue)
        {
            if (previousValue != null && previousValue.CompositionRules1.Contains(this))
            {
                previousValue.CompositionRules1.Remove(this);
            }
    
            if (SecondFeature != null)
            {
                if (!SecondFeature.CompositionRules1.Contains(this))
                {
                    SecondFeature.CompositionRules1.Add(this);
                }
                if (SecondFeatureID != SecondFeature.ID)
                {
                    SecondFeatureID = SecondFeature.ID;
                }
            }
        }

        #endregion
    }
}
