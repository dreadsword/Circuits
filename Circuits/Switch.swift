//
//  Switch.swift
//  Circuits
//
//  Created by Robert Dodson on 10/15/18.
//  Copyright © 2018 Robert Dodson. All rights reserved.
//

import Foundation
import Cocoa

class Switch
{
    let theswitch: NSButton
    
    init(aswitch:NSButton)
    {
        theswitch = aswitch
    }
    
    func set(value:Bool)
    {
        theswitch.state = value == true ? NSControl.StateValue.on : NSControl.StateValue.off
    }
    
    func output() -> UInt
    {
        return theswitch.state == .on ? 1 : 0
    }
}

