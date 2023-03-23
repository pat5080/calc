//
//  Request.swift
//  calc
//
//  Created by Patrick Korczak on 23/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

struct Response {
    let numbers: [Int]
    let operations: [String]
    let isValid: Bool
    var errorMessage: String?
}
