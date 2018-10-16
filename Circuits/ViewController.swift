//
//  ViewController.swift
//  Circuits
//
//  Created by Robert Dodson on 10/15/18.
//  Copyright © 2018 Robert Dodson. All rights reserved.
//

import Cocoa

class ViewController: NSViewController
{

    @IBOutlet var a_switch_0: NSButton!
    @IBOutlet var a_switch_1: NSButton!
    @IBOutlet var a_switch_2: NSButton!
    @IBOutlet var a_switch_3: NSButton!
    @IBOutlet var a_switch_4: NSButton!
    @IBOutlet var a_switch_5: NSButton!
    @IBOutlet var a_switch_6: NSButton!
    @IBOutlet var a_switch_7: NSButton!

    @IBOutlet var b_switch_0: NSButton!
    @IBOutlet var b_switch_1: NSButton!
    @IBOutlet var b_switch_2: NSButton!
    @IBOutlet var b_switch_3: NSButton!
    @IBOutlet var b_switch_4: NSButton!
    @IBOutlet var b_switch_5: NSButton!
    @IBOutlet var b_switch_6: NSButton!
    @IBOutlet var b_switch_7: NSButton!
    
    @IBOutlet var light_0: NSButton!
    @IBOutlet var light_1: NSButton!
    @IBOutlet var light_2: NSButton!
    @IBOutlet var light_3: NSButton!
    @IBOutlet var light_4: NSButton!
    @IBOutlet var light_5: NSButton!
    @IBOutlet var light_6: NSButton!
    @IBOutlet var light_7: NSButton!
    @IBOutlet var light_8: NSButton!
    
    
    var SwitchA0: Switch!
    var SwitchA1: Switch!
    var SwitchA2: Switch!
    var SwitchA3: Switch!
    var SwitchA4: Switch!
    var SwitchA5: Switch!
    var SwitchA6: Switch!
    var SwitchA7: Switch!
    
    var SwitchB0: Switch!
    var SwitchB1: Switch!
    var SwitchB2: Switch!
    var SwitchB3: Switch!
    var SwitchB4: Switch!
    var SwitchB5: Switch!
    var SwitchB6: Switch!
    var SwitchB7: Switch!
    
    var Light0: Light!
    var Light1: Light!
    var Light2: Light!
    var Light3: Light!
    var Light4: Light!
    var Light5: Light!
    var Light6: Light!
    var Light7: Light!
    var Light8: Light!
    
    var theAdder: EightBitAdder!
    
    func zero() -> UInt { return 0 }
    func one() -> UInt    { return 1 }

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        SwitchA0 = Switch(aswitch:a_switch_0);
        SwitchA1 = Switch(aswitch:a_switch_1);
        SwitchA2 = Switch(aswitch:a_switch_2);
        SwitchA3 = Switch(aswitch:a_switch_3);
        SwitchA4 = Switch(aswitch:a_switch_4);
        SwitchA5 = Switch(aswitch:a_switch_5);
        SwitchA6 = Switch(aswitch:a_switch_6);
        SwitchA7 = Switch(aswitch:a_switch_7);
        
        SwitchB0 = Switch(aswitch:b_switch_0);
        SwitchB1 = Switch(aswitch:b_switch_1);
        SwitchB2 = Switch(aswitch:b_switch_2);
        SwitchB3 = Switch(aswitch:b_switch_3);
        SwitchB4 = Switch(aswitch:b_switch_4);
        SwitchB5 = Switch(aswitch:b_switch_5);
        SwitchB6 = Switch(aswitch:b_switch_6);
        SwitchB7 = Switch(aswitch:b_switch_7);
        

        theAdder = EightBitAdder()
        theAdder.adder0 = FullAdder(carryin: zero,                     input1: SwitchA0.output, input2: SwitchB0.output)
        theAdder.adder1 = FullAdder(carryin: theAdder.adder0.CarryOut, input1: SwitchA1.output, input2: SwitchB1.output)
        theAdder.adder2 = FullAdder(carryin: theAdder.adder1.CarryOut, input1: SwitchA2.output, input2: SwitchB2.output)
        theAdder.adder3 = FullAdder(carryin: theAdder.adder2.CarryOut, input1: SwitchA3.output, input2: SwitchB3.output)
        theAdder.adder4 = FullAdder(carryin: theAdder.adder3.CarryOut, input1: SwitchA4.output, input2: SwitchB4.output)
        theAdder.adder5 = FullAdder(carryin: theAdder.adder4.CarryOut, input1: SwitchA5.output, input2: SwitchB5.output)
        theAdder.adder6 = FullAdder(carryin: theAdder.adder5.CarryOut, input1: SwitchA6.output, input2: SwitchB6.output)
        theAdder.adder7 = FullAdder(carryin: theAdder.adder6.CarryOut, input1: SwitchA7.output, input2: SwitchB7.output)
        
        
        Light0 = Light(alight:light_0, aninput:theAdder.adder0.SumOut);
        Light1 = Light(alight:light_1, aninput:theAdder.adder1.SumOut);
        Light2 = Light(alight:light_2, aninput:theAdder.adder2.SumOut);
        Light3 = Light(alight:light_3, aninput:theAdder.adder3.SumOut);
        Light4 = Light(alight:light_4, aninput:theAdder.adder4.SumOut);
        Light5 = Light(alight:light_5, aninput:theAdder.adder5.SumOut);
        Light6 = Light(alight:light_6, aninput:theAdder.adder6.SumOut);
        Light7 = Light(alight:light_7, aninput:theAdder.adder7.SumOut);
        Light8 = Light(alight:light_8, aninput:theAdder.adder7.CarryOut);
    }

    
    
    @IBAction func buttonAction(_ sender: Any)
    {
        print("CLICK")
        Light0.setState()
        Light1.setState()
        Light2.setState()
        Light3.setState()
        Light4.setState()
        Light5.setState()
        Light6.setState()
        Light7.setState()
        Light8.setState()
    }
    
    
    override var representedObject: Any?
    {
        didSet
        {
        // Update the view, if already loaded.
        }
    }


}

