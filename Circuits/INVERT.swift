//
//  INVERT.swift
//  Circuits
//
//  Created by Robert Dodson on 10/15/18.
//  Copyright © 2018 Robert Dodson. All rights reserved.
//

import Foundation

class INVERT
{
    var input1: () -> UInt
    
    init(_ in1:@escaping () -> UInt)
    {
        input1 = in1
    }
    
    func output() -> UInt
    {
        return input1() == 1 ? 0 : 1
    }
}
