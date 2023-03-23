//
//  Result.swift
//  calc
//
//  Created by Patrick Korczak on 23/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

/// This struct contains the response model that is returned to main.
/// The result: String is printed to console while the isValid bool
/// determines the exit code of the program on termination.
struct Result {
    let result: String
    let isValid: Bool
}
