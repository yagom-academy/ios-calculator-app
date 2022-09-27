//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainOperatorLabel: UILabel!
    @IBOutlet weak var mainResultLabel: UILabel!
    
    @IBOutlet weak var historyScrollView: UIScrollView!
    @IBOutlet weak var historyStackView: UIStackView!
    
    var currentOperand: String = Constant.defaultZero
    var currentOperator: String = Constant.empty
    var calculateHistory: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUILabel()
    }
    
    func setUILabel() {
        mainOperatorLabel.text = Constant.empty
        mainResultLabel.text = Constant.zero
    }
    
    func setDefaultOperand() {
        mainResultLabel.text = Constant.zero
        currentOperand = Constant.defaultZero
    }

    func updateMainResultLabel() {
        mainResultLabel.text = currentOperand
    }
    
    @IBAction func tappedNumberPads(_ sender: UIButton) {
        let tappedNumber = sender.currentTitle
        guard let number = tappedNumber else { return }
        
        if currentOperand == Constant.defaultZero || currentOperand == Constant.zero {
            if number == Constant.doubleZero {
                return
            }
            currentOperand = number
        } else {
            currentOperand += number
        }
        
        updateMainResultLabel()
    }
    
    @IBAction func tappedOperatorPads(_ sender: UIButton) {
        let tappedOperator = sender.currentTitle
        guard let operators = tappedOperator else { return }
        mainOperatorLabel.text = operators
        
        if currentOperand == Constant.defaultZero {
            currentOperator = operators
            return
        }
        
        calculateHistory.append(currentOperator)
        calculateHistory.append(currentOperand)
        
        currentOperator = operators
        setDefaultOperand()
    }
    
    @IBAction func tappedCalculate(_ sender: UIButton) {
        if currentOperand == Constant.defaultZero || calculateHistory.isEmpty {
            return
        }
        
        calculateHistory.append(currentOperator)
        calculateHistory.append(currentOperand)
        calculateHistory.removeFirst()
        
        let formula = ExpressionParser.parse(from: calculateHistory.joined())
        
        do {
            mainResultLabel.text = try String(formula.result())
        } catch CalculatorError.noneOperand {
            
        } catch CalculatorError.noneOperator {
            
        } catch {
            
        }
    }
    
    @IBAction func tappedDotPads(_ sender: UIButton) {
        if currentOperand.contains(Constant.dot) || currentOperand == Constant.defaultZero {
            return
        } else {
            currentOperand += Constant.dot
        }
        
        updateMainResultLabel()
    }
    
    @IBAction func tappedChangePositiveNegative(_ sender: UIButton) {
        if currentOperand == Constant.defaultZero || currentOperand == Constant.zero {
            return
        }
        
        if currentOperand.contains(Constant.negative) {
            currentOperand.removeFirst()
        } else {
            currentOperand = Constant.negative + currentOperand
        }
        
        updateMainResultLabel()
    }
    
    @IBAction func tappedAllClear(_ sender: UIButton) {
        
    }
    
    @IBAction func tappedClearEntry(_ sender: UIButton) {

    }
}

