//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

private extension String {
    static let zero = "0"
    static let doubleZero = "00"
    static let empty = ""
    static let decimalPoint = "."
    static let nan = "NaN"
}

final class CalculatorViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet private weak var currentOperandLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var formulaStackView: UIStackView!
    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 19
        return numberFormatter
    }()
    
    private var currentOperand: String {
        get {
            currentOperandLabel.text ?? .empty
        }
        
        set {
            currentOperandLabel.text = newValue
        }
    }
    
    private var currentOperator: String {
        currentOperatorLabel.text ?? .empty
    }
    
    private var stringToParse: String = .empty
    private var isFirstOperand: Bool = true
    private var isOperandEntered: Bool = false
    private var isResultButtonDidTouch: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        stringToParse = .empty
        isFirstOperand = true
        isOperandEntered = false
        isResultButtonDidTouch = false
        currentOperandLabel.text = .zero
        currentOperatorLabel.text = .empty
    }
}

// MARK: - IBAction Method

extension CalculatorViewController {
    
    @IBAction private func operandButtonsDidTouch(_ sender: UIButton) {
        guard var validOperand = checkValidity(of: sender) else { return }
        
        Number.allCases.forEach { number in
            guard let buttonString = sender.currentTitle else { return }
            
            if buttonString == number.rawValue {
                validOperand += number.rawValue
            } else if buttonString == .doubleZero, number == .doubleZero {
                validOperand += .doubleZero
            } else if buttonString == .decimalPoint, number == .decimalPoint {
                validOperand += .decimalPoint
            }
        }
        
        isOperandEntered = true
        currentOperandLabel.text = returnNumberDividedByComma(from: validOperand)
    }
    
    @IBAction private func operatorButtonsDidTouch(_ sender: UIButton) {
        if isResultButtonDidTouch == true {
            isOperandEntered = false
            currentOperandLabel.text = .zero
            currentOperatorLabel.text = sender.currentTitle
            isResultButtonDidTouch = false
        }
        
        guard isOperandEntered == true else { return }
        
        checkAndAddLabelToStackView()
        currentOperatorLabel.text = sender.currentTitle
        currentOperandLabel.text = .zero
        isOperandEntered = false
    }
    
    @IBAction private func resultButtonDidTouch(_ sender: UIButton) {
        guard !currentOperator.isEmpty else { return }
        guard !formulaStackView.arrangedSubviews.isEmpty else { return }
        
        checkAndAddLabelToStackView()
        setResult()
        isResultButtonDidTouch = true
    }
    
    @IBAction private func allClearButtonDidTouch(_ sender: UIButton) {
        currentOperandLabel.text = .zero
        currentOperatorLabel.text = .empty
        
        guard formulaStackView.arrangedSubviews.last != nil else { return }
        
        for view in formulaStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        setUp()
    }
    
    @IBAction private func clearEntryButtonDidTouch(_ sender: UIButton) {
        currentOperandLabel.text = .zero
    }
    
    @IBAction private func signConvertingButtonDidTouch(_ sender: UIButton) {
        guard currentOperand != .zero else { return }
        
        if currentOperand.contains("-") {
            let minusSign = currentOperand.first
            currentOperand = currentOperand.filter{ $0 != minusSign }
        } else {
            currentOperand = "-" + currentOperand
        }
        
        currentOperandLabel.text = currentOperand
    }
}

// MARK: - logic Method

extension CalculatorViewController {
    private func checkAndAddLabelToStackView() {
        let commaDeletedOperand = currentOperand.filter { $0 != "," }

        guard let doubledCurrentOperand = Double(commaDeletedOperand) else { return }
        let number = NSNumber(value: doubledCurrentOperand)
        guard let formattedNumber = numberFormatter.string(from: number) else { return }

        addLabelToStackView(formattedNumber, currentOperator)
    }
    
    private func returnNumberDividedByComma(from currentOperand: String) -> String? {
        guard currentOperand.contains(".") == false || currentOperand.last != "0" else {
            return currentOperand
        }
        
        let commaDeletedOperand = currentOperand.filter { $0 != "," }
        
        if commaDeletedOperand.hasSuffix(.decimalPoint) {
            return currentOperand
        } else {
            guard let doubledCurrentOperand = Double(commaDeletedOperand) else { return nil }
            let number = NSNumber(value: doubledCurrentOperand)
            guard let formattedNumber = numberFormatter.string(from: number) else { return nil }
            
            return formattedNumber
        }
    }
    
    private func setResult() {
        var formulaForResult = ExpressionParser.parse(from: stringToParse)
        
        do {
            let result = try formulaForResult.result()
            currentOperandLabel.text = checkIfDecimalPointIsNeeded(result)
        } catch CalculatorError.divisionByZero {
            currentOperandLabel.text = .nan
        } catch CalculatorError.overMaximumDigit {
            currentOperandLabel.text = .nan
        } catch {}
        
        currentOperatorLabel.text = .empty
    }
    
    private func checkValidity(of sender: UIButton) -> String? {
        guard let buttonString = sender.currentTitle else { return nil }
        guard currentOperand.filter({ $0 != "," }).count < 20 else { return nil }
        guard currentOperand != .zero || buttonString != .doubleZero else { return nil }
        
        if currentOperand == .zero, buttonString != .decimalPoint {
            currentOperand = .empty
        } else if currentOperand.hasPrefix("-" + .zero) {
            currentOperand = "-"
        }
        
        return currentOperand
    }
    
    private func addLabelToStackView(_ operandLabelText: String, _ operatorLabelText: String) {
        let resultLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            return label
        }()
        
        if isFirstOperand == true {
            resultLabel.text = "\(operandLabelText) "
            formulaStackView.addArrangedSubview(resultLabel)
            isFirstOperand = false
        } else {
            resultLabel.text = "\(operatorLabelText) \(operandLabelText) "
            formulaStackView.addArrangedSubview(resultLabel)
        }
        
        guard let string = resultLabel.text?.filter({ $0 != "," }) else { return }
        
        stringToParse.append(string)
        scrollView.layoutIfNeeded()
        let labelHeight = scrollView.contentSize.height - scrollView.bounds.height
        if labelHeight > 0 {
            scrollView.setContentOffset(CGPoint(x: 0, y: labelHeight), animated: true)
        }
    }
    
    private func checkIfDecimalPointIsNeeded(_ result: Double) -> String? {
        var resultString: String

        if floor(result) == result {
            resultString = String(format:"%.0f", result)
        } else {
            resultString = String(result)
        }
        
        return returnNumberDividedByComma(from: resultString)
    }
}
