//
//  Calculator - CalculatorViewController.swift
//  Created by Rhode.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    let calculatorFormatter = CalculatorFormatter.shared
    
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private weak var currentNumberLabel: UILabel!
    
    @IBOutlet private weak var verticalStackView: UIStackView!
    
    @IBOutlet private weak var operatingScrollView: UIScrollView!
    
    private var stringToBeCalculated: String = NameSpace.emptyString
    private var currentNumber: String = NameSpace.emptyString
    private var isCalculated: Bool = false
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCurrentOperator()
        allClearViews()
    }
    
    private func initializeCurrentOperator() {
        currentOperatorLabel.text = NameSpace.emptyString
    }
    
    //MARK: Methods inserting numbers to be calculated
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        if isCalculated {
            allClear()
            isCalculated = false
        }
        guard currentNumber.replacingOccurrences(of: ",", with: NameSpace.emptyString).count < 20 else {
            return
        }
        insertString(titleName: sender.titleLabel?.text)
        setCurrentNumber(titleName: sender.titleLabel?.text)
    }
    
    @IBAction private func tapDotButton(_ sender: UIButton) {
        if currentNumber.contains(".") == false {
            if currentNumber == NameSpace.emptyString {
                currentNumber += NameSpace.stringZero
                stringToBeCalculated += NameSpace.stringZero
            }
            insertString(titleName: sender.titleLabel?.text)
            setCurrentNumber(titleName: sender.titleLabel?.text)
        }
    }
    
    private func insertString(titleName: String?) {
        stringToBeCalculated += titleName ?? NameSpace.emptyString
    }
    
    private func setCurrentNumber(titleName: String?) {
        currentNumber = currentNumber.replacingOccurrences(of: ",", with: NameSpace.emptyString)
        currentNumber += titleName ?? NameSpace.emptyString
        currentNumber = currentNumber.stringWithComma
        displayCurrentNumber()
    }
    
    //MARK: Methods inserting operators to calculate
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        displayPreviousOperands()
        insertOperatorSign(titleName: sender.titleLabel?.text)
        displayCurrentOperator(titleName: sender.titleLabel?.text)
        resetCurrentNumber()
    }
    
    private func insertOperatorSign(titleName: String?) {
        if stringToBeCalculated == NameSpace.emptyString {
            stringToBeCalculated += NameSpace.stringZero
        } else {
            let lastIndex = stringToBeCalculated.index(before: stringToBeCalculated.endIndex)
            let lastString = stringToBeCalculated[lastIndex]
            if Operator(rawValue: lastString) != nil {
                stringToBeCalculated = String(stringToBeCalculated.dropLast())
                removePreviousOperands()
            }
        }
        insertString(titleName: titleName)
    }
    
    private func displayCurrentOperator(titleName: String?) {
        currentOperatorLabel.text = titleName
    }
    
    //MARK: Methods calculating numbers
    @IBAction private func tapCalculateButton(_ sender: UIButton) {
        guard isCalculated == false else {
            return
        }
        isCalculated = true
        displayPreviousOperands()
        resetCurrentNumber()
        initializeCurrentOperator()
        let result = calculate()
        displayResult(result: result)
    }
    
    private func calculate() -> Double {
        let lastIndex = stringToBeCalculated.index(before: stringToBeCalculated.endIndex)
        let lastString = stringToBeCalculated[lastIndex]
        if Operator(rawValue: lastString) != nil {
            stringToBeCalculated = stringToBeCalculated + NameSpace.stringZero
        }
        var calculateFormula = ExpressionParser.parse(from: stringToBeCalculated)
        stringToBeCalculated = NameSpace.emptyString
        return calculateFormula.result()
    }
    
    //MARK: Methods displaying numbers
    private func displayPreviousOperands() {
        let operateStackView = OperateStackView(operatorText: currentOperatorLabel.text, operandsText: currentNumberLabel.text?.floorIfZero)
        verticalStackView.addArrangedSubview(operateStackView)
    }
    
    private func displayCurrentNumber() {
        currentNumberLabel.text = currentNumber
    }
    
    private func displayResult(result: Double) {
        currentNumberLabel.text = calculatorFormatter.roundingNumber(from: result).floorIfZero.stringWithComma
    }
    
    //MARK: Methods clearing numbers
    @IBAction private func tapCEButton(_ sender: UIButton) {
        if isCalculated {
            allClear()
            isCalculated = false
            return
        }
        clearEntry()
    }
    
    @IBAction private func tapACButton(_ sender: UIButton) {
        allClear()
    }
    
    private func clearEntry() {
        for input in stringToBeCalculated.reversed() {
            if Operator(rawValue: input) == nil {
                stringToBeCalculated = String(stringToBeCalculated.dropLast())
            } else {
                break
            }
        }
        resetCurrentNumber()
    }
    
    private func allClear() {
        stringToBeCalculated = NameSpace.emptyString
        currentNumber = NameSpace.emptyString
        currentNumberLabel.text = NameSpace.stringZero
        currentOperatorLabel.text = NameSpace.emptyString
        allClearViews()
    }
    
    //MARK: Methods converting sign
    @IBAction private func tapConvertSignButton(_ sender: UIButton) {
        convertSign()
    }
    
    private func convertSign() {
        var count = 0
        for input in stringToBeCalculated.reversed() {
            if Operator(rawValue: input) == nil {
                count -= 1
            } else {
                break
            }
        }
        stringToBeCalculated.insert("-", at: stringToBeCalculated.index(stringToBeCalculated.endIndex, offsetBy: count))
        currentNumber.insert("-", at: stringToBeCalculated.index(stringToBeCalculated.startIndex, offsetBy: 0))
        stringToBeCalculated = stringToBeCalculated.replacingOccurrences(of: "--", with: NameSpace.emptyString)
        currentNumber = currentNumber.replacingOccurrences(of: "--", with: NameSpace.emptyString)
        displayCurrentNumber()
    }
    
    //MARK: Methods removing operands or resetting number
    private func removePreviousOperands() {
        guard let stackViewWillBeRemoved = verticalStackView.subviews.last else {
            return
        }
        stackViewWillBeRemoved.removeFromSuperview()
    }
    
    private func resetCurrentNumber() {
        currentNumber = NameSpace.stringZero
        currentNumberLabel.text = currentNumber
    }
    
    private func allClearViews() {
        verticalStackView.subviews.forEach { subView in
            subView.removeFromSuperview()
        }
    }
}
