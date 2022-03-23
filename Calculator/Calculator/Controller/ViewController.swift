//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var calculatorInput = ""
    private var hasFirstInput = false

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var inputStackView: UIStackView!
    @IBOutlet weak var firstStackView: UIStackView!
    @IBOutlet weak var firstOperatorLabel: UILabel!
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var followingStackView: UIStackView!
    @IBOutlet weak var followingOperatorLabel: UILabel!
    @IBOutlet weak var followingNumberLabel: UILabel!
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var prefixButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var devideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var dotButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var doubleZeroButton: UIButton!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        guard let input = try? findNumber(of: sender) else {
            return
        }
        let currentNumber = numberLabel.text
        
        guard isValidNumber(input: input, currentNumber: currentNumber) else {
            return
        }
        if hasFirstInput == true, currentNumber == "0", input.contains("0") {
            numberLabel.text = "0"
        } else if currentNumber == "0", input != "." {
            numberLabel.text = input
        } else {
            numberLabel.text?.append(input)
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let input = try? findOperator(of: sender) else {
            return
        }
        if numberLabel.text == "0" && hasFirstInput == false {
            return
        }
        addStack()
        if input == "=" {
            let result: Double
            do {
                result = try ExpressionParser.parse(from: calculatorInput).result()
                // NumberFormatter로 , 넣기
                // 반올림하기
                // 자리수 20이하인지 확인하기
                numberLabel.text = String(result)
                operatorLabel.text = ""
            } catch {
                guard let nan = error as? CalculatorError,
                      nan == .unexpectedData else {
                    return
                }
                operatorLabel.text = ""
                numberLabel.text = "NaN"
            }
        } else if hasFirstInput == true {
            operatorLabel.text = input
            numberLabel.text = "0"
        }
    }
    
    @IBAction func touchUpFunctionButton(_ sender: UIButton) {
        try? findFunction(of: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
        operatorLabel.text = ""
    }
    
    private func addStack() {
        let stack = UIStackView()
        let operatorStackLabel = UILabel()
        let numberStackLabel = UILabel()
        
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .fill
        
        numberStackLabel.textColor = .white
        operatorStackLabel.textColor = .white
        
        operatorStackLabel.text = hasFirstInput == false ? "": operatorLabel.text
        numberStackLabel.text = numberLabel.text
        
        stack.addArrangedSubview(operatorStackLabel)
        stack.addArrangedSubview(numberStackLabel)
        
        stack.isHidden = true
        
        inputStackView.addArrangedSubview(stack)
        
        UIView.animate(withDuration: 0.3) {
            stack.isHidden = false
        }
        
        if hasFirstInput == false {
            hasFirstInput = true
        }
        
        var newInput: String = operatorLabel.text ?? ""
        newInput.append(numberLabel.text ?? "")
        calculatorInput.append(contentsOf: newInput)
        
        scrollView
            .setContentOffset(
                CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
                animated: true
            )
    }
    
    private func removeStack() {
        inputStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        hasFirstInput = false
        operatorLabel.text = ""
        numberLabel.text = "0"
        calculatorInput = ""
    }

    private func findNumber(of button: UIButton) throws -> String {
        switch button {
        case dotButton:
            return "."
        case zeroButton:
            return "0"
        case doubleZeroButton:
            return "00"
        case oneButton:
            return "1"
        case twoButton:
            return "2"
        case threeButton:
            return "3"
        case fourButton:
            return "4"
        case fiveButton:
            return "5"
        case sixButton:
            return "6"
        case sevenButton:
            return "7"
        case eightButton:
            return "8"
        case nineButton:
            return "9"
        default:
            throw CalculatorError.unexpectedData
        }
    }
    
    private func findOperator(of button: UIButton) throws -> String {
        switch button {
        case addButton:
            return "+"
        case subtractButton:
            return "-"
        case devideButton:
            return "/"
        case multiplyButton:
            return "*"
        case equalButton:
            return "="
        default:
            throw CalculatorError.unexpectedData
        }
    }
    
    private func findFunction(of button: UIButton) throws {
        switch button {
        case acButton:
            removeStack()
        case ceButton:
            numberLabel.text = "0"
        case prefixButton:
            configurePrefix()
        default:
            throw CalculatorError.unexpectedData
        }
    }
    
    private func configurePrefix() {
        guard let currentNumber = numberLabel.text,
              currentNumber != "0" else {
            return
        }
        
        if currentNumber.first == "+" {
            numberLabel.text?.removeFirst()
            numberLabel.text?.insert("-", at: currentNumber.startIndex)
        } else if currentNumber.first == "-" {
            numberLabel.text?.removeFirst()
            numberLabel.text?.insert("+", at: currentNumber.startIndex)
        } else {
            numberLabel.text = "-" + currentNumber
        }
    }
    
    private func isValidNumber(input: String, currentNumber: String?) -> Bool {
        let isValidZero = true
        let isValidDot = true
        
        if hasFirstInput == false, currentNumber == "0", input.contains("0") {
            return !isValidZero
        }
        if ((currentNumber?.contains(".")) == true), input == "." {
            return !isValidDot
        }
        return true
    }

}

