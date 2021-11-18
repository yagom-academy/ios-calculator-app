//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var inputedOperatorLabel: UILabel!
    @IBOutlet private weak var inputedOperandLabel: UILabel!
    @IBOutlet private weak var toBeCalculateFormulaStackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBOutlet private weak var inputDotButton: UIButton!
    @IBOutlet private weak var inputZeroZeroButton: UIButton!
    @IBOutlet private weak var inputZeroButton: UIButton!
    @IBOutlet private weak var inputOneButton: UIButton!
    @IBOutlet private weak var inputTwoButton: UIButton!
    @IBOutlet private weak var inputThreeButton: UIButton!
    @IBOutlet private weak var inputFourButton: UIButton!
    @IBOutlet private weak var inputFiveButton: UIButton!
    @IBOutlet private weak var inputSixButton: UIButton!
    @IBOutlet private weak var inputSevenButton: UIButton!
    @IBOutlet private weak var inputEightButton: UIButton!
    @IBOutlet private weak var inputNineButton: UIButton!
    
    @IBOutlet private weak var divideButton: UIButton!
    @IBOutlet private weak var multiplyButton: UIButton!
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    
    @IBOutlet private weak var allClearButton: UIButton!
    @IBOutlet private weak var cleanEntry: UIButton!
    @IBOutlet private weak var convertPositiveOrNegativeNumber: UIButton!
    
    private let initializeOperandLabelText = "0"
    private let initializeOperatorLabelText = ""
    private let initializeToEmptyString = ""
    
    private let maximumFractionDigits = 20
    private let stackViewSpacing: CGFloat = 8
    
    private var fomula: String = ""
    private var operand: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputedOperandLabel.text = initializeOperandLabelText
    }
}
    
// MARK: - IBAction Method
extension ViewController {
    @IBAction private func numberDidTap(_ sender: UIButton) {
        operand += operands(for: sender)
        
        do {
            inputedOperandLabel.text = try numberFormatterFor(inputOperand: operand)
        } catch let error {
            print(error)
        }
    }
    
    @IBAction private func operatorDidTap(_ sender: UIButton) {
        if operand == initializeToEmptyString {
            inputedOperatorLabel.text = operators(for: sender)
            return
        }
        
        guard let operatorLabelText = inputedOperatorLabel.text else { return }
        
        addStackView(operatorLabelText: operatorLabelText)
        
        fomula += operand + " " + operatorLabelText + " "
        operand = initializeToEmptyString
        inputedOperandLabel.text = initializeOperandLabelText
        inputedOperatorLabel.text = operators(for: sender)

        scrollToBottom()
    }
    
    @IBAction private func convertPositiveOrNegative(_ sender: UIButton) {
        if let doubleOperand = Double(operand), doubleOperand != 0 {
            operand = String(doubleOperand * -1)
        }
        
        inputedOperandLabel.text = operand
    }
    
    @IBAction private func equalButtonDidTap(_ sender: UIButton) {
        if operand == initializeToEmptyString { return }
        
        guard let operatorLabelText = inputedOperatorLabel.text else { return }
        
        addStackView(operatorLabelText: operatorLabelText)
        
        fomula += " " + operatorLabelText + " " + operand
        operand = initializeToEmptyString
        inputedOperatorLabel.text = initializeOperatorLabelText
        
        showCalculateResult()
    }
    
    @IBAction private func allClearDidTap(_ sender: UIButton) {
        fomula = initializeToEmptyString
        operand = initializeToEmptyString
        
        inputedOperatorLabel.text = initializeOperatorLabelText
        inputedOperandLabel.text = initializeOperandLabelText
        
        removeSubView(from: toBeCalculateFormulaStackView)
    }
    
    @IBAction private func cleanEntryDidTap(_ sender: UIButton) {
        operand = initializeToEmptyString
        inputedOperandLabel.text = initializeOperandLabelText
    }
}

// MARK: - View Method
extension ViewController {
    private func addStackView(operatorLabelText: String) {
        do {
            let operandLabelText = try numberFormatterFor(numberForCalculate: operand)
            let stackView = makeStackView(operatorLabelText: operatorLabelText, operandLabelText: operandLabelText)
            
            toBeCalculateFormulaStackView.addArrangedSubview(stackView)
        } catch let error {
            print(error)
        }
    }
    
    private func makeStackView(operatorLabelText: String?, operandLabelText: String?) -> UIStackView {
        let stackView = UIStackView()
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        stackView.spacing = stackViewSpacing
        operandLabel.text = operandLabelText
        operatorLabel.text = operatorLabelText
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        return stackView
    }
    
    private func removeSubView(from stackView: UIStackView) {
        stackView.subviews.forEach { view in view.removeFromSuperview() }
    }
    
    private func scrollToBottom() {
        scrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height)
        
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
}
    
// MARK: - Model Method
extension ViewController {
    private func showCalculateResult() {
        var parser = ExpressionParser.parse(from: fomula)
        
        do{
            inputedOperandLabel.text = try numberFormatterFor(numberForCalculate: try String(parser.result()))
        } catch CalculateError.notNumber {
            inputedOperandLabel.text = "\(CalculateError.notNumber)"
        } catch let error {
            print(error)
        }
    }
    
    private func numberFormatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = maximumFractionDigits
        
        return numberFormatter
    }
    
    private func numberFormatterFor(numberForCalculate: String) throws -> String? {
        guard let numberForCalculate = Double(numberForCalculate) else {
            throw NumberFormatterError.dataTypeCastingFailed
        }
        let numberFormatter = numberFormatter()
        
        return numberFormatter.string(for: numberForCalculate)
    }
    
    private func numberFormatterFor(inputOperand: String) throws -> String? {
        guard let operand = Double(inputOperand) else {
            throw NumberFormatterError.dataTypeCastingFailed
        }
        let numberFormatter = numberFormatter()

        if inputOperand.contains(".") {
            return try formatNumber(of: inputOperand)
        }

        return numberFormatter.string(for: operand)
    }
    
    private func formatNumber(of inputingOperand: String) throws -> String{
        let numberFormatter = numberFormatter()
        let dotFront = inputingOperand.split(with: ".")[0]
        guard let formattedDotFront = numberFormatter.string(for: Double(dotFront)) else {
            throw NumberFormatterError.dataTypeCastingFailed
        }
        
        if inputingOperand.split(with: ".").count == 1 {
            return formattedDotFront + "."
        }
        
        let dotBack = inputingOperand.split(with: ".")[1]
        
        return formattedDotFront + "." + dotBack
    }

    private func operators(for buttton: UIButton) -> String {
        switch buttton {
        case addButton:
            return String(Operator.add.rawValue)
        case subtractButton:
            return String(Operator.subtract.rawValue)
        case divideButton:
            return String(Operator.divide.rawValue)
        case multiplyButton:
            return String(Operator.multiply.rawValue)
        default:
            return ""
        }
        Operator(rawValue: "+")
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

