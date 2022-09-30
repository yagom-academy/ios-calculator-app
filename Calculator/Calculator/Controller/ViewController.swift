//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var expressionString: String = ""
    private var totalString: String = ""
    private let numberFormatter: NumberFormatter = NumberFormatter()
    
    @IBOutlet private weak var stackView: UIStackView!
    
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
    
    @IBOutlet private weak var dotButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var multiplyButton: UIButton!
    @IBOutlet private weak var divideButton: UIButton!
    
    @IBOutlet private weak var plusMinusButton: UIButton!
    @IBOutlet private weak var ceButton: UIButton!
    @IBOutlet private weak var acButton: UIButton!
    
    @IBOutlet private weak var signLabel: UILabel!
    @IBOutlet private weak var expressionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetValueToZero()
        resetSignLabel()
        resetStackView()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.usesSignificantDigits = true
    }
    
    private func signOfOperator(sender: UIButton) -> String {
        switch sender {
        case plusButton:
            return String(Operator.add.rawValue)
        case minusButton:
            return String(Operator.subtract.rawValue)
        case multiplyButton:
            return String(Operator.multiply.rawValue)
        case divideButton:
            return String(Operator.divide.rawValue)
        default:
            return ""
        }
    }
    
    private func resetExpressionString() {
        expressionString = ""
    }
    
    private func resetValueToZero() {
        expressionLabel.text = CalculatorNameSpace.zero.rawValue
    }
    
    private func resetTotalString() {
        totalString = ""
    }
    
    private func resetSignLabel() {
        signLabel.text = ""
    }
    
    private func resetStackView() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func initializeExpression() {
        resetValueToZero()
        resetExpressionString()
    }
    
    private func addLabelAndSign(value: String, sender: UIButton) {
        addNewLabelToStackView(message: value, stackView: stackView)
        signLabel.text = signOfOperator(sender: sender)
    }
    
    private func assignTotalString(value: String) {
        totalString += value
    }
    
    private func executeExpression() {
        var expression = ExpressionParser.parse(from: totalString)
        do {
            let result = try expression.result()
            let converted = NSDecimalNumber(string: String(result))
            let number = numberFormatter.string(from: converted)
            expressionLabel.text = number
        } catch ValueError.emptyOperandsQueue {
            displaySignAndLabel(sign: CalculatorNameSpace.exclamationMark.rawValue,
                                expression: CalculatorNameSpace.emptyOperand.rawValue)
        } catch ValueError.emptyOperatorsQueue {
            displaySignAndLabel(sign: CalculatorNameSpace.exclamationMark.rawValue,
                                expression: CalculatorNameSpace.emptyOperator.rawValue)
        } catch ValueError.divideByZero {
            displaySignAndLabel(sign: "", expression: CalculatorNameSpace.nan.rawValue)
        } catch {
            displaySignAndLabel(sign: CalculatorNameSpace.questionMark.rawValue,
                                expression: CalculatorNameSpace.error.rawValue)
        }
    }
    
    private func displaySignAndLabel(sign: String, expression: String) {
        signLabel.text = sign
        expressionLabel.text = expression
    }
    
    @IBAction private func tappedOperandButton(_ sender: UIButton) {
        switch sender {
        case oneButton:
            expressionString += CalculatorNameSpace.one.rawValue
        case twoButton:
            expressionString += CalculatorNameSpace.two.rawValue
        case threeButton:
            expressionString += CalculatorNameSpace.three.rawValue
        case fourButton:
            expressionString += CalculatorNameSpace.four.rawValue
        case fiveButton:
            expressionString += CalculatorNameSpace.five.rawValue
        case sixButton:
            expressionString += CalculatorNameSpace.six.rawValue
        case sevenButton:
            expressionString += CalculatorNameSpace.seven.rawValue
        case eightButton:
            expressionString += CalculatorNameSpace.eight.rawValue
        case nineButton:
            expressionString += CalculatorNameSpace.nine.rawValue
        case zeroButton:
            expressionString += CalculatorNameSpace.zero.rawValue
        case doubleZeroButton:
            expressionString += CalculatorNameSpace.doubleZero.rawValue
        case dotButton:
            expressionString += CalculatorNameSpace.dot.rawValue
        default:
            return
        }
        let converted = NSDecimalNumber(string: expressionString)
        let result = numberFormatter.string(from: converted)
        expressionLabel.text = result
    }
    
    @IBAction private func tappedOperatorButton(_ sender: UIButton) {
        guard expressionString.count != 0 && expressionLabel.text != "" else {
            return
        }
        
        if totalString.isEmpty {
            guard let value = expressionLabel.text else { return }
            assignTotalString(value: value)
            addLabelAndSign(value: value, sender: sender)
            initializeExpression()
        } else {
            if expressionLabel.text == CalculatorNameSpace.zero.rawValue {
                signLabel.text = signOfOperator(sender: sender)
            } else {
                guard let sign = signLabel.text else { return }
                guard let value = expressionLabel.text else { return }
                resetExpressionString()
                totalString += " \(sign) "
                assignTotalString(value: value)
                addLabelAndSign(value: sign + value, sender: sender)
                initializeExpression()
            }
        }
        
        
    }
    
    @IBAction private func tappedEqualButton(_ sender: UIButton) {
        if totalString.isEmpty {
            return
        } else {
            guard let sign = signLabel.text else { return }
            guard let value = expressionLabel.text else { return }
            expressionString = "\(sign) \(value)"
            addNewLabelToStackView(message: expressionString, stackView: stackView)
            totalString += " \(sign) "
            totalString += value
            executeExpression()
            resetExpressionString()
            resetSignLabel()
            resetTotalString()
        }
    }
    
    @IBAction private func tappedACButton(_ sender: UIButton) {
        resetValueToZero()
        resetExpressionString()
        resetTotalString()
        resetSignLabel()
        resetStackView()
    }
    
    @IBAction private func tappedCEButton(_ sender: UIButton) {
        if expressionString.isEmpty && totalString.isEmpty {
            resetValueToZero()
        } else {
            expressionLabel.text = ""
        }
        resetExpressionString()
    }
    
    @IBAction private func tappedPlusMinusButton(_ sender: UIButton) {
        guard let value = expressionLabel.text else { return }
        if value.contains(CalculatorNameSpace.minusSign.rawValue) {
            expressionLabel.text = String(value.dropFirst())
        } else {
            if value == CalculatorNameSpace.zero.rawValue {
                return
            }
            expressionLabel.text = "-\(value)"
        }
    }
    
    private func addNewLabelToStackView(message: String, stackView: UIStackView) {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.text = "\(message)"
        label.textAlignment = .right
        label.numberOfLines = 0
        label.isHidden = true
        label.adjustsFontForContentSizeCategory = true
        stackView.addArrangedSubview(label)
        UIView.animate(withDuration: 0.3) {
            label.isHidden = false
        }
    }
}

