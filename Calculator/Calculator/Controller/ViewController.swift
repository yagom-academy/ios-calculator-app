//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operators: UILabel!
    @IBOutlet weak var operands: UILabel!
    private var saveFormula = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operands.text = "0"
        operators.text = ""
    }

    @IBAction func tappedOperands(_ sender: UIButton) {
        guard let operand = sender.currentTitle else {
            return
        }
        
        operands.text = operand
    }
    
    @IBAction func tappedOperator(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {
            return
        }
        
        if operands.text != "0" {
            guard let operatorString = operators.text else { return }
            guard let operandString = operands.text else { return }
            
            saveFormula.append("\(operatorString) ")
            saveFormula.append("\(operandString) ")
        }
        operators.text = `operator`
    }
    
    @IBAction func tappedResultButton(_ sender: Any) {
        guard let operatorString = operators.text else { return }
        guard let operandString = operands.text else { return }
        
        saveFormula.append("\(operatorString) ")
        saveFormula.append("\(operandString) ")
        
        var formula = ExpressionParser.parse(from: saveFormula.joined())
        
        do {
            let result = try formula.result()
            operands.text = String(result)
        } catch CalculatorError.divideByZero {
            operands.text = "NaN"
        } catch CalculatorError.invalidFormula {
            operands.text = ""
        } catch {
            operands.text = ""
        }
    }
    
}

