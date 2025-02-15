//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
import OSLog

/// Main entry point for the program
/// Arguments are taken from user input and passed in Calculator class
/// The result is returned in a struct with the result and bool indicating validity
/// os_log is used to print to std_err

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

var standardError = FileHandle.standardError

//os_log(.info,"Calc implementation v1.0")
//os_log(.info, "Debug: parsed input as \(args)")

var calculate = Calculator()
var result = calculate.process(args: args)

print(result.result)

if(!result.isValid)
{
    exit(EXIT_FAILURE)
}
