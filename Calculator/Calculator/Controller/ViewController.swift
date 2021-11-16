//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputedOperatorLabel: UILabel!
    @IBOutlet weak var inputedOperandLabel: UILabel!
    @IBOutlet weak var toBeCalculateFormulaStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var inputDotButton: UIButton!
    @IBOutlet weak var inputZeroZeroButton: UIButton!
    @IBOutlet weak var inputZeroButton: UIButton!
    @IBOutlet weak var inputOneButton: UIButton!
    @IBOutlet weak var inputTwoButton: UIButton!
    @IBOutlet weak var inputThreeButton: UIButton!
    @IBOutlet weak var inputFourButton: UIButton!
    @IBOutlet weak var inputFiveButton: UIButton!
    @IBOutlet weak var inputSixButton: UIButton!
    @IBOutlet weak var inputSevenButton: UIButton!
    @IBOutlet weak var inputEightButton: UIButton!
    @IBOutlet weak var inputNineButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var cleanEntry: UIButton!
    @IBOutlet weak var convertPositiveOrNegativeNumber: UIButton!
    
    var fomula: String = ""
    var operand: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputedOperandLabel.text = StringOfInitialize.operandLabelText
    }
    
    @IBAction private func numberDidTap(_ sender: UIButton) {
        operand += operands(for: sender)
        do {
            inputedOperandLabel.text = try
            numberFormatterFor(inputOperand: operand)
        } catch let error {
            print(error)
        }
    }
    
    @IBAction private func operatorDidTap(_ sender: UIButton) {
        if operand == StringOfInitialize.toEmptyString {
            inputedOperatorLabel.text = operators(for: sender)
            return
        }
        
        guard let operatorLabelText = inputedOperatorLabel.text else {
            return
        }
        
        do {
            let operandLabelText = try numberFormatterFor(numberForCalculate: operand)
            let stackView = makeStackView(operatorLabelText: operatorLabelText, operandLabelText: operandLabelText)
            
            toBeCalculateFormulaStackView.addArrangedSubview(stackView)
        } catch let error {
            print(error)
        }
        
        fomula += operand
        fomula += " \(operatorLabelText) "
        operand = StringOfInitialize.toEmptyString
        inputedOperandLabel.text = StringOfInitialize.operandLabelText

        inputedOperatorLabel.text = operators(for: sender)
        
        scrollToBottom()
    }
    
    func scrollToBottom() {
        scrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height)
        
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    @IBAction func convertPositiveOrNegative(_ sender: UIButton) {
        if let doubleOperand = Double(operand), doubleOperand != 0 {
            operand = String(doubleOperand * -1)
        }
        
        inputedOperandLabel.text = operand
    }
    
    @IBAction func equalButtonDidTap(_ sender: UIButton) {
        if operand == StringOfInitialize.toEmptyString { return }
        
        guard let operatorLabelText = inputedOperatorLabel.text else { return }
        
        do {
            let operandLabelText = try numberFormatterFor(numberForCalculate: operand)
            let stackView = makeStackView(operatorLabelText: operatorLabelText, operandLabelText: operandLabelText)
            
            toBeCalculateFormulaStackView.addArrangedSubview(stackView)
        } catch let error {
            print(error)
        }
        
        fomula += " \(operatorLabelText) "
        fomula += operand
        operand = StringOfInitialize.toEmptyString
        inputedOperatorLabel.text = StringOfInitialize.operatorLabelText
        
        showCalculateResult()
    }
    
    func showCalculateResult() {
        var parser = ExpressionParser.parse(from: fomula)
        
        do{
            inputedOperandLabel.text = try numberFormatterFor(numberForCalculate: try String(parser.result()))
        } catch CalculateError.notANumber {
            inputedOperandLabel.text = CalculateError.notANumber.message
        } catch let error {
            print(error)
        }
    }
    
    func makeStackView(operatorLabelText: String?, operandLabelText: String?) -> UIStackView {
        let stackView = UIStackView()
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        stackView.spacing = 8
        operandLabel.text = operandLabelText
        operatorLabel.text = operatorLabelText
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        return stackView
    }
    
    func removeSubView(from stackView: UIStackView) {
        stackView.subviews.forEach { view in view.removeFromSuperview() }
    }
    
    @IBAction func allClearDidTap(_ sender: UIButton) {
        fomula = StringOfInitialize.toEmptyString
        operand = StringOfInitialize.toEmptyString
        
        inputedOperatorLabel.text = StringOfInitialize.operatorLabelText
        inputedOperandLabel.text = StringOfInitialize.operandLabelText
        
        removeSubView(from: toBeCalculateFormulaStackView)
    }
    
    @IBAction func cleanEntryDidTap(_ sender: UIButton) {
        operand = StringOfInitialize.toEmptyString
        inputedOperandLabel.text = StringOfInitialize.operandLabelText
    }
    
    private func numberFormatterFor(numberForCalculate: String) throws -> String? {
        guard let numberForCalculate = Double(numberForCalculate) else {
            throw NumberFormatterError.dataTypeCastingFailed
        }
        let numberFormatter = NumberFormatter()
        
        numberFormatter.usesSignificantDigits = true
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 15
        
        return numberFormatter.string(for: numberForCalculate)
    }
    
    private func numberFormatterFor(inputOperand: String) throws -> String? {
        guard let operand = Double(inputOperand) else {
            throw NumberFormatterError.dataTypeCastingFailed
        }
        let numberFormatter = NumberFormatter()
        
        numberFormatter.usesSignificantDigits = true
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 15
        
        if inputOperand.contains(".") {
            let dotFront = inputOperand.split(with: ".")[0]
            
            if inputOperand.split(with: ".").count == 1 {
                return dotFront + "."
            }
            
            guard let formattedDotFront = numberFormatter.string(for: Double(dotFront)) else {
                return nil
            }
            let dotBack = inputOperand.split(with: ".")[1]
            
            return formattedDotFront + "." + dotBack
        }

        return numberFormatter.string(for: operand)
    }
    
    private func operators(for buttton: UIButton) -> String {
        switch buttton {
        case addButton:
            return "+"
        case subtractButton:
            return "-"
        case divideButton:
            return "÷"
        case multiplyButton:
            return "×"
        default:
            return ""
        }
    }
    
    private func operands(for button: UIButton) -> String {
        switch button {
        case inputDotButton:
            return "."
        case inputZeroButton:
            return "0"
        case inputZeroZeroButton:
            return "00"
        case inputOneButton:
            return "1"
        case inputTwoButton:
            return "2"
        case inputThreeButton:
            return "3"
        case inputFourButton:
            return "4"
        case inputFiveButton:
            return "5"
        case inputSixButton:
            return "6"
        case inputSevenButton:
            return "7"
        case inputEightButton:
            return "8"
        case inputNineButton:
            return "9"
        default:
            return ""
        }
    }
}

