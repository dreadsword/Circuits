//
//  Gate.swift
//  Circuits
//
//  Created by Robert Dodson on 10/15/18.
//  Copyright © 2018 Robert Dodson. All rights reserved.
//

import Foundation

class Gate
{
    var input1: () -> UInt
    var input2: () -> UInt
    
    init(_ in1:@escaping () -> UInt,_ in2:@escaping () -> UInt)
    {
        input1 = in1
        input2 = in2
    }
}
