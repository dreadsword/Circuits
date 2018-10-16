import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


//
// Gate type
//
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


//
// AND gate
//
class AND : Gate
{
    func output() -> UInt
    {
        return input1() & input2()
    }
}

//
// OR gate
//
class OR : Gate
{
    func output() -> UInt
    {
        return input1() | input2()
    }
}


//
// NOR gate
//
class NOR : Gate
{
    func output() -> UInt
    {
        return input1() | input2() == 0 ? 1 : 0
    }
}


//
// NAND gate
//
class NAND : Gate
{
    func output() -> UInt
    {
        return input1() & input2() == 0 ? 1 : 0
    }
}


//
// XOR gate
//
class XOR : Gate
{
    func output() -> UInt
    {
        return input1() ^ input2()
    }
}


//
// Inverter
//
class Inverter
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


//
// A switch, contains a handle to it's UI representation
//
class Switch
{
    let theswitch: UISwitch
    
    init(aswitch:UISwitch)
    {
        theswitch = aswitch
    }
    
    func output() -> UInt
    {
        return theswitch.isOn ? 1 : 0
    }
}


//
// A light, contains a handle to it's UI representation
//
class Light
{
    let thelight: UISwitch
    let input: () -> UInt

    
    init(alight:UISwitch,aninput:@escaping () -> UInt)
    {
        thelight = alight
        input = aninput
    }
    
    func setState()
    {
        let state = input() == 1 ? true : false
        thelight.setOn(state, animated:true)
    }
}


//
// test the gates
//
func zero() -> UInt { return 0 }
func one() -> UInt    { return 1 }

print("OR")
let o00 = OR(zero,zero)
let o01 = OR(zero,one)
let o10 = OR(one,zero)
let o11 = OR(one,one)

print(o00.output(),o01.output())
print(o10.output(),o11.output())
print()


print("AND")
let a00 = AND(zero,zero)
let a01 = AND(zero,one)
let a10 = AND(one,zero)
let a11 = AND(one,one)

print(a00.output(),a01.output())
print(a10.output(),a11.output())
print()


print("NOR")
let n00 = NOR(zero,zero)
let n01 = NOR(zero,one)
let n10 = NOR(one,zero)
let n11 = NOR(one,one)

print(n00.output(),n01.output())
print(n10.output(),n11.output())
print()

print("NAND")
let na00 = NAND(zero,zero)
let na01 = NAND(zero,one)
let na10 = NAND(one,zero)
let na11 = NAND(one,one)

print(na00.output(),na01.output())
print(na10.output(),na11.output())
print()

print("XOR")
let x00 = XOR(zero,zero)
let x01 = XOR(zero,one)
let x10 = XOR(one,zero)
let x11 = XOR(one,one)

print(x00.output(),x01.output())
print(x10.output(),x11.output())
print()

print("INVERT")
let i1 = Inverter(one)
let i0 = Inverter(zero)
print(i1.output(),i0.output())
print("-------")
print
//
// Tests end
//



//
// Half adder
//
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


//
// Full adder
//
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


//
// UI
//
let leftMargin = 20
let view = UIView(frame: CGRect(x: 0, y: 0, width: 700, height: 667)) // iPhone 6 proportions
view.backgroundColor = UIColor.gray

let label = UILabel(frame: CGRect(x: leftMargin, y: 5, width: 300, height: 44))
label.text = "Circuit"
label.textColor = UIColor.white
view.addSubview(label)

let switch1button = UISwitch(frame: CGRect(x: leftMargin, y: 55, width: 0, height: 0))
let switch2button = UISwitch(frame: CGRect(x: leftMargin + 60, y: 55, width: 0, height: 0))
let switch3button = UISwitch(frame: CGRect(x: leftMargin + 120, y: 55, width: 0, height: 0))

view.addSubview(switch1button)
view.addSubview(switch2button)
view.addSubview(switch3button)

let lightswitch1 = UISwitch(frame: CGRect(x: leftMargin, y: 120, width: 0, height: 0))
let lightswitch2 = UISwitch(frame: CGRect(x: leftMargin + 60, y: 120, width: 0, height: 0))

view.addSubview(lightswitch1)
view.addSubview(lightswitch2)






//
// 8 bit adder
//
var a_switches = [Switch]()
var b_switches = [Switch]()
var lights = [Light]()
var adders = [FullAdder]()


func evalboard()
{
    for index in 0..<9
    {
        lights[index].setState()
    }
}

class boardResponder: NSObject
{
    @objc func switched() { evalboard() }
}

let responder = boardResponder()


var ypos = 250
var xpos = 500

for _ in 0..<8
{
    let switchbutton = UISwitch(frame: CGRect(x: xpos, y: ypos, width: 0, height: 0))
    switchbutton.addTarget(responder, action: #selector(boardResponder.switched), for:.touchUpInside)
    view.addSubview(switchbutton)
    
    let aswitch = Switch(aswitch:switchbutton)
    a_switches.append(aswitch)
   
    xpos = xpos - 60
}


xpos = 500
for _ in 0..<8
{
    let switchbutton = UISwitch(frame: CGRect(x: xpos, y: ypos + 50, width: 0, height: 0))
    switchbutton.addTarget(responder, action: #selector(boardResponder.switched), for:.touchUpInside)
    view.addSubview(switchbutton)
    
    let aswitch = Switch(aswitch:switchbutton)
    b_switches.append(aswitch)

    xpos = xpos - 60
}


var adder0 = FullAdder(carryin:zero,input1:a_switches[0].output,input2:b_switches[0].output)
adders.append(adder0)
for index in 1..<7
{
    let adder = FullAdder(carryin:adders[index - 1].CarryOut,input1:a_switches[index].output,input2:b_switches[index].output)
    adders.append(adder)
}
var adder8 = FullAdder(carryin:adders[6].CarryOut,input1:a_switches[7].output,input2:b_switches[7].output)
adders.append(adder8)



xpos = 500

for index in 0..<8
{
    let lightbutton = UISwitch(frame: CGRect(x: xpos, y: ypos + 150, width: 0, height: 0))
    view.addSubview(lightbutton)

    let alight = Light(alight:lightbutton, aninput: adders[index].SumOut)
    lights.append(alight)

    xpos = xpos - 60
}
let lightbutton9 = UISwitch(frame: CGRect(x: xpos, y: ypos + 150, width: 0, height: 0))
view.addSubview(lightbutton9)

let alight9 = Light(alight:lightbutton9, aninput: adders[7].CarryOut)
lights.append(alight9)












//
// Create a logic board by connecting switches, gates, lights, and all to the UI
//
var switch1 = Switch(aswitch:switch1button)
var switch2 = Switch(aswitch:switch2button)
var switch3 = Switch(aswitch:switch3button)
var adder = FullAdder(carryin:switch3.output,input1:switch1.output,input2:switch2.output)
let light1 = Light(alight:lightswitch1, aninput:adder.SumOut)
let light2 = Light(alight:lightswitch2, aninput:adder.CarryOut)



//
// Handle user clicks
//
func eval()
{
    light1.setState()
    light2.setState()
}

class switchResponder: NSObject
{
    @objc func switched() { eval() }
}

let aswitchresponder = switchResponder()

switch1button.addTarget(aswitchresponder, action: #selector(switchResponder.switched), for:.touchUpInside)
switch2button.addTarget(aswitchresponder, action: #selector(switchResponder.switched), for:.touchUpInside)
switch3button.addTarget(aswitchresponder, action: #selector(switchResponder.switched), for:.touchUpInside)



PlaygroundPage.current.liveView = view
