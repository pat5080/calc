//
//  ExceptionHandler.swift
//  calc
//
//  Created by Patrick Korczak on 19/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

class CalculateError
{
    
}

extension FileHandle: TextOutputStream {
  public func write(_ string: String) {
    let data = Data(string.utf8)
    self.write(data)
  }
}
