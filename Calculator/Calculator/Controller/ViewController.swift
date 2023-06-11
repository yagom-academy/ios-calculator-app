//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var numberInputLabel: UILabel!
    @IBOutlet weak var operatorsLabel: UILabel!
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var firstOperatorLabel: UILabel!
    @IBOutlet weak var secondOperatorLabel: UILabel!
    @IBOutlet weak var operatorStackView: UIStackView!
    
    private var isReset: Bool = false
    
    let operandQueue = CalculatorItemQueue<Double>()
    let operatorQueue = CalculatorItemQueue<Operator>()
    var defaultNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        guard defaultNumber.count < 20 else { return }
        
        defaultNumber += numberValue
        numberInputLabel.text = defaultNumber
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        defaultNumber = ""
        operatorsLabel.text = ""
        numberInputLabel.text = "0"
        firstNumberLabel.text = ""
        secondNumberLabel.text = ""
        secondOperatorLabel.text = ""
        operandQueue.removeAll()
        operatorQueue.removeAll()
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        guard defaultNumber.count < 20,
              !defaultNumber.contains(".") else { return }
        
        defaultNumber += defaultNumber.isEmpty ? "0." : "."
        numberInputLabel.text = defaultNumber
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard let operatorString = sender.titleLabel?.text,
              let selectedOperator = Operator(rawValue: Character(operatorString)) else {
            return
        }
        
        operatorsLabel.text = operatorString
        
        
        if let number = Double(defaultNumber) {
            operandQueue.enqueue(item: number)
            defaultNumber = ""
        }
        
        updateDisplayLabels()
        operatorQueue.enqueue(item: selectedOperator)
        
        
        guard let op = operatorsLabel.text?.count else { return }
        
        if  op >= 1 {
            firstOperatorLabel.text = operatorsLabel.text
        }
        firstNumberLabel.text = numberInputLabel.text
        
        let operatorLabel = UILabel()
        operatorLabel.text = operatorString
        operatorStackView.addArrangedSubview(operatorLabel)
        operatorStackView.addSubview(operatorLabel)
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        if let number = Double(defaultNumber) {
            operandQueue.enqueue(item: number)
            defaultNumber = ""
        }
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        do {
            let result = try formula.result()
            numberInputLabel.text = String(result)
        } catch {
            print(error)
        }
        
        operandQueue.removeAll()
        operatorQueue.removeAll()
        firstNumberLabel.text = ""
        firstOperatorLabel.text = ""
        
    }
    
    func updateDisplayLabels() {
        secondNumberLabel.text = firstNumberLabel.text
        secondOperatorLabel.text = firstOperatorLabel.text
    }
}
