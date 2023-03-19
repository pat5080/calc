//
//  Addition.swift
//  calc
//
//  Created by Patrick Korczak on 19/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

class Addition{
    
    var numbers : [String]
    
    init(numbers: [String])
    {
        self.numbers = numbers
    }
    
    func add() -> Int {
        var total: Int = 0
        
        for number in numbers{
            total += Int(number) ?? 0
        }
        return total
    }
}
