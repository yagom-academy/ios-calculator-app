//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    private var currentNumber: String = "0"
    private var currentOperator: String = ""
    private var snippets: [(`operator`: String, operand: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshNumberLabel()
        refreshOperatorLabel()
    }
    
    func refreshNumberLabel() {
        DispatchQueue.main.async {
            self.currentNumberLabel.text = self.currentNumber
        }
    }
    
    func refreshOperatorLabel() {
        DispatchQueue.main.async {
            self.currentOperatorLabel.text = self.currentOperator
        }
    }
    
    func translateOperator(_ symbol: String) -> String {
        switch symbol {
        case "+":
            return "+"
        case "–":
            return "–"
        case "×":
            return "*"
        case "÷":
            return "/"
        default:
            return ""
        }
    }
    
    @IBAction func pressNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        switch currentNumber {
        case "0":
            currentNumber = number
        default:
            currentNumber += number
        }
        
        refreshNumberLabel()
    }
    
    
    @IBAction func pressOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
        
        switch currentNumber {
        case "0":
            currentOperator = `operator`
        case "NaN", "Err":
            return
        default:
            let operatorNow = translateOperator(currentOperator)
            snippets.append((operatorNow, currentNumber))
            currentOperator = `operator`
            currentNumber = "0"
        }
        
        refreshNumberLabel()
        refreshOperatorLabel()
    }
    
    @IBAction func pressEqualButton(_ sender: UIButton) {
        let operatorNow = translateOperator(currentOperator)
        snippets.append((operatorNow, currentNumber))
        
        var totalString = ""
        snippets.forEach {
            totalString += $0.`operator`
            totalString += $0.operand
        }
        
        let formula = ExpressionParser.parse(from: totalString)
        
        do {
            let result = try formula.result()
            currentNumber = String(result)
        } catch CalculatorError.dividedByZero {
            currentNumber = "NaN"
        } catch {
            currentNumber = "Err"
        }
        currentOperator = ""
        
        refreshNumberLabel()
        refreshOperatorLabel()
    }
    
    
    @IBAction func pressCEButton(_ sender: UIButton) {
        currentNumber = "0"

        refreshNumberLabel()
    }
    
    
    @IBAction func pressACButton(_ sender: UIButton) {
        snippets = []
        currentNumber = "0"
        currentOperator = ""
        
        refreshNumberLabel()
        refreshOperatorLabel()
    }
}

