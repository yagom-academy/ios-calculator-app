//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    
    @IBOutlet var operandButtons: [UIButton]!
    @IBOutlet var operatorButtons: [UIButton]!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var convertingSignButton: UIButton!
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var verticalStackView: UIStackView!
    
    private var stringToParse: String = ""
    private var isFirstOperand: Bool = true
    private var isOperandEntered: Bool = false
    private var isResultButtonClicked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        stringToParse = ""
        isFirstOperand = true
        isOperandEntered = false
        isResultButtonClicked = false
        currentOperandLabel.text = Number.zero.rawValue
        currentOperatorLabel.text = ""
    }
    
    // MARK: Operand Button Method
    @IBAction func operandButtonsClicked(_ sender: UIButton) {
        guard var validOperand = checkValidity(of: sender) else { return }
        
        Number.allCases.forEach { number in
            guard (0..<12) ~= sender.tag else { return }
            
            if String(sender.tag) == number.rawValue {
                validOperand += number.rawValue
            } else if sender.tag == 10, number == .doubleZero {
                validOperand += Number.doubleZero.rawValue
            } else if sender.tag == 11, number == .decimalPoint {
                validOperand += Number.decimalPoint.rawValue
            }
        }
        
        isOperandEntered = true
        currentOperandLabel.text = returnNumberDividedByComma(from: validOperand)
    }
    
    // MARK: Operator Button Methods
    @IBAction func operatorButtonsClicked(_ sender: UIButton) {
        if isResultButtonClicked == true {
            isOperandEntered = false
            currentOperandLabel.text = Number.zero.rawValue
            currentOperatorLabel.text = sender.titleLabel?.text
            isResultButtonClicked = false
        }
        
        guard isOperandEntered == true else { return }
        
        checkAndAddLabelToStackView()
        currentOperatorLabel.text = sender.titleLabel?.text
        currentOperandLabel.text = Number.zero.rawValue
        isOperandEntered = false
    }
    
    @IBAction func resultButtonClicked(_ sender: UIButton) {
        guard currentOperatorLabel.text != "" else { return }
        guard verticalStackView.arrangedSubviews.last != nil else { return }
        
        checkAndAddLabelToStackView()
        tryToReturnResult()
        isResultButtonClicked = true
    }
    
    // MARK: Extra Button Methods
    @IBAction func allClearButtonClicked(_ sender: UIButton) {
        currentOperandLabel.text = Number.zero.rawValue
        currentOperatorLabel.text = ""
        
        guard verticalStackView.arrangedSubviews.last != nil else { return }
        
        for view in verticalStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        initialize()
    }
    
    @IBAction func clearEntryButtonClicked(_ sender: UIButton) {
        currentOperandLabel.text = Number.zero.rawValue
    }
    
    @IBAction func signConvertingButtonClicked(_ sender: UIButton) {
        guard var currentNumber = currentOperandLabel.text else { return }
        guard currentNumber != Number.zero.rawValue else { return }
        
        if currentNumber.contains(Operator.subtract.rawValue) {
            let minusSign = currentNumber.first
            currentNumber = currentNumber.filter{ $0 != minusSign }
        } else {
            currentNumber = String(Operator.subtract.rawValue) + currentNumber
        }
        
        currentOperandLabel.text = currentNumber
    }
    
    // MARK: StackView Related Method
    func checkAndAddLabelToStackView() {
        let label = UILabel()
        
        guard let operatorLabelText = currentOperatorLabel.text else { return }
        guard var operandLabelText = currentOperandLabel.text else { return }
        
        while operandLabelText.contains(Number.decimalPoint.rawValue)
                && operandLabelText.hasSuffix(Number.zero.rawValue) {
            operandLabelText.removeLast()
        }
        
        if operandLabelText.hasSuffix(Number.decimalPoint.rawValue) {
            operandLabelText.removeLast()
        }
        
        addLabelToStackView(label, operandLabelText, operatorLabelText)
    }
    
    // MARK: Function-Separated Method
    func returnNumberDividedByComma(from currentOperand: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 19
        
        guard currentOperand.contains(".") == false || currentOperand.last != "0" else {
            return currentOperand
        }
        
        let commaDeletedOperand = currentOperand.filter { $0 != "," }
        
        if commaDeletedOperand.hasSuffix(Number.decimalPoint.rawValue) {
            return currentOperand
        } else {
            guard let doubledCurrentOperand = Double(commaDeletedOperand) else { return nil }
            let number = NSNumber(value: doubledCurrentOperand)
            guard let formattedNumber = numberFormatter.string(from: number) else { return nil }
            
            return formattedNumber
        }
    }
    
    func tryToReturnResult() {
        let formulaForResult = ExpressionParser.parse(from: stringToParse)
        var myFormula = formulaForResult
        
        do {
            guard let result = try myFormula.result() else { return }
            currentOperandLabel.text = checkIfDecimalPointIsNeeded(result)
        } catch CalculatorError.divisionByZero {
            currentOperandLabel.text = "NaN"
        } catch {}
        
        currentOperatorLabel.text = ""
    }
    
    func checkValidity(of sender: UIButton) -> String? {
        guard var currentOperand = currentOperandLabel.text else { return nil }
        guard currentOperand.filter({ $0 != "," }).count < 20 else { return nil }
        guard currentOperand != Number.zero.rawValue || sender.tag != 10 else { return nil }
        
        if currentOperand == Number.zero.rawValue, sender.tag != 11 {
            currentOperand = ""
        } else if currentOperand.hasPrefix("-\(Number.zero.rawValue)") {
            currentOperand = "-"
        }
        
        return currentOperand
    }
    
    func addLabelToStackView(_ label: UILabel, _ operandLabelText: String, _ operatorLabelText: String) {
        if isFirstOperand == true {
            label.text = "\(operandLabelText) "
            label.textColor = .white
            verticalStackView.addArrangedSubview(label)
            isFirstOperand = false
        } else {
            label.text = "\(operatorLabelText) \(operandLabelText) "
            label.textColor = .white
            verticalStackView.addArrangedSubview(label)
        }
        
        guard let string = label.text?.filter({ $0 != "," }) else { return }
        
        stringToParse.append(string)
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height), animated: false)
    }
    
    func checkIfDecimalPointIsNeeded(_ result: Double) -> String? {
        var resultString: String

        if floor(result) == result {
            resultString = String(format:"%.0f", result)
        } else {
            resultString = String(result)
        }
        
        return returnNumberDividedByComma(from: resultString)
    }
}

