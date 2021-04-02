//
//  Calculator - ViewController.swift
//  Created by Neph.
//  Copyright © Neph. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clearButton: FunctionButton!
    @IBOutlet weak var signToggleButton: FunctionButton!
    @IBOutlet weak var modeToggleButton: FunctionButton!
    
    @IBOutlet weak var zeroButton: NumberButton!
    @IBOutlet weak var dotButton: NumberButton!
    @IBOutlet weak var oneButton: NumberButton!
    @IBOutlet weak var twoButton: NumberButton!
    @IBOutlet weak var threeButton: NumberButton!
    @IBOutlet weak var fourButton: NumberButton!
    @IBOutlet weak var fiveButton: NumberButton!
    @IBOutlet weak var sixButton: NumberButton!
    @IBOutlet weak var sevenButton: NumberButton!
    @IBOutlet weak var eightButton: NumberButton!
    @IBOutlet weak var nineButton: NumberButton!
    
    @IBOutlet weak var addForDecimalButton: OperatorButton!
    @IBOutlet weak var subtractForDecimalButton: OperatorButton!
    @IBOutlet weak var multiplyButton: OperatorButton!
    @IBOutlet weak var divideButton: OperatorButton!
    @IBOutlet weak var equalButton: OperatorButton!
    
    @IBOutlet weak var addForBinaryButton: OperatorButton!
    @IBOutlet weak var subtractForBinaryButton: OperatorButton!
    @IBOutlet weak var ANDButton: OperatorButton!
    @IBOutlet weak var NANDButton: OperatorButton!
    @IBOutlet weak var XORButton: OperatorButton!
    @IBOutlet weak var ORButton: OperatorButton!
    @IBOutlet weak var NORButton: OperatorButton!
    @IBOutlet weak var NOTButton: OperatorButton!
    @IBOutlet weak var shiftLeftButton: OperatorButton!
    @IBOutlet weak var shiftRightButton: OperatorButton!
    
    @IBOutlet var binaryOperatorButtons: [OperatorButton]!
    @IBOutlet var decimalNumberButtons: [NumberButton]!
    @IBOutlet var decimalOperatorButtons: [OperatorButton]!
    
    @IBOutlet weak var numberField: UILabel!
    
    private var decimalMode = true
    private var isOperatorOn = false
    @IBOutlet var toggledSwitch: OperatorButton?
    private var decimalCalculator = DecimalCalculator()
    private var binaryCalculator = BinaryCalculator()
    private var numberStack = Stack<String>()
    private var operatorStack = Stack<Operator>()
    
    @IBAction func touchUpNumber(_ sender: NumberButton) {
        if isOperatorOn {
            numberStack.push(numberField.text!)
            operatorStack.push(toggledSwitch!.operatorType)

            isOperatorOn = false
            toggledSwitch!.isOn = false
            toggledSwitch = nil
            numberField.text!.removeAll()
            
            numberField.text = sender.currentTitle
        } else {
            numberField.text!.append(sender.currentTitle!)
        }
    }
    
    @IBAction func touchUpOperator(_ sender: OperatorButton) {
        if isOperatorOn {
            toggledSwitch?.isOn = false
            toggledSwitch = sender
            toggledSwitch!.isOn = true
        }
        
        if operatorStack.isEmpty {
            if isOperatorOn {
                toggledSwitch?.isOn = false
                toggledSwitch = sender
                toggledSwitch!.isOn = true
            } else {
                sender.isOn = true
                toggledSwitch = sender
                isOperatorOn = true
            }
        } else {
            if sender.operatorType.precedence > operatorStack.top!.precedence {
                toggledSwitch = sender
                toggledSwitch!.isOn = true
                isOperatorOn = true
            } else {
                if isOperatorOn == false {
                    numberStack.push(numberField.text!)
                }
                while operatorStack.isEmpty == false && sender.operatorType.precedence <= operatorStack.top!.precedence {
                    
                    let secondNumber = numberStack.pop()!
                    let firstNumber = numberStack.pop()!
                    
                    let operateFunction = operatorStack.pop()!.function
                    let result = operateFunction(firstNumber, secondNumber)
                    numberStack.push(result)
                }
                
                toggledSwitch = sender
                toggledSwitch!.isOn = true
                isOperatorOn = true
                numberField.text = numberStack.top!
            }
        }
    }
      
    @IBAction func touchUpUnaryOperator(_ sender: OperatorButton) {
        if numberField.text == "" {
            sender.isOn = false
            return
        } else {
            let result = BinaryCalculator.NOT(firstNumber: numberField.text!)
            numberField.text = result
            sender.isOn = false
        }
    }
    
    @IBAction func touchUpToggleSign(_ sender: Any) {
        do {
            if decimalMode {
                let minusedInput = try DecimalCalculator.formatInput(numberField.text!) * -1
                numberField.text = try DecimalCalculator.formatResult(of: minusedInput)
            } else {
                let minusedInput = try BinaryCalculator.formatInput(numberField.text!) * -1
                numberField.text = try BinaryCalculator.formatResult(of: minusedInput)
            }
        } catch {
            return
        }
    }
    
    @IBAction func touchUpToggleMode(_ sender: Any) {
        decimalMode.toggle()
        clearButton(sender)
        reset()
        decimalNumberButtons.forEach({ $0.isHidden.toggle() })
        decimalOperatorButtons.forEach({ $0.isHidden.toggle() })
        binaryOperatorButtons.forEach({ $0.isHidden.toggle() })
    }
    
    @IBAction func clearButton(_ sender: Any) {
        numberField.text?.removeAll()
        toggledSwitch?.isOn = false
        toggledSwitch = nil
        isOperatorOn = false
        reset()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       initializeButtons()
    }
    
    func initializeButtons() {
        addForDecimalButton.operatorType = Operators.additionForDecimal
        subtractForDecimalButton.operatorType = Operators.subtractionForDecimal
        multiplyButton.operatorType = Operators.multiplication
        divideButton.operatorType = Operators.division
        
        addForBinaryButton.operatorType = Operators.additionForBinary
        subtractForBinaryButton.operatorType = Operators.subtractionForBinary
        ANDButton.operatorType = Operators.AND
        NANDButton.operatorType = Operators.NAND
        ORButton.operatorType = Operators.OR
        XORButton.operatorType = Operators.XOR
        NORButton.operatorType = Operators.NOR
        shiftLeftButton.operatorType = Operators.shiftLeft
        shiftRightButton.operatorType = Operators.shiftRight
    }
    
    func reset() {
        numberStack.reset()
        operatorStack.reset()
    }
    
}
