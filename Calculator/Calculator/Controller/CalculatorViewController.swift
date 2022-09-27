//
//  Calculator - CalculatorViewController.swift
//  Created by 미니.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    @IBOutlet weak var recordedCalculateStackView: UIStackView!
    
    var userInputExpression: String = ""
    var selectedNumbers: String = ""
    var selectedOperator: String = ""
    
    var isNotEmptyExpression: Bool {
        return !userInputExpression.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentOperatorLabel.text = ""
        currentNumberLabel.text = "0"
    }
    
    @IBAction func didTappedNumberButton(_ sender: UIButton) {
        
        if selectedNumbers.isEmpty {
            userInputExpression.append(selectedOperator)
        }
        
        guard let inputNumber: String = sender.titleLabel?.text else {
            return
        }
        
        selectedNumbers.append(inputNumber)
        currentNumberLabel.text = selectedNumbers
        
    }
    
}
