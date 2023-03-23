//
//  SolveResponse.swift
//  calc
//
//  Created by Patrick Korczak on 23/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

/// This struct contains the response model for the function that
/// constructs an two new arrays with values that only require
/// addition or subtraction to solve.
struct SolveResponse {
    let numbers: [Int]
    let operations: [String]
}
