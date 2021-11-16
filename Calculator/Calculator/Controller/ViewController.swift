//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

// MARK: Property and LifeCycle
class ViewController: UIViewController {
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    private var isNotZero: Bool {
        operandLabel.text != "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeFormulaLabel()
        removeFormulaView()
    }
}

// MARK: IBAction method
extension ViewController {
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        guard let currentOperandButtonText = sender.titleLabel?.text else {
            return
        }
        guard operandLabel.text! != "0" || currentOperandButtonText != "00" else {
            return
        }
        guard isNotZero else {
            operandLabel.text! = currentOperandButtonText
            return
        }
        operandLabel.text! += currentOperandButtonText
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard isNotZero else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        guard let currentOperatorButtonText = sender.titleLabel?.text else {
            return
        }
        let formula = addFormula(operand: operandLabel.text!, operator: operatorLabel.text!)
        calculatorStackView.addArrangedSubview(formula)
        operandLabel.text = "0"
        operatorLabel.text = currentOperatorButtonText
        scrollToBottom(calculatorScrollView)
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        guard isNotZero || operatorLabel.text != "" else {
            return
        }
        removeFormulaLabel()
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        removeFormulaLabel()
        removeFormulaView()
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        let hasDotNotIncluded = operandLabel.text?.contains(".") == false
        guard hasDotNotIncluded else {
            return
        }
        guard let currentOperandButtonText = sender.titleLabel?.text else {
            return
        }
        operandLabel.text! += currentOperandButtonText
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        guard isNotZero else {
            return
        }
        let hasMinusNotIncluded = operandLabel.text!.contains("-") == false
        guard hasMinusNotIncluded else {
            operandLabel.text!.remove(at: operandLabel.text!.startIndex)
            return
        }
        operandLabel.text = "-" + operandLabel.text!
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        guard operatorLabel.text != "" else {
            return
        }
        let formulaStackView = addFormula(operand: operandLabel.text!, operator: operatorLabel.text!)
        calculatorStackView.addArrangedSubview(formulaStackView)
        var formula = ExpressionParser.parse(from: calculatorStackView.toString)
        do {
            let calcuatorResult = try formula.result()
            operandLabel.text = setUpNumberFormat(for: calcuatorResult)
        } catch let error as CalculatorError {
            print(error.description)
        } catch let error {
            print(error.localizedDescription)
        }
        operatorLabel.text = ""
    }
}
// MARK: Formula Stack View Related
extension ViewController {
    private func addFormula(operand: String, operator: String) -> UIStackView {
        let formulaStackView = UIStackView()
        let operandLabel = UILabel()
        operandLabel.text = operand
        guard calculatorStackView.subviews.count > 0 else {
            setUpFormulaLabel(of: operandLabel)
            formulaStackView.addArrangedSubview(operandLabel)
            return formulaStackView
        }
        let operatorLabel = UILabel()
        operatorLabel.text = `operator`
        setUpFormulaLabel(of: operatorLabel)
        setUpFormulaLabel(of: operandLabel)
        formulaStackView.axis = .horizontal
        formulaStackView.alignment = .fill
        formulaStackView.distribution = .fill
        formulaStackView.spacing = 8
        formulaStackView.addArrangedSubview(operatorLabel)
        formulaStackView.addArrangedSubview(operandLabel)
        return formulaStackView
    }
    
    private func setUpFormulaLabel(of label: UILabel) {
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.adjustsFontForContentSizeCategory = true
    }
    
    private func scrollToBottom(_ view: UIScrollView) {
        calculatorScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: calculatorScrollView.contentSize.height - calculatorScrollView.frame.height)
        view.setContentOffset(bottomOffset, animated: false)
    }
}

// MARK: Label Initialization Related
extension ViewController {
    private func removeFormulaView() {
        calculatorStackView.subviews.forEach{
            $0.removeFromSuperview()
        }
    }
    
    private func removeFormulaLabel() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
}

// MARK: Calculation Result Related
extension ViewController {
    private func setUpNumberFormat(for value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .up
        guard let formatterNumber = numberFormatter.string(for: value) else {
            return value.description
        }
        return formatterNumber
    }
}

extension UIStackView {
    var toString: String {
        var inputValues = [String]()
        self.arrangedSubviews.forEach{ view in
            guard let subview = view as? UIStackView else {
                return
            }
            subview.arrangedSubviews.forEach{ view in
                guard let label = view as? UILabel else {
                    return
                }
                guard let input = label.text else {
                    return
                }
                inputValues.append(input)
            }
        }
        return inputValues.joined(separator: " ")
    }
}
