//
//  AND.swift
//  Circuits
//
//  Created by Robert Dodson on 10/15/18.
//  Copyright © 2018 Robert Dodson. All rights reserved.
//

import Foundation

class AND : Gate
{
    func output() -> UInt
    {
        return input1() & input2()
    }
}
