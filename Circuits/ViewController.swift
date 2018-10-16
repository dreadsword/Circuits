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
    
    @IBOutlet var a_decimalText: NSTextField!
    @IBOutlet var b_decimalText: NSTextField!
    @IBOutlet var total_decimalText: NSTextField!
    
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
        
        init_circuit()
    }
    
    func init_circuit()
    {
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

    func calcDecimals()
    {
        var a_decimal: Int = 0
        
        let a0 = 1 * Int(SwitchA0.output())
        let a1 = 2 * Int(SwitchA1.output())
        let a2 = 4 * Int(SwitchA2.output())
        let a3 = 8 * Int(SwitchA3.output())
        let a4 = 16 * Int(SwitchA4.output())
        let a5 = 32 * Int(SwitchA5.output())
        let a6 = 64 * Int(SwitchA6.output())
        let a7 = 128 * Int(SwitchA7.output())
        
        a_decimal = a0
        a_decimal = a_decimal + a1
        a_decimal = a_decimal + a2
        a_decimal = a_decimal + a3
        a_decimal = a_decimal + a4
        a_decimal = a_decimal + a5
        a_decimal = a_decimal + a6
        a_decimal = a_decimal + a7
        
        a_decimalText.integerValue = Int(a_decimal)
        
        
        var b_decimal: Int = 0
        
        let b0 = 1 * Int(SwitchB0.output())
        let b1 = 2 * Int(SwitchB1.output())
        let b2 = 4 * Int(SwitchB2.output())
        let b3 = 8 * Int(SwitchB3.output())
        let b4 = 16 * Int(SwitchB4.output())
        let b5 = 32 * Int(SwitchB5.output())
        let b6 = 64 * Int(SwitchB6.output())
        let b7 = 128 * Int(SwitchB7.output())
        
        b_decimal = b0
        b_decimal = b_decimal + b1
        b_decimal = b_decimal + b2
        b_decimal = b_decimal + b3
        b_decimal = b_decimal + b4
        b_decimal = b_decimal + b5
        b_decimal = b_decimal + b6
        b_decimal = b_decimal + b7
        
        b_decimalText.integerValue = Int(b_decimal)
        
        
        var c_decimal: Int = 0
        
        let c0 = 1 * Int(Light0.output())
        let c1 = 2 * Int(Light1.output())
        let c2 = 4 * Int(Light2.output())
        let c3 = 8 * Int(Light3.output())
        let c4 = 16 * Int(Light4.output())
        let c5 = 32 * Int(Light5.output())
        let c6 = 64 * Int(Light6.output())
        let c7 = 128 * Int(Light7.output())
        
        c_decimal = c0
        c_decimal = c_decimal + c1
        c_decimal = c_decimal + c2
        c_decimal = c_decimal + c3
        c_decimal = c_decimal + c4
        c_decimal = c_decimal + c5
        c_decimal = c_decimal + c6
        c_decimal = c_decimal + c7
        
        total_decimalText.integerValue = Int(c_decimal)
        
        
        if (Light8.output() == 1)
        {
            total_decimalText.textColor = NSColor.red
        }
        else
        {
            total_decimalText.textColor = NSColor.white
        }
    }
    
    
    @IBAction func a_decimalAction(_ sender: Any)
    {
        let val = a_decimalText.intValue
        
        SwitchA0.set(value:(val & 0b00000001) != 0)
        SwitchA1.set(value:(val & 0b00000010) != 0)
        SwitchA2.set(value:(val & 0b00000100) != 0)
        SwitchA3.set(value:(val & 0b00001000) != 0)
        SwitchA4.set(value:(val & 0b00010000) != 0)
        SwitchA5.set(value:(val & 0b00100000) != 0)
        SwitchA6.set(value:(val & 0b01000000) != 0)
        SwitchA7.set(value:(val & 0b10000000) != 0)
        
        updateAll()
    }
    
    
    @IBAction func b_decimalAction(_ sender: Any)
    {
        let val = b_decimalText.intValue
        
        SwitchB0.set(value:(val & 0b00000001) != 0)
        SwitchB1.set(value:(val & 0b00000010) != 0)
        SwitchB2.set(value:(val & 0b00000100) != 0)
        SwitchB3.set(value:(val & 0b00001000) != 0)
        SwitchB4.set(value:(val & 0b00010000) != 0)
        SwitchB5.set(value:(val & 0b00100000) != 0)
        SwitchB6.set(value:(val & 0b01000000) != 0)
        SwitchB7.set(value:(val & 0b10000000) != 0)
        
        updateAll()
    }
    
 
    @IBAction func clearAction(_ sender: Any)
    {
        SwitchA0.set(value:false)
        SwitchA1.set(value:false)
        SwitchA2.set(value:false)
        SwitchA3.set(value:false)
        SwitchA4.set(value:false)
        SwitchA5.set(value:false)
        SwitchA6.set(value:false)
        SwitchA7.set(value:false)
        
        SwitchB0.set(value:false)
        SwitchB1.set(value:false)
        SwitchB2.set(value:false)
        SwitchB3.set(value:false)
        SwitchB4.set(value:false)
        SwitchB5.set(value:false)
        SwitchB6.set(value:false)
        SwitchB7.set(value:false)
        
        updateAll()
    }
    
    
    @IBAction func buttonAction(_ sender: Any)
    {
        updateAll()
    }
    
    
    func updateAll()
    {
        Light0.setState()
        Light1.setState()
        Light2.setState()
        Light3.setState()
        Light4.setState()
        Light5.setState()
        Light6.setState()
        Light7.setState()
        Light8.setState()
        
        calcDecimals()
    }
    
    
    override var representedObject: Any?
    {
        didSet
        {
        }
    }


}

