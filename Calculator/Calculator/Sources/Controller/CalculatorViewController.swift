//
//  Calculator - CalculatorViewController.swift
//  Created by Rhode, Songjun.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
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
        guard currentNumber.count < 20 else {
            return
        }
        insertString(titleName: sender.titleLabel?.text)
        setCurrentNumber(titleName: sender.titleLabel?.text)
    }
    
    @IBAction private func tapDotButton(_ sender: UIButton) {
        guard currentNumber.contains(NameSpace.dot) == false else {
            return
        }
        if currentNumber == NameSpace.emptyString {
            currentNumber += NameSpace.stringZero
            stringToBeCalculated += NameSpace.stringZero
        }
        insertString(titleName: sender.titleLabel?.text)
        setCurrentNumber(titleName: sender.titleLabel?.text)
    }
    
    private func insertString(titleName: String?) {
        stringToBeCalculated += titleName ?? NameSpace.emptyString
    }
    
    private func setCurrentNumber(titleName: String?) {
        currentNumber += titleName ?? NameSpace.emptyString
        displayCurrentNumber()
    }
    
    //MARK: Methods inserting operators to calculate
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        if isCalculated {
            allClearViews()
            stringToBeCalculated += currentNumber
            isCalculated = false
        }
        displayPreviousOperands()
        insertOperatorSign(titleName: sender.titleLabel?.text)
        displayCurrentOperator(titleName: sender.titleLabel?.text)
        fixateScrollViewBottom()
        resetCurrentNumber()
    }
    
    private func insertOperatorSign(titleName: String?) {
        if stringToBeCalculated == NameSpace.emptyString {
            stringToBeCalculated += NameSpace.stringZero
        } else {
            let lastIndex = stringToBeCalculated.index(before: stringToBeCalculated.endIndex)
            let lastString = stringToBeCalculated[lastIndex]
            if Operator(rawValue: lastString) != nil {
                stringToBeCalculated.removeLast()
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
        
        if let result = calculate() {
            isCalculated = true
            displayPreviousOperands()
            resetCurrentNumber()
            initializeCurrentOperator()
            displayResult(result: result)
            currentNumber = String(result)
        } else { return }
        
        fixateScrollViewBottom()
    }
    
    private func calculate() -> Double? {
        let lastIndex = stringToBeCalculated.index(before: stringToBeCalculated.endIndex)
        let lastString = stringToBeCalculated[lastIndex]
        if Operator(rawValue: lastString) != nil {
            return nil
        }
        var isNumberOnly: Bool = true
        for `operator` in Operator.allCases {
            if stringToBeCalculated.contains(`operator`.rawValue) {
                isNumberOnly = false
            }
        }
        if isNumberOnly {
            return nil
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
        currentNumberLabel.text = currentNumber.stringWithComma
    }
    
    private func displayResult(result: Double) {
        currentNumberLabel.text = result.roundingNumber().floorIfZero.stringWithComma
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
                stringToBeCalculated.removeLast()
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
        guard currentNumber != NameSpace.emptyString else {
            return
        }
        var count = 0
        for input in stringToBeCalculated.reversed() {
            if Operator(rawValue: input) == nil {
                count -= 1
            } else {
                break
            }
        }
        stringToBeCalculated.insert(Character(NameSpace.minusSign), at: stringToBeCalculated.index(stringToBeCalculated.endIndex, offsetBy: count))
        currentNumber.insert(Character(NameSpace.minusSign), at: stringToBeCalculated.index(stringToBeCalculated.startIndex, offsetBy: 0))
        stringToBeCalculated = stringToBeCalculated.replacingOccurrences(of: NameSpace.doubleMinusSign, with: NameSpace.emptyString)
        currentNumber = currentNumber.replacingOccurrences(of: NameSpace.doubleMinusSign, with: NameSpace.emptyString)
        displayCurrentNumber()
    }
    
    //MARK: Methods about settings
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
    
    private func fixateScrollViewBottom() {
        operatingScrollView.layoutIfNeeded()
        operatingScrollView.setContentOffset(CGPoint(x: 0, y: operatingScrollView.contentSize.height - operatingScrollView.bounds.height), animated: true)
    }
}
