//
//  Parser.swift
//  calc
//
//  Created by Patrick Korczak on 23/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

class Parser{
    
    func process(args: [String]) -> Response
    {
        var operations: [String] = []
        var values: [Int] = []
        
        for value in args{
            switch (value) {
            case "+":
                operations.append(value)
                break
            case "-":
                operations.append(value)
                break
            case "x":
                operations.append(value)
                break
            case "/":
                operations.append(value)
                break
            case "%":
                operations.append(value)
                break
            default:
                guard let number = Int(value)
                else{
                    return Response(numbers: values, operations: operations, isValid: false, errorMessage: "Invalid number: \(value)")
                }
                values.append(number)
                break
            }
        }
        
        if(values.count == 1)
        {
            if(args.count > 1)
            {
                return Response(numbers: values, operations: operations, isValid: false, errorMessage: "Incomplete expression. Expected input of the form [number] [operator number ...]")
            }
            else
            {
                return Response(numbers: values, operations: operations, isValid: true)
            }
        }
        
        
        if(operations.count != (values.count - 1))
        {
            return Response(numbers: values, operations: operations, isValid: false, errorMessage: "Incomplete expression. Expected input of the form [number] [operator number ...]")
        }
        
        return Response(numbers: values, operations: operations, isValid: true)
    }
}
