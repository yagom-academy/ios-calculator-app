//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 
// 
import UIKit

class ViewController: UIViewController {
    enum CalculatorMode {
        case decimal
        case binary
    }

    var mode: CalculatorMode = .decimal
    let decimalCalculator = DecimalCalculator()
    let binaryCalculator = BinaryCalculator()
    
    @IBOutlet var zeroButton: MyButton!
    @IBOutlet var oneButton: MyButton!
    @IBOutlet var twoButton: MyButton!
    @IBOutlet var threeButton: MyButton!
    @IBOutlet var fourAndButton: MyButton!
    @IBOutlet var fiveNandButton: MyButton!
    @IBOutlet var sixXorButton: MyButton!
    @IBOutlet var sevenOrButton: MyButton!
    @IBOutlet var eightNorButton: MyButton!
    @IBOutlet var nineNotButton: MyButton!
    @IBOutlet var dotButton: MyButton!
    @IBOutlet var equalButton: MyButton!
    @IBOutlet var plusButton: MyButton!
    @IBOutlet var minusButton: MyButton!
    @IBOutlet var multiplyButton: MyButton!
    @IBOutlet var divideButton: MyButton!
    @IBOutlet var decimalBinaryModeButton: MyButton!
    @IBOutlet var plusMinusButton: MyButton!
    @IBOutlet var clearButton: MyButton!
    @IBOutlet var screenText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func updateScreenNumber(_ sender: MyButton) {
        if mode == .decimal {
            screenText.text = decimalCalculator.screenNumber
        } else if mode == .binary {
            screenText.text = binaryCalculator.screenNumber
        }
    }
    
    @IBAction func zeroNumber(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "0")
        } else {
            binaryCalculator.receiveInput(buttonType: "0")
        }
    }
    
    @IBAction func oneNumber(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "1")
        } else {
            binaryCalculator.receiveInput(buttonType: "1")
        }
    }
    
    @IBAction func twoNumber(_ sender: MyButton) {
        decimalCalculator.inputMathematicsSign(buttonText: "2")
    }
    
    @IBAction func threeNumber(_ sender: MyButton) {
        decimalCalculator.inputMathematicsSign(buttonText: "3")
    }
    
    @IBAction func fourNumberOrAndSign(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "4")
        } else {
            binaryCalculator.receiveInput(buttonType: "&")
        }
    }
    
    @IBAction func fiveNumberOrNandSign(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "5")
        } else {
            binaryCalculator.receiveInput(buttonType: "~&")
        }
    }
    
    @IBAction func sixNumberOrXorSign(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "6")
        } else {
            binaryCalculator.receiveInput(buttonType: "^")
        }
    }
    
    @IBAction func sevenNumberOrOrButton(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "7")
        } else {
            binaryCalculator.receiveInput(buttonType: "|")
        }
    }
    
    @IBAction func eightNumberOrNor(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "8")
        } else {
            binaryCalculator.receiveInput(buttonType: "~|")
        }
    }
    
    @IBAction func nineNumberOrNot(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "9")
        } else {
            binaryCalculator.receiveInput(buttonType: "~")
        }
    }
    
    @IBAction func dotSign(_ sender: MyButton) {
       decimalCalculator.inputMathematicsSign(buttonText: ".") 
    }
    
    @IBAction func equalSign(_ sender: MyButton) {
        if mode == .decimal {
        decimalCalculator.inputMathematicsSign(buttonText: "=")
        } else {
            binaryCalculator.receiveInput(buttonType: "=")
        }
    }
    
    @IBAction func plusSign(_ sender: MyButton) {
       if mode == .decimal {
        decimalCalculator.inputMathematicsSign(buttonText: "+")
        } else {
            binaryCalculator.receiveInput(buttonType: "+")
        }
    }
    
    @IBAction func minusSign(_ sender: MyButton) {
        if mode == .decimal {
        decimalCalculator.inputMathematicsSign(buttonText: "-")
        } else {
            binaryCalculator.receiveInput(buttonType: "-")
        }
    }
    
    @IBAction func multiplySign(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "x")
        } else {
            binaryCalculator.receiveInput(buttonType: ">>")
        }
    }
    
    @IBAction func divideSign(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "/")
        } else {
            binaryCalculator.receiveInput(buttonType: "<<")
        }
    }
    
    @IBAction func changeCalculatorMode(_ sender: MyButton) {
        if mode == .decimal {
            decimalMode()
        } else {
            binaryMode()
        }
    }
    
    @IBAction func plusMinusSign(_ sender: MyButton) {
        // calculator.receiveInput(buttonType: "")
    }
    
    @IBAction func clearSign(_ sender: MyButton) {
        if mode == .decimal {
            decimalCalculator.inputMathematicsSign(buttonText: "c")
        } else {
            binaryCalculator.receiveInput(buttonType: "c")
        }
    }
    
    func decimalMode() {
        mode = .binary
        decimalCalculator.reset()
        dotButton.isHidden = true
        twoButton.isHidden = true
        threeButton.isHidden = true
        fourAndButton.setTitle("AND", for: .normal)
        fourAndButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        fiveNandButton.setTitle("NAND", for: .normal)
        fiveNandButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        sixXorButton.setTitle("XOR", for: .normal)
        sixXorButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        sevenOrButton.setTitle("OR", for: .normal)
        sevenOrButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        eightNorButton.setTitle("NOR", for: .normal)
        eightNorButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        nineNotButton.setTitle("NOT", for: .normal)
        nineNotButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        divideButton.setTitle("<<", for: .normal)
        multiplyButton.setTitle(">>", for: .normal)
    }

    func binaryMode() {
        mode = .decimal
        dotButton.isHidden = false
        twoButton.isHidden = false
        threeButton.isHidden = false
        fourAndButton.setTitle("4", for: .normal)
        fourAndButton.titleLabel?.font = UIFont.systemFont(ofSize: 34)
        fiveNandButton.setTitle("5", for: .normal)
        fiveNandButton.titleLabel?.font = UIFont.systemFont(ofSize: 34)
        sixXorButton.setTitle("6", for: .normal)
        sixXorButton.titleLabel?.font = UIFont.systemFont(ofSize: 34)
        sevenOrButton.setTitle("7", for: .normal)
        sevenOrButton.titleLabel?.font = UIFont.systemFont(ofSize: 34)
        eightNorButton.setTitle("8", for: .normal)
        eightNorButton.titleLabel?.font = UIFont.systemFont(ofSize: 34)
        nineNotButton.setTitle("9", for: .normal)
        nineNotButton.titleLabel?.font = UIFont.systemFont(ofSize: 34)
        divideButton.setTitle("÷", for: .normal)
        multiplyButton.setTitle("×", for: .normal)
        
    }
}
