//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
        
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var dotButton: UIButton!
    
    @IBOutlet weak var doubleZeroButton: UIButton!
    @IBOutlet weak var singleZeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    var stringToBeCalculated = ""
    var currentNumber = ""
    
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
        insertString(titleName: sender.titleLabel?.text)
        setCurrentNumber(titleName: sender.titleLabel?.text)
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
        stringToBeCalculated += titleName ?? ""
    }
    
    func insertOperatorSign(titleName: String?) {
        if stringToBeCalculated == "" {
            stringToBeCalculated += "0"
        } else {
            let lastIndex = stringToBeCalculated.index(before: stringToBeCalculated.endIndex)
            let lastString = stringToBeCalculated[lastIndex]
            if stringToBeCalculated == "" {
                stringToBeCalculated += "0"
            }
            if Operator(rawValue: lastString) != nil {
                stringToBeCalculated = String(stringToBeCalculated.dropLast())
            }
        }
        insertString(titleName: titleName)
    }
    
    func setCurrentNumber(titleName: String?) {
        currentNumber += titleName ?? ""
        displayCurrentNumber()
    }
    
    func displayCurrentNumber() {
        currentNumberLabel.text = currentNumber
    }
    
    func displayCurrentOperator(titleName: String?) {
        currentOperatorLabel.text = titleName
    }
    
    func resetCurrentNumber() {
        currentNumber = ""
        currentNumberLabel.text = currentNumber
    }
    
    func initializeCurrentOperator() {
        currentOperatorLabel.text = ""
    }
    
    func allClear() {
        stringToBeCalculated = ""
        currentNumberLabel.text = "0"
        currentOperatorLabel.text = ""
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
        var calculateFormula = ExpressionParser.parse(from: stringToBeCalculated)
        return calculateFormula.result()
    }
    
    func displayResult(result: Double) {
        currentNumberLabel.text = String(result)
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
        stringToBeCalculated = stringToBeCalculated.replacingOccurrences(of: "--", with: "")
        currentNumber = currentNumber.replacingOccurrences(of: "--", with: "")
        displayCurrentNumber()
    }
}
