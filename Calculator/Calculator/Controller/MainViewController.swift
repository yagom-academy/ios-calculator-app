//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    enum Condition {
        static let zero = "0"
        static let zeroTwice = "00"
        static let empty = ""
        static let minus = "-"
    }
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCurrentCalculateItem()
    }
    
    private func initializeCurrentCalculateItem() {
        self.operandLabel.text = Condition.zero
        self.operatorLabel.text = Condition.empty
    }
    
    @IBAction func makeOperand(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text else { return }
        
        if let operand = operandLabel.text,
           operand != Condition.zero {
            operandLabel.text = operand + inputNumber
        } else if let operand = operandLabel.text,
                  operand == Condition.zero,
                  inputNumber != Condition.zero,
                  inputNumber != Condition.zeroTwice {
            operandLabel.text = inputNumber
        }
    }
    
    @IBAction func clearOperandLabel(_ sender: UIButton) {
        operandLabel.text = Condition.zero
    }
    
    @IBAction func toggleSign(_ sender: UIButton) {
        guard let operandText = operandLabel.text,
              operandText != Condition.zero,
              let currentOperand = Double(operandText) else { return }
        
        operandLabel.text = String(-currentOperand)
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.titleLabel?.text else { return }
        
        if operandLabel.text == Condition.zero {
            operatorLabel.text = inputOperator
        } else {
            guard let subview = generateStackView(from: currentCalculateItem) else { return }
            add(subview, to: calculateItemStackView)
            
        }
    }
    
    @IBOutlet weak var calculateItemStackView: UIStackView!
    @IBOutlet weak var currentCalculateItem: UIStackView!
    
    func add(_ subview: UIStackView, to superview: UIStackView) {
        let calculateItem = subview
        
            superview.addArrangedSubview(calculateItem)
    }
    
    func generateStackView(from reference: UIStackView) -> UIStackView? {
        let calculateItem = reference
//        var result = UIStackView()
//        result = calculateItem
        
        return calculateItem
    }

    
}

