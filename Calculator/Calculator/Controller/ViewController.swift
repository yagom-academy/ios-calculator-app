//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var numberInputLabel: UILabel!
    @IBOutlet weak var operatorsLabel: UILabel!
    let operandQueue = CalculatorItemQueue<Double>()
    let operatorQueue = CalculatorItemQueue<Operator>()
    var defaultNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        guard defaultNumber.count > 20 else {
            defaultNumber += numberValue
            numberInputLabel.text = defaultNumber
            return
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        defaultNumber = ""
        numberInputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        guard defaultNumber.count > 20,
              defaultNumber.contains(".") else {
            defaultNumber += defaultNumber.isEmpty ? "0." : "."
            numberInputLabel.text = defaultNumber
            return
        }
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard let operatorString = sender.titleLabel?.text,
              let selectedOperator = Operator(rawValue: Character(operatorString)) else {
            return
        }
        
        operatorsLabel.text = operatorString
        operatorQueue.enqueue(item: selectedOperator)
        
        if let number = Double(defaultNumber) {
            operandQueue.enqueue(item: number)
            defaultNumber = ""
        }
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        if let number = Double(defaultNumber) {
            operandQueue.enqueue(item: number)
            defaultNumber = ""
        }
        
        while let operatorItem = operatorQueue.dequeueItem(),
              let operand1 = operandQueue.dequeueItem(),
              let operand2 = operandQueue.dequeueItem() {
            let result = operatorItem.calculate(operand1, operand2)
            operandQueue.enqueue(item: result)
        }
        
        if let result = operandQueue.lastItem {
            numberInputLabel.text = String(result)
        }
        
        operandQueue.removeAll()
        operatorQueue.removeAll()
    }
}

