//
//  Definitions.swift
//  calc
//
//  Created by Patrick Korczak on 23/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

/// This struct defines the definitions for strings that are constantly used throughout
/// the Calculator and Parser class. They resemble global variables that can be accessed
/// throughout the project and their value can be changed in one location.
struct Definitions {
    static let add: String = "+"
    static let subtract: String = "-"
    static let multiply: String = "x"
    static let divide: String = "/"
    static let modulo: String = "%"
    static let incompleteError: String = "Incomplete expression. Expected input of the form [number] [operator number ...]"
}
