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



//args = ["5", "-", "5"]

var calculate = CalcOrchestrator(args: args)

var result = calculate.calculate()

print(result)

// Parse the arguments in here and store the result in an array and send the array for processing

//let calculate = CalcOrchestrator(args)

//print("Output from program: \(calculate.output)")

//print(Int(args[0])!)
