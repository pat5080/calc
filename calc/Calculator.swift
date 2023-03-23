//
//  Calculator.swift
//  calc
//
//  Created by Patrick Korczak on 18/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

/// The Calculator class takes the input from the command line and passes it to
/// the Parser class. If the input is valid or requires calculation it will
/// proceed to process and calculate the result. Otherwise it will
/// return the error to main where it will be displayed to the user.

class Calculator{
    
    /// This orchestrator class is responsible for sending input to Parser for validation
    /// and decides whether to calculate and return the result or to skip calculation
    /// to return an error or parsed value.
    func process(args: [String]) -> Result{
        
        let parser = Parser()
        let parse = parser.process(args: args)
        
        if(parse.numbers.count == 1 && parse.isValid == true)
        {
            return Result(result: String(parse.numbers[0]), isValid: parse.isValid)
        }
        else if(parse.isValid == false)
        {
            return Result(result: parse.errorMessage!, isValid: parse.isValid)
        }
        
        let result = calculate(numbers: parse.numbers, operations: parse.operations)
        return Result(result: result, isValid: true)
    }
    
    /// The calculate function will check whether the validated input has
    /// only addition and subtraction operators which will only require
    /// 'simple solving' avoiding code that looks for all the other operands 'x','/','%'.
    /// Input with multiplication, division or modulus will first be processed in complex
    /// processing to be simplified to input containing only addition and subtraction solving.
    /// Then it will be passed into the solveSimplified function to determine the final result
    func calculate(numbers: [Int], operations: [String]) -> String{
        
        var complexResolve: SolveResponse
        
        if(operations.contains(Definitions.multiply) || operations.contains(Definitions.divide) || operations.contains(Definitions.modulo))
        {
            complexResolve = solveComplex(numbers: numbers, operations: operations)
            return solveSimplified(numbers: complexResolve.numbers, operations: complexResolve.operations)
        }
            return solveSimplified(numbers: numbers, operations: operations)
    }
    
    /// This function is dedicated to solving operations with multiplication, division and subtraction.
    /// It will loop through the array and solve operations that require multiplication, division and
    /// subtraction.
    /// It will return an array contained a simplified version that required to only be solved by addition
    /// or subtraction
    func solveComplex(numbers: [Int], operations: [String]) -> SolveResponse
    {
        var newNumbers: [Int] = []
        var newOperations: [String] = []
        var subTotal: Int = 0
        var flag: Bool = false
        let count = operations.count
        
        for index in 0..<count{
            if(operations[index] == Definitions.multiply)
            {
                var value: Int
                if(!flag)
                {
                    value = numbers[index]
                    flag = true
                }
                else
                {
                    value = subTotal
                }
                value *= numbers[index+1]
                subTotal = value
            }
            else if(operations[index] == Definitions.divide)
            {
                var value: Int
                if(!flag)
                {
                    value = numbers[index]
                    flag = true
                }
                else
                {
                    value = subTotal
                }
                value /= numbers[index+1]
                subTotal = value
            }
            else if(operations[index] == Definitions.modulo)
            {
                var value: Int
                if(!flag)
                {
                    value = numbers[index]
                    flag = true
                }
                else
                {
                    value = subTotal
                }
                value %= numbers[index+1]
                subTotal = value
            }
            else
            {
                newOperations.append(operations[index])
                if(index == 0)
                {
                    newNumbers.append(numbers[index])
                }
                else if(index != 0 && (operations[index-1] == Definitions.add) || (operations[index-1] == Definitions.subtract))
                {
                    newNumbers.append(numbers[index])
                }
                else
                {
                    newNumbers.append(subTotal)
                }
                subTotal = 0
                flag = false
            }
            
            if(index == count-1)
            {
                if(operations[index] == Definitions.add || operations[index] == Definitions.subtract)
                {
                    newNumbers.append(numbers[index+1])
                }
                else
                {
                    newNumbers.append(subTotal)
                }
            }
        }
        
        return SolveResponse(numbers: newNumbers, operations: newOperations)
    }
    
    /// This function will solve input that only requires addition or subtraction
    /// It loops through a numbers and operations array to perform iterative addition or subtraction
    /// operation and return the String result
    func solveSimplified(numbers: [Int], operations: [String]) -> String
    {
        var total: Int = numbers[0]
        let count = operations.count
        
        for index in 0..<count{
            if(operations[index] == Definitions.add)
            {
                total += numbers[index+1]
            }
            else if(operations[index] == Definitions.subtract)
            {
                total -= numbers[index+1]
            }
        }
        return String(total)
    }
}
