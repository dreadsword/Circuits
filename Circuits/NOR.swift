//
//  NOR.swift
//  Circuits
//
//  Created by Robert Dodson on 10/15/18.
//  Copyright © 2018 Robert Dodson. All rights reserved.
//

import Foundation

class NOR : Gate
{
    func output() -> UInt
    {
        return input1() | input2() == 0 ? 1 : 0
    }
}
