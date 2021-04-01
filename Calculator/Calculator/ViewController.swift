//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    enum CalculatorMode {
        case decimal
        case binary
    }
    var mode: CalculatorMode = .decimal
    @IBOutlet var screenText: UILabel!
    
    @IBAction func changeMode(_ sender: MyButton) {
        if mode == .decimal {
            mode = .binary
            dot.isHidden = true
            num2.isHidden = true
            num3.isHidden = true
            num4.setTitle("&", for: .normal)
            num5.setTitle("~&", for: .normal)
            num6.setTitle("^", for: .normal)
            num7.setTitle("|", for: .normal)
            num8.setTitle("~|", for: .normal)
            num9.setTitle("~", for: .normal)
            divideBtn.setTitle("<<", for: .normal)
            multiplyBtn.setTitle(">>", for: .normal)
        } else {
            mode = .decimal
            dot.isHidden = false
            num2.isHidden = false
            num3.isHidden = false
            num4.setTitle("4", for: .normal)
            num5.setTitle("5", for: .normal)
            num6.setTitle("6", for: .normal)
            num7.setTitle("7", for: .normal)
            num8.setTitle("8", for: .normal)
            num9.setTitle("9", for: .normal)
            divideBtn.setTitle("/", for: .normal)
            multiplyBtn.setTitle("x", for: .normal)
        }
    }
    
    @IBOutlet var dot: MyButton!
    @IBOutlet var num0: MyButton!
    @IBOutlet var num1: MyButton!
    @IBOutlet var num2: MyButton!
    @IBOutlet var num3: MyButton!
    @IBOutlet var num4: MyButton!
    @IBOutlet var num5: MyButton!
    @IBOutlet var num6: MyButton!
    @IBOutlet var num7: MyButton!
    @IBOutlet var num8: MyButton!
    @IBOutlet var num9: MyButton!
    @IBOutlet var plusBtn: MyButton!
    @IBOutlet var minusBtn: MyButton!
    @IBOutlet var multiplyBtn: MyButton!
    @IBOutlet var divideBtn: MyButton!
    @IBOutlet var clearBtn: MyButton!
    @IBOutlet var equalBtn: MyButton!
    @IBOutlet var decimalBinaryModeBtn: MyButton!
    @IBOutlet var plusMinusBtn: MyButton!
    
    let calculator = DemicalCalculator()
    let binaryCalculrator = BinaryCalculator()
    
    @IBAction func numBtn(_ sender: MyButton) {
        switch sender {
        case num0:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case num1:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case num2:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case num3:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case num4:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case num5:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case num6:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case num7:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case num8:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case num9:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case dot:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case plusBtn:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case minusBtn:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case multiplyBtn:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case divideBtn:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case equalBtn:
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        case clearBtn:
            print("clear button")
            calculator.receiveInput(buttonType: (sender.titleLabel?.text)!)
        default:
            break
        }
        screenText.text = calculator.screenNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
