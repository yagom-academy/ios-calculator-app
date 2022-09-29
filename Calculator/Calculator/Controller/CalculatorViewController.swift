//
//  Calculator - CalculatorViewController.swift
//  Created by 미니.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var currentNumbersLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    
    private var mathExpression: String = ""
    private var selectedNumbers: String = ""
    private var selectedOperator: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTappedNumberButton(_ sender: UIButton) {
        if selectedNumbers.isEmpty {
            mathExpression.append(selectedOperator)
        }
        
        guard let inputNumber = sender.titleLabel?.text else {
            return
        }
        
        selectedNumbers.append(inputNumber)
        currentNumbersLabel.text = selectedNumbers
        
    }
    
    @IBAction func didTappedOperatorButton(_ sender: UIButton) {
        mathExpression.append(selectedNumbers)
        selectedNumbers = ""
        
        guard let inputedOperator = sender.titleLabel?.text else {
            return
        }
        
        selectedOperator = inputedOperator
        currentOperatorLabel.text = inputedOperator
    }
    @IBAction func didTappedEqualButton(_ sender: UIButton) {
        
        guard let lastElement = mathExpression.last else {
            return
        }
        
        if lastElement.shouldConvertOperator {
            mathExpression.append(selectedNumbers)
        }
        
    }
}
