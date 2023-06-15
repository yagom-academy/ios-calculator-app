//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by EtialMoon on 2023/06/13.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    private var formulaString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetOperandLabel()
        resetOperatorLabel()
        resetFormulaStackView()
    }

    @IBAction func tapNumpad(_ sender: UIButton) {
        let labelText = unwrap(sender.titleLabel?.text)
        let operandText = unwrap(operandLabel.text)
        
        if operandText.isZero {
            operandLabel.text? = labelText
        } else if operandText.count < 20 {
            let newLabelText = operandText + labelText
            operandLabel.text? = makeNumberFormat(for: newLabelText.replacingOccurrences(of: ",", with: ""))
        }
    }
    
    @IBAction func tapZero(_ sender: UIButton) {
        let labelText = unwrap(sender.titleLabel?.text)
        
        if !unwrap(operandLabel.text).isZero {
            operandLabel.text? += labelText
        }
    }
    
    @IBAction func tapPoint(_ sender: UIButton) {
        if !unwrap(operandLabel.text).contains(unwrap(sender.titleLabel?.text)) {
            operandLabel.text? += unwrap(sender.titleLabel?.text)
        }
    }
    
    @IBAction func tapOperator(_ sender: UIButton) {
        let operatorText = unwrap(operatorLabel.text)
        let operandText = unwrap(operandLabel.text)
        let labelText = unwrap(sender.titleLabel?.text)
        
        if operandText.isZero, labelText == "=" {
            formulaString += operatorText + operandText.replacingOccurrences(of: ",", with: "")
            
            formulaScrollView.scrollToBottom()
        } else if operandText.isZero {
            operatorLabel.text? = labelText
        } else {
            let operatorLabel: UILabel = makeUILabel(operatorText)
            let operandLabel: UILabel = makeUILabel(
                operandText.hasSuffix(".") ?
                String(operandText.dropLast()) : operandText
            )
            let partialStackView = makeUIStackView()
            
            partialStackView.addArrangedSubview(operatorLabel)
            partialStackView.addArrangedSubview(operandLabel)
            formulaStackView.addArrangedSubview(partialStackView)
            
            formulaString += operatorText + operandText.replacingOccurrences(of: ",", with: "")
            operatorLabel.text? = labelText
            
            resetOperandLabel()
            formulaScrollView.scrollToBottom()
        }
    }
    
    @IBAction func tapEqual(_ sender: UIButton) {
        do {
            tapOperator(sender)
            
            var formula = ExpressionParser.parse(from: formulaString)
            let result = try formula.result()
            
            operandLabel.text = makeNumberFormat(for: String(result))
            
            resetOperatorLabel()
            resetFormulaString()
        } catch let error as OperationError {
            switch error {
            case .operandNotEnoughError:
                print(OperationError.operandNotEnoughError)
            case .operatorNotEnoughError:
                print(OperationError.operatorNotEnoughError)
            case .divideByZeroError:
                operandLabel.text = "NaN"
                
                print(OperationError.divideByZeroError)
            }
        } catch {
            print("unexpected error")
        }
    }
    
    @IBAction func tapChangeSign(_ sender: UIButton) {
        let hyphenMinus = "-"
        let operandText = unwrap(operandLabel.text)
        
        if operandText.isZero {
            return
        }
        
        if operandText.hasPrefix(hyphenMinus) {
            operandLabel.text = String(operandText.dropFirst())
        } else {
            operandLabel.text = hyphenMinus + operandText
        }
    }
    
    @IBAction func tapClearEntry(_ sender: UIButton) {
        resetOperandLabel()
    }
    
    @IBAction func tapAllClear(_ sender: UIButton) {
        resetOperandLabel()
        resetOperatorLabel()
        resetFormulaStackView()
        resetFormulaString()
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
    
    private func makeUILabel(_ text: String?) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.textColor = .white
        label.font = label.font.withSize(20)

        return label
    }
    
    private func makeUIStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        return stackView
    }
    
    private func makeNumberFormat(for input: String) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20

        return numberFormatter.string(for: Double(input)) ?? "0"
    }
}
