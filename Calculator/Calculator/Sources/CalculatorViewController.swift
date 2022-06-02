//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    private var currentString: String = ""
    private var totalString: String = ""

    @IBOutlet var stackView: UIStackView!

    // Buttons - Numbers
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

    // Buttons - Symbols
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!

    // Buttons - Functions
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!

    // Labels - Associate with Result
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func tappedAllClear(_ sender: UIButton) {
        currentString = ""
        totalString = ""
        signLabel.text = ""
        valueLabel.text = "0"
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    private func senderToSign(sender: UIButton) -> String {
        var sign: String = ""
        switch sender {
        case plusButton:
            sign = "+"
        case minusButton:
            sign = "-"
        case multiplyButton:
            sign = "*"
        case divideButton:
            sign = "/"
        default:
            sign = ""
        }
        return sign
    }

    // 연산자 입력
    @IBAction private func tappedOperatorIntoEquation(_ sender: UIButton) {
        if currentString.count == 0 && signLabel.text == "" {
            return
        } else if totalString.isEmpty {
            guard let value = valueLabel.text else { return }
            if value.contains("-") {
                totalString += "&\(value.dropFirst())"
            } else {
                totalString += value
            }
            addNewLabel(message: value, stackView: stackView)
            valueLabel.text = "0"
            signLabel.text = senderToSign(sender: sender)
            currentString = ""
        } else {
            if valueLabel.text == "0" {
                signLabel.text = senderToSign(sender: sender)
            } else {
                guard let retrievedSign = signLabel.text else { return }
                guard let retrievedValue = valueLabel.text else { return }
                currentString = ""
                totalString += retrievedSign
                if retrievedValue.contains("-") {
                    totalString += "&\(retrievedValue.dropFirst())"
                } else {
                    totalString += retrievedValue
                }

                addNewLabel(message: retrievedSign + retrievedValue, stackView: stackView)
                valueLabel.text = "0"
                signLabel.text = senderToSign(sender: sender)
                currentString = ""
            }
        }
    }

    // 숫자 입력
    @IBAction func tappedOperandIntoEquation(_ sender: UIButton) {
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
            currentString += ""
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
            signLabel.text = ""
            totalString = ""
            currentString = ""
        }
    }

    @IBAction private func tappedCeExecution(sender: UIButton) {
        if currentString.isEmpty && totalString.isEmpty {
            valueLabel.text = "0"
            currentString = ""
        } else {
            valueLabel.text = ""
            currentString = ""
        }
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
