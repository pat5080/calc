//
//  Subtraction.swift
//  calc
//
//  Created by Patrick Korczak on 19/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

class Subtraction{
    
    var numbers : [String]
    
    init(numbers: [String])
    {
        self.numbers = numbers
    }
    
    func subtract() -> Int {
        var total: Int = Int(numbers[0]) ?? 0
        
        for index in 1..<numbers.count{
            total -= Int(numbers[index]) ?? 0
        }
        return total
    }
}
