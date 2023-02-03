//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    
    @IBOutlet weak var verticalStackView: UIStackView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var stringToBeCalculated = NameSpace.emptyString
    var currentNumber = NameSpace.emptyString
    var isCalculated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCurrentOperator()
        verticalStackView.subviews.forEach { subView in
            subView.removeFromSuperview()
        }
    }
    
    @IBAction func tapACButton(_ sender: UIButton) {
        allClear()
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
        if isCalculated {
            allClear()
            isCalculated = false
            return
        }
        clearEntry()
    }
    
    @IBAction func tapConvertSignButton(_ sender: UIButton) {
        convertSign()
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
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
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if currentNumber.contains(".") == false {
            if currentNumber == NameSpace.emptyString {
                currentNumber += NameSpace.stringZero
                stringToBeCalculated += NameSpace.stringZero
            }
            insertString(titleName: sender.titleLabel?.text)
            setCurrentNumber(titleName: sender.titleLabel?.text)
        }
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        displayPreviousOperands()
        insertOperatorSign(titleName: sender.titleLabel?.text)
        displayCurrentOperator(titleName: sender.titleLabel?.text)
        resetCurrentNumber()
    }
    
    func displayPreviousOperands() {
        let operateStackView = OperateStackView(operatorText: currentOperatorLabel.text, operandsText: currentNumberLabel.text?.floorIfZero)
        verticalStackView.addArrangedSubview(operateStackView)
    }
    
    @IBAction func tapCalculateButton(_ sender: UIButton) {
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
    
    func insertString(titleName: String?) {
        stringToBeCalculated += titleName ?? NameSpace.emptyString
    }
    
    func insertOperatorSign(titleName: String?) {
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
    
    func removePreviousOperands() {
        guard let stackViewWillBeRemoved = verticalStackView.subviews.last else {
            return
        }
        stackViewWillBeRemoved.removeFromSuperview()
    }
    
    func setCurrentNumber(titleName: String?) {
        currentNumber = currentNumber.replacingOccurrences(of: ",", with: NameSpace.emptyString)
        currentNumber += titleName ?? NameSpace.emptyString
        currentNumber = currentNumber.insertComma
        displayCurrentNumber()
    }

    func displayCurrentNumber() {
        currentNumberLabel.text = currentNumber
    }
    
    func displayCurrentOperator(titleName: String?) {
        currentOperatorLabel.text = titleName
    }
    
    func resetCurrentNumber() {
        currentNumber = NameSpace.stringZero
        currentNumberLabel.text = currentNumber
    }
    
    func initializeCurrentOperator() {
        currentOperatorLabel.text = NameSpace.emptyString
    }
    
    func allClear() {
        stringToBeCalculated = NameSpace.emptyString
        currentNumber = NameSpace.emptyString
        currentNumberLabel.text = NameSpace.stringZero
        currentOperatorLabel.text = NameSpace.emptyString
        verticalStackView.subviews.forEach { subView in
            subView.removeFromSuperview()
        }
    }
    
    func clearEntry() {
        for input in stringToBeCalculated.reversed() {
            if Operator(rawValue: input) == nil {
                stringToBeCalculated = String(stringToBeCalculated.dropLast())
            } else {
                break
            }
        }
        resetCurrentNumber()
    }
    
    func calculate() -> Double {
        let lastIndex = stringToBeCalculated.index(before: stringToBeCalculated.endIndex)
        let lastString = stringToBeCalculated[lastIndex]
        if Operator(rawValue: lastString) != nil {
            stringToBeCalculated = stringToBeCalculated + NameSpace.stringZero
        }
        var calculateFormula = ExpressionParser.parse(from: stringToBeCalculated)
        stringToBeCalculated = NameSpace.emptyString
        return calculateFormula.result()
    }
    
    func displayResult(result: Double) {
        currentNumberLabel.text = String(result).floorIfZero.insertComma
    }
    
    func convertSign() {
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
