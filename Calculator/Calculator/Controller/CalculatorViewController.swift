//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/13.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    private var formulaString = ""
    private var isOperationReady = true
    private let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetOperandLabel()
        resetOperatorLabel()
        resetFormulaStackView()
        resetNumberFormatter()
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        let labelText = unwrap(sender.titleLabel?.text)
        let operandText = unwrap(operandLabel.text)
        
        if operandText.isZero {
            operandLabel.text? = labelText
        } else if operandText.count < 20 {
            let newLabelText = operandText + labelText
            operandLabel.text? = makeFormattedNumber(for: newLabelText.replacingOccurrences(of: ",", with: ""))
        }
    }
    
    @IBAction func tapZeroButton(_ sender: UIButton) {
        let labelText = unwrap(sender.titleLabel?.text)
        
        if !unwrap(operandLabel.text).isZero {
            operandLabel.text? += labelText
        }
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if !unwrap(operandLabel.text).isFraction {
            operandLabel.text? += unwrap(sender.titleLabel?.text)
        }
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        let operatorText = unwrap(operatorLabel.text)
        var operandText = unwrap(operandLabel.text)
        let labelText = unwrap(sender.titleLabel?.text)
        
        operandText.removeTrailingDot()
        
        isOperationReady = true
        
        if operandText.isZero, formulaStackView.subviews.isEmpty {
            return
        } else if operandText.isZero {
            operatorLabel.text? = labelText
        } else {
            formulaStackView.addArrangedSubview(makePartialFormulaStackView(operatorText, makeFormattedNumber(for: operandText)))
            
            addFormulaString(operatorText, operandText)
            operatorLabel.text = labelText
            
            resetOperandLabel()
            formulaScrollView.scrollToBottom()
        }
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        guard isOperationReady else {
            return
        }
        
        let operatorText = unwrap(operatorLabel.text)
        var operandText = unwrap(operandLabel.text)
        
        operandText.removeTrailingDot()
        
        if operandText.isZero {
            addFormulaString(operatorText, operandText)
            
            return
        }
        
        do {
            formulaStackView.addArrangedSubview(makePartialFormulaStackView(operatorText, makeFormattedNumber(for: operandText)))
            addFormulaString(operatorText, operandText)
            
            var formula = ExpressionParser.parse(from: formulaString)
            let result = try formula.result()
            
            operandLabel.text = makeFormattedNumber(for: String(result))
            isOperationReady = false
            
            resetOperatorLabel()
            resetFormulaString()
            formulaScrollView.scrollToBottom()
        } catch let error as OperationError {
            if error == .divideByZeroError {
                operandLabel.text = "NaN"
                isOperationReady = false
            }
            print(error)
        } catch {
            print(CalculatorError.unexpectedError)
        }
    }
    
    @IBAction func tapChangeSignButton(_ sender: UIButton) {
        var operandText = unwrap(operandLabel.text)
        
        guard operandText.isZero == false else {
            return
        }
        
        operandText.convertSign()
        
        operandLabel.text = operandText
    }
    
    @IBAction func tapClearEntryButton(_ sender: UIButton) {
        if isOperationReady == false {
            resetFormulaStackView()
        }
    
        resetOperandLabel()
    }
    
    @IBAction func tapAllClearButton(_ sender: UIButton) {
        resetOperandLabel()
        resetOperatorLabel()
        resetFormulaStackView()
        resetFormulaString()
        
        isOperationReady = true
    }
    
    private func resetOperandLabel() {
        operandLabel.text = "0"
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = ""
    }
    
    private func resetFormulaStackView() {
        formulaStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func resetFormulaString() {
        formulaString = ""
    }
    
    private func resetNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
    }
    
    private func unwrap(_ text: String?) -> String {
        return text ?? ""
    }
    
    private func addFormulaString(_ operatorText: String, _ operandText: String) {
        formulaString += operatorText + operandText.replacingOccurrences(of: ",", with: "")
    }
    
    private func makePartialExpressionLabel(_ text: String?) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.textColor = .white
        label.font = label.font.withSize(20)

        return label
    }
    
    private func makePartialExpressionStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        return stackView
    }
    
    private func makePartialFormulaStackView(_ operatorText: String, _ operandText: String) -> UIStackView {
        let operatorLabel = makePartialExpressionLabel(operatorText)
        let operandLabel = makePartialExpressionLabel(operandText)
        let partialStackView = makePartialExpressionStackView()
        
        partialStackView.addArrangedSubview(operatorLabel)
        partialStackView.addArrangedSubview(operandLabel)
        
        return partialStackView
    }
    
    private func makeFormattedNumber(for input: String) -> String {
        return numberFormatter.string(for: Double(input)) ?? "0"
    }
}
