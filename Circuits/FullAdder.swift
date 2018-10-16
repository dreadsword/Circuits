//
//  FullAdder.swift
//  Circuits
//
//  Created by Robert Dodson on 10/15/18.
//  Copyright © 2018 Robert Dodson. All rights reserved.
//

import Foundation

class FullAdder
{
    var CarryAdder: HalfAdder
    var InputAdder: HalfAdder
    var Carry: OR
    
    
    init(carryin:@escaping () -> UInt,input1:@escaping () -> UInt, input2:@escaping () -> UInt)
    {
        InputAdder = HalfAdder(input1,input2)
        CarryAdder = HalfAdder(carryin,InputAdder.SumOut)
        Carry = OR(CarryAdder.CarryOut, InputAdder.CarryOut)
    }
    
    
    func SumOut() -> UInt { return CarryAdder.SumOut() }
    func CarryOut() -> UInt { return Carry.output() }
}
