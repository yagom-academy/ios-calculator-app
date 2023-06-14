//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by EtialMoon on 2023/06/13.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var allInputScrollView: UIScrollView!
    @IBOutlet weak var allInputStackView: UIStackView!
    
    private var formulaString = ""
    private var operationReady = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetInputNumberLabel()
        resetInputOperatorLabel()
        resetAllInputStackView()
    }

    @IBAction func tapNumpad(_ sender: UIButton) {
        guard let labelText = sender.titleLabel?.text,
              let inputNumberLabelText = inputNumberLabel.text else {
            return
        }
        
        if operationReady {
            if inputNumberLabelText == "0" {
                inputNumberLabel.text? = labelText
            } else if inputNumberLabelText.count < 20 {
                let newLabelText = inputNumberLabelText + labelText
                inputNumberLabel.text? = makeNumberFormat(for: newLabelText.replacingOccurrences(of: ",", with: ""))
            }
        }
    }
    
    @IBAction func tapZero(_ sender: UIButton) {
        guard let labelText = sender.titleLabel?.text else {
            return
        }
        
        if inputNumberLabel.text != "0" {
            inputNumberLabel.text? += labelText
        }
    }
    
    @IBAction func tapPoint(_ sender: UIButton) {
        guard let labelText = sender.titleLabel?.text,
              let inputNumberLabelText = inputNumberLabel.text else {
            return
        }
        
        if !inputNumberLabelText.contains(labelText) {
            inputNumberLabel.text? += labelText
        }
    }
    
    @IBAction func tapOperator(_ sender: UIButton) {
        guard var inputOperatorLabelText = inputOperatorLabel.text,
              let inputNumberLabelText = inputNumberLabel.text,
              let labelText = sender.titleLabel?.text,
              operationReady else {
            return
        }
            
        if inputNumberLabelText == "0",
           labelText == "=" {
            formulaString += inputOperatorLabelText + inputNumberLabelText.replacingOccurrences(of: ",", with: "")
            allInputScrollView.scrollToBottom()
        } else if inputNumberLabelText == "0" {
            inputOperatorLabel.text? = labelText
        } else {
            if allInputStackView.subviews.isEmpty {
                inputOperatorLabelText = ""
            }
            
            let operatorLabel: UILabel = makeUILabel(inputOperatorLabelText)
            let operandLabel: UILabel = makeUILabel(
                inputNumberLabelText.hasSuffix(".") ?
                String(inputNumberLabelText.dropLast()) : inputNumberLabelText
            )
            
            let inputLabelStackView = makeUIStackView()
            
            inputLabelStackView.addArrangedSubview(operatorLabel)
            inputLabelStackView.addArrangedSubview(operandLabel)
            allInputStackView.addArrangedSubview(inputLabelStackView)
            
            formulaString += inputOperatorLabelText + inputNumberLabelText.replacingOccurrences(of: ",", with: "")
            resetInputNumberLabel()
            inputOperatorLabel.text? = labelText
            allInputScrollView.scrollToBottom()
        }
    }
    
    @IBAction func tapEqual(_ sender: UIButton) {
        do {
            if operationReady {
                tapOperator(sender)
                
                var formula = ExpressionParser.parse(from: formulaString)
                let result = try formula.result()
                
                inputNumberLabel.text = makeNumberFormat(for: String(result))
                operationReady = false
                
                resetInputOperatorLabel()
                resetFormulaString()
            }
        } catch let error as OperationError {
            switch error {
            case .operandNotEnoughError:
                print(OperationError.operandNotEnoughError)
            case .operatorNotEnoughError:
                print(OperationError.operatorNotEnoughError)
            case .divideByZeroError:
                print(OperationError.divideByZeroError)
                inputNumberLabel.text = "NaN"
                operationReady = false
            }
        } catch {
            print("unexpected error")
        }
    }
    
    @IBAction func tapChangeSign(_ sender: UIButton) {
        let hyphenMinus = "-"
        
        if let numberLabelText = inputNumberLabel.text,
           numberLabelText != "0" {
            if numberLabelText.hasPrefix(hyphenMinus) {
                inputNumberLabel.text = String(numberLabelText.dropFirst())
            } else {
                inputNumberLabel.text = hyphenMinus + numberLabelText
            }
        }
    }
    
    @IBAction func tapClearEntry(_ sender: UIButton) {
        resetInputNumberLabel()
    }
    
    @IBAction func tapAllClear(_ sender: UIButton) {
        resetInputNumberLabel()
        resetInputOperatorLabel()
        resetAllInputStackView()
        resetFormulaString()
        operationReady = true
    }
    
    private func resetInputNumberLabel() {
        inputNumberLabel.text = "0"
    }
    
    private func resetInputOperatorLabel() {
        inputOperatorLabel.text = ""
    }
    
    private func resetAllInputStackView() {
        allInputStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func resetFormulaString() {
        formulaString = ""
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
