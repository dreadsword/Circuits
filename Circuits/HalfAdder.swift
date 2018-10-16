//
//  HalfAdder.swift
//  Circuits
//
//  Created by Robert Dodson on 10/15/18.
//  Copyright © 2018 Robert Dodson. All rights reserved.
//

import Foundation

class HalfAdder
{
    var Sum: XOR
    var Carry: AND
    
    init(_ in1:@escaping () -> UInt,_ in2:@escaping () -> UInt)
    {
        Sum = XOR(in1,in2)
        Carry = AND(in1,in2)
    }
    
    func SumOut() -> UInt { return Sum.output() }
    func CarryOut() -> UInt { return Carry.output() }
}
