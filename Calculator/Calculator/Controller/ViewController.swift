//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var expressionString: String = ""
    var totalString: String = ""
    let numberFormatter: NumberFormatter = NumberFormatter()
    
    @IBOutlet weak var stackView: UIStackView!
    
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
    
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var expressionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetValueToZero()
        resetSignLabel()
        resetStackView()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.usesSignificantDigits = true
    }
    
    func signOfOperator(sender: UIButton) -> String {
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
    
    func resetExpressionString() {
        expressionString = ""
    }
    
    func resetValueToZero() {
        expressionLabel.text = CalculatorNameSpace.zero.rawValue
    }
    
    func resetTotalString() {
        totalString = ""
    }
    
    func resetSignLabel() {
        signLabel.text = ""
    }
    
    func resetStackView() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func initializeExpression() {
        resetValueToZero()
        resetExpressionString()
    }
    
    func addLabelAndSign(value: String, sender: UIButton) {
        addNewLabelToStackView(message: value, stackView: stackView)
        signLabel.text = signOfOperator(sender: sender)
    }
    
    func assignTotalString(value: String) {
        totalString += value
    }
    
    func executeExpression() {
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
    
    func displaySignAndLabel(sign: String, expression: String) {
        signLabel.text = sign
        expressionLabel.text = expression
    }
    
    @IBAction func tappedOperandButton(_ sender: UIButton) {
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
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
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
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
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
    
    @IBAction func tappedACButton(_ sender: UIButton) {
        resetValueToZero()
        resetExpressionString()
        resetTotalString()
        resetSignLabel()
        resetStackView()
    }
    
    @IBAction func tappedCEButton(_ sender: UIButton) {
        if expressionString.isEmpty && totalString.isEmpty {
            resetValueToZero()
        } else {
            expressionLabel.text = ""
        }
        resetExpressionString()
    }
    
    @IBAction func tappedPlusMinusButton(_ sender: UIButton) {
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
    
    func addNewLabelToStackView(message: String, stackView: UIStackView) {
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

