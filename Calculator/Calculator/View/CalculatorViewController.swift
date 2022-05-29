//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

//- MARK: View Properties

final class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operandsLabel: UILabel?
    @IBOutlet private weak var operatorsLabel: UILabel?
    @IBOutlet private weak var formulaStackView: UIStackView?
    @IBOutlet private weak var savedValueScrollView: UIScrollView?
    

//- MARK: View LifeCycle

extension CalculatorViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefalut()
    }
}

//- MARK: IBAction

private extension CalculatorViewController {
    @IBAction func operandsDidTapped(_ operands: UIButton) {
        guard let value = operands.currentTitle else {
            return
        }
        
        self.fetchOperand(value)
    }
    
    @IBAction func operatorsDidTapped(_ operators: UIButton) {
        guard let value = operators.currentTitle,
              isDefaultState == false else {
            operatorsLabel?.text = operators.currentTitle
            return
        }
        
        self.fetchOperator(value)
    }
    
    @IBAction func calculatorSignTapped(_ signs: UIButton) {
    }
}

//- MARK: private funtions

private extension CalculatorViewController {
    func setDefalut() {
        operandsLabel?.text = CalculatorState.zero.value
        operatorsLabel?.text = CalculatorState.empty.value
    }
    
    func fetchOperand(_ newValue: String) {
        if isCalculated {
            operandsLabel?.text = CalculatorState.empty.value
        }
    
        guard let oldValue = operandsLabel?.text,
              check(oldValue) else {
            
            operandsLabel?.text = newValue
            return
        }
        
        let result = oldValue + newValue
        
        if(isContainedDot) {
            operandsLabel?.text = result
            return
        }
        
        if let number = numberFormatter.number(from: result.replacingOccurrences(of: ",", with: CalculatorState.empty.value)) {
            operandsLabel?.text = numberFormatter.string(from: number)
        }
        
        isTapped = false
    }
    
    func fetchOperator(_ value: String) {
        if (!isTapped) {
            operatorsLabel?.text = value
            operandsLabel?.text = CalculatorState.zero.value
            isTapped = true
        }
    }
    
    }
}
