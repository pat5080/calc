//
//  Request.swift
//  calc
//
//  Created by Patrick Korczak on 23/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

/// This struct contains the response model for the object returned from
/// the Parser.
struct Response {
    let numbers: [Int]
    let operations: [String]
    let isValid: Bool
    var errorMessage: String?
}
