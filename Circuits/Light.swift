//
//  Light.swift
//  Circuits
//
//  Created by Robert Dodson on 10/15/18.
//  Copyright © 2018 Robert Dodson. All rights reserved.
//

import Foundation
import Cocoa

class Light
{
    let thelight: NSButton
    let input: () -> UInt
    
    init(alight:NSButton,aninput:@escaping () -> UInt)
    {
        thelight = alight
        input = aninput
    }
    
    func setState()
    {
        let state = input() == 1 ? NSControl.StateValue.on : NSControl.StateValue.off
        thelight.state = state
    }
    
    func output() -> UInt
    {
        return thelight.state == NSControl.StateValue.on ? 1 : 0
    }
}

