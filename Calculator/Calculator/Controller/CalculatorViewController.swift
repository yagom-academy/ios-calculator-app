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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetOperandLabel()
        resetOperatorLabel()
        resetFormulaStackView()
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        let labelText = unwrap(sender.titleLabel?.text)
        let operandText = unwrap(operandLabel.text)
        
        if operandText.isZero {
            operandLabel.text? = labelText
        } else if operandText.count < 20 {
            let newLabelText = operandText + labelText
            operandLabel.text? = makeNumberFormat(for: newLabelText.replacingOccurrences(of: ",", with: ""))
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
            formulaStackView.addArrangedSubview(makePartialFormulaStackView(operatorText, makeNumberFormat(for: operandText)))
            
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
            formulaStackView.addArrangedSubview(makePartialFormulaStackView(operatorText, makeNumberFormat(for: operandText)))
            addFormulaString(operatorText, operandText)
            
            var formula = ExpressionParser.parse(from: formulaString)
            let result = try formula.result()
            
            operandLabel.text = makeNumberFormat(for: String(result))
            isOperationReady = false
            
            resetOperatorLabel()
            resetFormulaString()
            formulaScrollView.scrollToBottom()
        } catch let error as OperationError {
            switch error {
            case .operandNotEnoughError:
                print(OperationError.operandNotEnoughError)
            case .operatorNotEnoughError:
                print(OperationError.operatorNotEnoughError)
            case .divideByZeroError:
                operandLabel.text = "NaN"
                isOperationReady = false
                
                print(OperationError.divideByZeroError)
            }
        } catch {
            print(CalculatorError.unexpectedError)
        }
    }
    
    @IBAction func tapChangeSignButton(_ sender: UIButton) {
        var operandText = unwrap(operandLabel.text)
        
        if operandText.isZero {
            return
        }
        
        operandText.convertSign()
        
        operandLabel.text = operandText
    }
    
    @IBAction func tapClearEntryButton(_ sender: UIButton) {
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
    
    private func unwrap(_ text: String?) -> String {
        guard let text else {
            return ""
        }
        
        return text
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
    
    private func makeNumberFormat(for input: String) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20

        return numberFormatter.string(for: Double(input)) ?? "0"
    }
}
