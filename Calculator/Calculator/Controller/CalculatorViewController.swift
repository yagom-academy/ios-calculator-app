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
    
    @IBAction func didTappedOperator(_ sender: UIButton) {
        
        guard let inputedOperator = sender.titleLabel?.text else {
            return
        }
        
        userInputExpression.append(selectedNumbers)
        selectedNumbers = ""
        currentNumberLabel.text = "0"
        
        guard isNotEmptyExpression else {
            return
        }
        
        selectedOperator = inputedOperator
        currentOperatorLabel.text = selectedOperator
        
    }
    
    @IBAction func didTappedEqualButton(_ sender: UIButton) {
        guard let lastElement = userInputExpression.last else {
            return
        }
        if Operator(rawValue: lastElement) != nil {
            userInputExpression.append(selectedNumbers)
        }
        
        setUpLabelWithCalculateResult()
    }

    private func setUpLabelWithCalculateResult() {
        
        let formula = ExpressionParser.parse(from: userInputExpression)
        
        switch formula.result() {
        case .success(let calculatedValue):
            currentNumberLabel.text = calculatedValue.description.calNumber
            currentOperatorLabel.text = ""
        case .failure(let error):
            print(error)
        }
        
    }
}
