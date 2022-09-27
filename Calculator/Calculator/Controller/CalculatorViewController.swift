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
    
    
}
