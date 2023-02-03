//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private weak var currentNumberLabel: UILabel!
    
    @IBOutlet private weak var verticalStackView: UIStackView!
    
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private var stringToBeCalculated = NameSpace.emptyString
    private var currentNumber = NameSpace.emptyString
    private var isCalculated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCurrentOperator()
        verticalStackView.subviews.forEach { subView in
            subView.removeFromSuperview()
        }
    }
    
    @IBAction private func tapACButton(_ sender: UIButton) {
        allClear()
    }
    
    @IBAction private func tapCEButton(_ sender: UIButton) {
        if isCalculated {
            allClear()
            isCalculated = false
            return
        }
        clearEntry()
    }
    
    @IBAction private func tapConvertSignButton(_ sender: UIButton) {
        convertSign()
    }
    
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
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        displayPreviousOperands()
        insertOperatorSign(titleName: sender.titleLabel?.text)
        displayCurrentOperator(titleName: sender.titleLabel?.text)
        resetCurrentNumber()
    }
    
    private func displayPreviousOperands() {
        let operateStackView = OperateStackView(operatorText: currentOperatorLabel.text, operandsText: currentNumberLabel.text?.floorIfZero)
        verticalStackView.addArrangedSubview(operateStackView)
    }
    
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
    
    private func insertString(titleName: String?) {
        stringToBeCalculated += titleName ?? NameSpace.emptyString
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
    
    private func removePreviousOperands() {
        guard let stackViewWillBeRemoved = verticalStackView.subviews.last else {
            return
        }
        stackViewWillBeRemoved.removeFromSuperview()
    }
    
    private func setCurrentNumber(titleName: String?) {
        currentNumber = currentNumber.replacingOccurrences(of: ",", with: NameSpace.emptyString)
        currentNumber += titleName ?? NameSpace.emptyString
        currentNumber = currentNumber.insertComma
        displayCurrentNumber()
    }

    private func displayCurrentNumber() {
        currentNumberLabel.text = currentNumber
    }
    
    private func displayCurrentOperator(titleName: String?) {
        currentOperatorLabel.text = titleName
    }
    
    private func resetCurrentNumber() {
        currentNumber = NameSpace.stringZero
        currentNumberLabel.text = currentNumber
    }
    
    private func initializeCurrentOperator() {
        currentOperatorLabel.text = NameSpace.emptyString
    }
    
    private func allClear() {
        stringToBeCalculated = NameSpace.emptyString
        currentNumber = NameSpace.emptyString
        currentNumberLabel.text = NameSpace.stringZero
        currentOperatorLabel.text = NameSpace.emptyString
        verticalStackView.subviews.forEach { subView in
            subView.removeFromSuperview()
        }
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
    
    private func displayResult(result: Double) {
        currentNumberLabel.text = String(result).floorIfZero.insertComma
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
}
