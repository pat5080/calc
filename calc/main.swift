//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
import OSLog

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

var standardError = FileHandle.standardError

os_log(.info,"Calc implementation v1.0")
os_log(.info, "Debug: parsed input as \(args)")



//args = ["10","-","5","+","2","/","2","x","3","%","2"]

var calculate = Calculator()

var result = calculate.process(args: args)

print(result.result)

if(!result.isValid)
{
    exit(EXIT_FAILURE)
}
