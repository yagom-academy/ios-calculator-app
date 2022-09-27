//
//  Calculator - CalculatorViewController.swift
//  Created by 미니.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    
    var prevNumber: String = ""
    var operatorValue: String = ""
    var nextNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeNumberLabel(value: "0")
    }
    
    
    @IBAction func didTappedNumberButton(_ sender: UIButton) {
        let input = sender.titleLabel?.text
        guard let input else {
            return
        }
        setUserInputNumber(value: input)
        
    }
    
    
    @IBAction func didTappedOperator(_ sender: UIButton) {
        let input = sender.titleLabel?.text
        
        guard let input else {
            return
        }
        
        operatorValue = input
        changeOperatorLabel(value: input)
        
    }
    
    
    private func setUserInputNumber(value: String) {
        if operatorValue.isEmpty {
            prevNumber.append(value)
            changeNumberLabel(value: prevNumber)
        } else {
            nextNumber.append(value)
            changeNumberLabel(value: nextNumber)
        }
    }
    
    private func changeNumberLabel(value: String) {
        currentNumberLabel.text = value
    }
    
    private func changeOperatorLabel(value: String) {
        currentOperatorLabel.text = value
    }
}

