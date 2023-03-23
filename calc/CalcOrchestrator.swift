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
            case "x":
                operationFound = "x"
                break
            case "/":
                operationFound = "/"
                break
            case "%":
                operationFound = "%"
                break
            default:
                break
            }
        }
        
        var numberArray : [String] = []
        
        for numbers in args{
            if(numbers == "+" || numbers == "-" || numbers == "x" || numbers == "/" || numbers == "%")
            {
                continue
            }
            numberArray.append(numbers)
        }
        
        if(operationFound == "-1")
        {
            return numberArray[0]
        }
        
        var result: Int
        
        switch (operationFound) {
        case "+":
            let addition = Addition(numbers: numberArray)
            result = addition.add()
            break
        case "-":
            let subtraction = Subtraction(numbers: numberArray)
            result = subtraction.subtract()
            break
        case "x":
            let multiplication = Multiply(numbers: numberArray)
            result = multiplication.multiply()
            break
        case "/":
            let division = Divide(numbers: numberArray)
            result = division.divide()
        case "%":
            let modulus = Modulus(numbers: numberArray)
            result = modulus.modulo()
        default:
            result = 0
        }
        return String(result)
        }
    }
