//
//  CalcOrchestrator.swift
//  calc
//
//  Created by Patrick Korczak on 19/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

class CalcOrchestrator{
    
    enum Operation {
        case add
        case subtract
    }
    
    var args: [String]
    
    init(args: [String])
    {
        self.args = args
    }
    
    func calculate() -> String{
        // Determine which operation is involved
        var operationFound: String = "-1"
        
        for operation in args{
            switch (operation) {
            case "+":
                operationFound = "+"
                break
            case "-":
                operationFound = "-"
                break
            default:
                break
            }
        }
        
        // remove the operation, just have the numbers
        
        var numberArray : [String] = []
        
        for numbers in args{
            if(numbers == "+" || numbers == "-")
            {
                continue
            }
            numberArray.append(numbers)
        }
        
        var result: Int
        
        switch (operationFound) {
        case "+":
            var addition = Addition(numbers: numberArray)
            result = addition.add()
            break
        case "-":
            var subtraction = Subtraction(numbers: numberArray)
            result = subtraction.subtract()
            break
        default:
            result = 0
        }
        return String(result)
        }
    }
