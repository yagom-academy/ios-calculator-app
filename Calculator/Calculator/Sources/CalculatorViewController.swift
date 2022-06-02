//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    private var currentString: String = ""
    private var totalString: String = ""

    @IBOutlet private var stackView: UIStackView!

    // Buttons - Numbers
    @IBOutlet private weak var zeroButton: UIButton!
    @IBOutlet private weak var doubleZeroButton: UIButton!
    @IBOutlet private weak var oneButton: UIButton!
    @IBOutlet private weak var twoButton: UIButton!
    @IBOutlet private weak var threeButton: UIButton!
    @IBOutlet private weak var fourButton: UIButton!
    @IBOutlet private weak var fiveButton: UIButton!
    @IBOutlet private weak var sixButton: UIButton!
    @IBOutlet private weak var sevenButton: UIButton!
    @IBOutlet private weak var eightButton: UIButton!
    @IBOutlet private weak var nineButton: UIButton!

    // Buttons - Symbols
    @IBOutlet private weak var dotButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var multiplyButton: UIButton!
    @IBOutlet private weak var divideButton: UIButton!

    // Buttons - Functions
    @IBOutlet private weak var acButton: UIButton!
    @IBOutlet private weak var ceButton: UIButton!
    @IBOutlet private weak var plusMinusButton: UIButton!

    // Labels - Associate with Result
    @IBOutlet private weak var signLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func tappedAllClear(_ sender: UIButton) {
        makeCurrentStringToEmpty()
        makeTotalStringToEmpty()
        makeSignLabelTextToEmpty()
        makeValueLabelTextToZero()
        makeStackViewToEmpty()
    }
    
    private func makeCurrentStringToEmpty() {
        currentString = ""
    }
    
    private func makeTotalStringToEmpty() {
        totalString = ""
    }
    
    private func makeSignLabelTextToEmpty() {
        signLabel.text = ""
    }
    
    private func makeValueLabelTextToZero() {
        valueLabel.text = "0"
    }

    private func makeStackViewToEmpty() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func mapSign(sender: UIButton) -> String {
        switch sender {
        case plusButton:
            return String(OperatorItem.add.rawValue)
        case minusButton:
            return String(OperatorItem.subtract.rawValue)
        case multiplyButton:
            return String(OperatorItem.multiply.rawValue)
        case divideButton:
            return String(OperatorItem.divide.rawValue)
        default:
            return ""
        }
    }

    // 연산자 입력
    @IBAction private func tappedOperatorIntoEquation(_ sender: UIButton) {
        guard currentString.count != 0 && valueLabel.text != "" else {
            return
        }
        if totalString.isEmpty {
            guard let value = valueLabel.text else { return }
            if value.contains("-") {
                totalString += "&\(value.dropFirst())"
            } else {
                totalString += value
            }
            addNewLabel(message: value, stackView: stackView)
            makeValueLabelTextToZero()
            signLabel.text = mapSign(sender: sender)
            makeCurrentStringToEmpty()
        } else {
            if valueLabel.text == "0" {
                signLabel.text = mapSign(sender: sender)
            } else {
                guard let retrievedSign = signLabel.text else { return }
                guard let retrievedValue = valueLabel.text else { return }
                makeCurrentStringToEmpty()
                totalString += retrievedSign
                if retrievedValue.contains("-") {
                    totalString += "&\(retrievedValue.dropFirst())"
                } else {
                    totalString += retrievedValue
                }
                
                addNewLabel(message: retrievedSign + retrievedValue, stackView: stackView)
                makeValueLabelTextToZero()
                signLabel.text = mapSign(sender: sender)
                makeCurrentStringToEmpty()
            }
        }
    }

    // 숫자 입력
    @IBAction private func tappedOperandIntoEquation(_ sender: UIButton) {
        switch sender {
        case oneButton:
            currentString += "1"
        case twoButton:
            currentString += "2"
        case threeButton:
            currentString += "3"
        case fourButton:
            currentString += "4"
        case fiveButton:
            currentString += "5"
        case sixButton:
            currentString += "6"
        case sevenButton:
            currentString += "7"
        case eightButton:
            currentString += "8"
        case nineButton:
            currentString += "9"
        case zeroButton:
            if currentString == "0" {
                return
            }
            currentString += "0"
        case doubleZeroButton:
            if currentString.isEmpty {
                return
            }
            currentString += "00"
        case dotButton:
            if currentString.isEmpty || currentString.contains(".") {
                return
            }
            currentString += "."
        default:
            makeCurrentStringToEmpty()
        }
        valueLabel.text = currentString
    }

    // 실제 계산
    @IBAction private func tappedCalculateFormula(_ sender: UIButton) {
        if totalString.isEmpty {
            return
        }else {
            guard let sign = signLabel.text else { return }
            guard let value = valueLabel.text else { return }
            currentString = "\(sign)\(value)"
            addNewLabel(message: currentString, stackView: stackView)
            totalString += sign
            if value.contains("-") {
                totalString += "&\(value.dropFirst())"
            } else {
                totalString += value
            }

            var finalEquation = ExpressionParser.parse(from: totalString)
            do {
                let result = try finalEquation.result()
                valueLabel.text = String(result)
            } catch ValueError.operandEmpty {
                displaySignAndValueLabels(signMessage: "!", valueMessage: "Need an Operand")
            } catch ValueError.operatorEmpty {
                displaySignAndValueLabels(signMessage: "!", valueMessage: "Need an Operator")
            } catch ValueError.divideByZero {
                displaySignAndValueLabels(signMessage: "", valueMessage: "NaN")
            } catch {
                displaySignAndValueLabels(signMessage: "error", valueMessage: "error")
            }
            makeSignLabelTextToEmpty()
            makeTotalStringToEmpty()
            makeCurrentStringToEmpty()
        }
    }

    @IBAction private func tappedCeExecution(sender: UIButton) {
        if currentString.isEmpty && totalString.isEmpty {
            makeValueLabelTextToZero()
        } else {
            valueLabel.text = ""
        }
        makeCurrentStringToEmpty()
    }

    @IBAction private func tappedPlusMinusSwap(sender: UIButton) {
        guard let value = valueLabel.text else { return }
        if value.contains("-") {
            valueLabel.text = String(value.dropFirst())
        } else {
            if value == "0" {
                return
            }
            valueLabel.text = "-\(value)"
        }
    }

    private func addNewLabel(message: String, stackView: UIStackView) {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .white
        label.isHidden = true
        label.text = "\(message)"
        label.textAlignment = .right
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        stackView.addArrangedSubview(label)
        UIView.animate(withDuration: 0.3) {
            label.isHidden = false
        }
    }

    private func displaySignAndValueLabels(signMessage: String, valueMessage: String) {
        signLabel.text = signMessage
        valueLabel.text = valueMessage
    }
}
