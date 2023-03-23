//
//  Parser.swift
//  calc
//
//  Created by Patrick Korczak on 23/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

/// This class is dedicated to validating input and returning the correct error message if there
/// is an error. It will throw the appropriate error on invalid input.
class Parser{
    
    /// This function contains all functionality.
    /// It loops through user input and seperates integers and operations into
    /// two separate arrays for processing.
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
                return Response(numbers: values, operations: operations, isValid: false, errorMessage: Definitions.incompleteError)
            }
            else
            {
                return Response(numbers: values, operations: operations, isValid: true)
            }
        }
        
        if(operations.count != (values.count - 1))
        {
            return Response(numbers: values, operations: operations, isValid: false, errorMessage: Definitions.incompleteError)
        }
        
        return Response(numbers: values, operations: operations, isValid: true)
    }
}
