//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var formulaStackView: UIStackView!
    @IBOutlet weak var formulaScrollView: UIScrollView!
    
    //MARK: - Properties
    
    var calculatorManager = CalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorManager.delegate = self
    }
    //MARK: - Actions
    
    @IBAction func numberPadTapped(_ sender: UIButton) {
        guard let operand = sender.currentTitle else {
            return
        }
        updateOperandLabel(by: operand)
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {
            return
        }
        updateOperatorLabel(by: `operator`)
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
    }
}

extension CalculatorController: CalculatorManagerDelegate {
    func updateOperandLabel(by newOperand: String) {
        operandLabel.text = newOperand
    }
    
    func updateOperatorLabel(by newOperator: String) {
        operatorLabel.text = newOperator
    }
}
