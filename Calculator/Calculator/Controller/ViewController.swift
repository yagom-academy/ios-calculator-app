//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    // MARK: Property and LifeCycle
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    private var currentOperand: String {
        get {
            guard let operand = operandLabel.text else {
                return ""
            }
            return operand
        }
        set {
            operandLabel.text = newValue
        }
    }
    
    private var currentOperator: String {
        get {
            guard let `operator` = operatorLabel.text else {
                return ""
            }
            return `operator`
        }
        set {
            operatorLabel.text = newValue
        }
    }
    
    private var isNotZero: Bool {
        currentOperand != "0"
    }
    
    var hasCalculated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeFormulaLabel()
        removeFormulaView()
    }
}

// MARK: IBAction method
extension ViewController {
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        guard hasCalculated == false else {
            return
        }
        guard let newOperand = sender.titleLabel?.text else {
            return
        }
        guard isNotZero || newOperand != "00" else {
            return
        }
        guard isNotZero else {
            currentOperand = newOperand
            return
        }
        guard let doubleValue = Double(removeComma(currentOperand) + newOperand) else {
            return
        }
        currentOperand = setUpNumberFormat(for: doubleValue)
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard currentOperand != "NaN" else {
            return
        }
        guard let newOperator = sender.titleLabel?.text else {
            return
        }
        guard hasCalculated == false else {
            hasCalculated.toggle()
            removeFormulaView()
            currentOperand = currentOperand
            addCurrentFormulaStack()
            currentOperator = newOperator
            currentOperand = "0"
            return
        }
        guard isNotZero else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        addCurrentFormulaStack()
        currentOperand = "0"
        currentOperator = newOperator
        scrollToBottom(calculatorScrollView)
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        guard isNotZero || currentOperand != "" else {
            return
        }
        if hasCalculated {
            hasCalculated.toggle()
            removeFormulaView()
        }
        currentOperand = "0"
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        removeFormulaLabel()
        removeFormulaView()
        hasCalculated = false
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard hasCalculated == false else {
            return
        }
        let hasDotNotIncluded = currentOperand.contains(".") == false
        guard hasDotNotIncluded else {
            return
        }
        guard let newOperand = sender.titleLabel?.text else {
            return
        }
        currentOperand = currentOperand + newOperand
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        guard hasCalculated == false else {
            return
        }
        guard isNotZero else {
            return
        }
        let hasMinusNotIncluded = currentOperand.contains("-") == false
        guard hasMinusNotIncluded else {
            currentOperand.remove(at: currentOperand.startIndex)
            return
        }
        currentOperand = "-" + currentOperand
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        guard hasCalculated == false else {
            return
        }
        addCurrentFormulaStack()
        var formula = ExpressionParser.parse(from: calculatorStackView.toString)
        do {
            let calcuatorResult = try formula.result()
            currentOperand = setUpNumberFormat(for: calcuatorResult)
        } catch let error as CalculatorError {
            switch error {
            case .notNumber:
                currentOperand = error.description
                hasCalculated.toggle()
                return
            case .queueNotFound:
                print(error.description)
                removeFormulaView()
                return
            default:
                print(error.description)
                return
            }
        } catch let error {
            print(error.localizedDescription)
        }
        currentOperator = ""
        hasCalculated.toggle()
    }
}

// MARK: Formula Stack View Related
extension ViewController {
    private func addCurrentFormulaStack() {
        let formulaStackView = addFormulaStackView(operand: currentOperand, operator: currentOperator)
        calculatorStackView.addArrangedSubview(formulaStackView)
    }
    
    private func addFormulaStackView(operand: String, operator: String) -> UIStackView {
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
    
    private func removeComma(_ value: String) -> String {
        guard value.contains(",") else {
            return value
        }
        return value.replacingOccurrences(of: ",", with: "")
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
        currentOperand = "0"
        currentOperator = ""
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
        guard formatterNumber.count < 26 else {
            return formatterNumber.map{ $0.description }[0]
        }
        return formatterNumber
    }
}

extension UIStackView {
    var toString: String {
        var inputValues = [String]()
        self.arrangedSubviews.forEach{ view in
            let subview = view as? UIStackView
            subview?.arrangedSubviews.forEach{ view in
                let label = view as? UILabel
                guard let input = label?.text else {
                    return
                }
                inputValues.append(input.replacingOccurrences(of: ",", with: ""))
            }
        }
        return inputValues.joined(separator: " ")
    }
}
