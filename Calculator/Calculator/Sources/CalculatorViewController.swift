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
        valueLabel.text = NumberNamespace.zero
    }

    private func makeStackViewToEmpty() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    //MARK: - Sign을 지정해준다.
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

    private func determineTotalStringByDashCharacterCondition(value: String) {
        if value.contains(NumberNamespace.minusSign) {
            totalString += "&\(value.dropFirst())"
        } else {
            totalString += value
        }
    }
    
    private func initializeValueLabelandCurrentString() {
        makeValueLabelTextToZero()
        makeCurrentStringToEmpty()
    }
    private func addLabelandSign (value: String, sender: UIButton) {
        addNewLabel(message: value, stackView: stackView)
        signLabel.text = mapSign(sender: sender)
    }
    
    
    //MARK: - 버튼 눌렀을 때, 연산자 입력
    @IBAction private func tappedOperatorIntoEquation(_ sender: UIButton) {
        guard currentString.count != 0 && valueLabel.text != "" else {
            return
        }
        if totalString.isEmpty {
            guard let value = valueLabel.text else { return }
            determineTotalStringByDashCharacterCondition(value: value)
            addLabelandSign(value: value, sender: sender)
            initializeValueLabelandCurrentString()
            
        } else {
            if valueLabel.text == NumberNamespace.zero {
                signLabel.text = mapSign(sender: sender)
            } else {
                guard let retrievedSign = signLabel.text else { return }
                guard let retrievedValue = valueLabel.text else { return }
                makeCurrentStringToEmpty()
                totalString += retrievedSign
                determineTotalStringByDashCharacterCondition(value: retrievedValue)
                addLabelandSign(value: retrievedSign + retrievedValue, sender: sender)
                initializeValueLabelandCurrentString()
            }
        }
    }

    //MARK: - 버튼 눌렀을 때, 숫자 (피연산자) 입력
    @IBAction private func tappedOperandIntoEquation(_ sender: UIButton) {
        switch sender {
        case oneButton:
            currentString += NumberNamespace.one
        case twoButton:
            currentString += NumberNamespace.two
        case threeButton:
            currentString += NumberNamespace.three
        case fourButton:
            currentString += NumberNamespace.four
        case fiveButton:
            currentString += NumberNamespace.five
        case sixButton:
            currentString += NumberNamespace.six
        case sevenButton:
            currentString += NumberNamespace.seven
        case eightButton:
            currentString += NumberNamespace.eight
        case nineButton:
            currentString += NumberNamespace.nine
        case zeroButton:
            if currentString == NumberNamespace.zero {
                return
            }
            currentString += NumberNamespace.zero
        case doubleZeroButton:
            guard currentString.isNotEmpty() else {
                return
            }
            currentString += NumberNamespace.doubleZero
        case dotButton:
            guard currentString.isNotEmpty(), currentString.notContains(NumberNamespace.dot) else {
                return
            }
            currentString += NumberNamespace.dot
        default:
            makeCurrentStringToEmpty()
        }
        valueLabel.text = currentString
    }

    //MARK: - 실제 계산 메서드
    @IBAction private func tappedCalculateFormula(_ sender: UIButton) {
        if totalString.isEmpty {
            return
        }else {
            guard let sign = signLabel.text else { return }
            guard let value = valueLabel.text else { return }
            currentString = "\(sign)\(value)"
            addNewLabel(message: currentString, stackView: stackView)
            totalString += sign
            if value.contains(NumberNamespace.minusSign) {
                totalString += "&\(value.dropFirst())"
            } else {
                totalString += value
            }
            executeEquation()
            makeSignLabelTextToEmpty()
            makeTotalStringToEmpty()
            makeCurrentStringToEmpty()
        }
    }
    
    //MARK: - 실제 계산 구현
    private func executeEquation() {
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
        if value.contains(NumberNamespace.minusSign) {
            valueLabel.text = String(value.dropFirst())
        } else {
            if value == NumberNamespace.zero {
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
