//
//  Calculator.swift
//  calc
//
//  Created by Patrick Korczak on 18/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

class Calculator{
    
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
    
    func calculate(numbers: [Int], operations: [String]) -> String{
        
        var complexResolve: SolveResponse
        
        if(operations.contains("x") || operations.contains("/") || operations.contains("%"))
        {
            complexResolve = solveComplex(numbers: numbers, operations: operations)
            return solveSimplified(numbers: complexResolve.numbers, operations: complexResolve.operations)
        }
            return solveSimplified(numbers: numbers, operations: operations)
    }
    
    func solveComplex(numbers: [Int], operations: [String]) -> SolveResponse
    {
        var newNumbers: [Int] = []
        var newOperations: [String] = []
        var subTotal: Int = 0
        var flag: Bool = false
        
        let count = operations.count
        
        for index in 0..<count{
            if(operations[index] == "x")
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
            else if(operations[index] == "/")
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
            else if(operations[index] == "%")
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
                else if(index != 0 && (operations[index-1] == "+") || (operations[index-1] == "-"))
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
                if(operations[index] == "+" || operations[index] == "-")
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
    
    func solveSimplified(numbers: [Int], operations: [String]) -> String
    {
        var total: Int = numbers[0]
        let count = operations.count
        
        for index in 0..<count{
            if(operations[index] == "+")
            {
                total += numbers[index+1]
            }
            else if(operations[index] == "-")
            {
                total -= numbers[index+1]
            }
        }
        return String(total)
    }
}
