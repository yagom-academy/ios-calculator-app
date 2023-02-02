//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    
    
    
    var stringToBeCalculated = NameSpace.emptyString
    var currentNumber = NameSpace.emptyString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCurrentOperator()
    }
    
    @IBAction func tapACButton(_ sender: UIButton) {
        allClear()
        print(stringToBeCalculated)
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
        clearEntry()
        print(stringToBeCalculated)
    }
    
    @IBAction func tapConvertSignButton(_ sender: UIButton) {
        convertSign()
        print(stringToBeCalculated)
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        insertString(titleName: sender.titleLabel?.text)
        setCurrentNumber(titleName: sender.titleLabel?.text)
        print(stringToBeCalculated)
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
        print(stringToBeCalculated)
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        insertOperatorSign(titleName: sender.titleLabel?.text)
        displayCurrentOperator(titleName: sender.titleLabel?.text)
        resetCurrentNumber()
        print(stringToBeCalculated)
    }
    
    @IBAction func tapCalculateButton(_ sender: UIButton) {
        resetCurrentNumber()
        initializeCurrentOperator()
        let result = calculate()
        displayResult(result: result)
        print(result)
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
            }
        }
        insertString(titleName: titleName)
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
