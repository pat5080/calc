//
//  Multiply.swift
//  calc
//
//  Created by Patrick Korczak on 23/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

class Multiply{
    
    var numbers : [String]
    
    init(numbers: [String])
    {
        self.numbers = numbers
    }
    
    func multiply() -> Int {
        var initialValue: Int = Int(numbers[0]) ?? 0
        
        for index in 1..<numbers.count{
            initialValue *= Int(numbers[index]) ?? 0
        }
        return initialValue
    }
}
