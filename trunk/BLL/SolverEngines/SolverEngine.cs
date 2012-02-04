﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.SolverEngines
{
    public interface ISolverEngine
    {
        ISolverSolution GetSolution(ISolverContext context);
        bool CheckSolutionExists(ISolverContext context, string varID, bool valueToTest);
        ISolverContext CreateBlankContext();
    }
    public interface ISolverContext
    {
        void CreateInitialPoint();
        void AddBoolVariable(string varID, string varName);
        void AddConstraint(params ISolverStatement[] statements);
        ISolverStatement CreateStatement(StatementTypes type, params ISolverStatement[] innerStatement);
        ISolverStatement CreateStatement(StatementTypes type, params string[] varIDs);
        ISolverStatement CreateStatement(StatementTypes type, string varID, ISolverStatement rightStatement);
        void AssumeBoolVarValue(string varID, bool value, AssumptionTypes madeBy);
        void RemoveValAssumption(string varID);
    }
    public interface ISolverSolution
    {
        bool? GetVariableValue(string varID);
        Dictionary<string,bool?> GetAllVariableValues();
    }
    public interface ISolverStatement
    {
       
    }

    //Enums
    public enum VariableTypes
    {
        Boolean,
        Integer
    }
    public enum StatementTypes
    {
        And,
        Or,
        Not,
        NotAndCombinations,
        Implies,
        Excludes,
        Equivalence
    }
    public enum AssumptionTypes
    {
        User,
        Solver
    }
}
