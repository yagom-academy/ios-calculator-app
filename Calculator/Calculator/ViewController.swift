//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
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
    
    @IBOutlet weak var equalButton: OperatorButton!
    @IBOutlet weak var subtractButton: OperatorButton!
    @IBOutlet weak var divideButton: OperatorButton!
    @IBOutlet weak var multiplyButton: OperatorButton!
    @IBOutlet weak var addButton: OperatorButton!
    
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
    private var decimalCalculator = DecimalCalculator()
    private var binaryCalculator = BinaryCalculator()
    
    @IBAction func touchUpNumber(_ sender: NumberButton) {
        if isOperatorOn {
            do {
                decimalCalculator.numberStack.push(try decimalCalculator.formatInput(numberField.text!))
                // 현재 on 돼있는 연산자를 operator stack에 push
            } catch {
                return // error 처리
            }
            
            numberField.text?.removeAll()
            numberField.text?.append(sender.currentTitle!)
        } else {
            numberField.text?.append(sender.currentTitle!)
        }
    }
    
    @IBAction func touchUpOperator(_ sender: OperatorButton) {
        if decimalCalculator.operatorStack.isEmpty {
            sender.isOn.toggle()
        } else {
            if sender.precedence > decimalCalculator.operatorStack.top!.precedence {
                sender.isOn.toggle()
                return
            }
            while sender.precedence <= decimalCalculator.operatorStack.top!.precedence {
                //pop 하면서 연산 진행
            }
        }
    }
    
    @IBAction func touchUpToggleSign(_ sender: Any) {
        do {
            if decimalMode {
                let minusedInput = try decimalCalculator.formatInput(numberField.text!) * -1
                numberField.text = try decimalCalculator.formatResult(of: minusedInput)
            } else {
                let minusedInput = try binaryCalculator.formatInput(numberField.text!) * -1
                numberField.text = try binaryCalculator.formatResult(of: minusedInput)
            }
        } catch {
            return
        }
    }
    
    @IBAction func touchUpToggleMode(_ sender: Any) {
        decimalMode.toggle()
        clearButton(sender)
        binaryCalculator.reset()
        decimalCalculator.reset()
        decimalNumberButtons.forEach({ $0.isHidden.toggle() })
        decimalOperatorButtons.forEach({ $0.isHidden.toggle() })
        binaryOperatorButtons.forEach({ $0.isHidden.toggle() })
    }
    
    @IBAction func clearButton(_ sender: Any) {
        numberField.text?.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
}
