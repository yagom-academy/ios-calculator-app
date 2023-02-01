//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
        
    var calculateExpression: String = ""
    var operandExpression: String = ""
    let numberFormatter = NumberFormatter()
    
    var a: [String] = []
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var expressionStackView: UIStackView!
    @IBOutlet weak var expressionScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func numberButton(sender: UIButton) {
 
        guard let buttonNumberValue = sender.titleLabel?.text  else { return }
            operandExpression += buttonNumberValue
            numberLabel.text = operandExpression
    }
    
    @IBAction func operatorButton(sender: UIButton) {
                
        guard let `operator` = sender.titleLabel?.text else { return }
        guard let operatorExpression = operatorLabel.text else { return }
        
        operatorLabel.text = `operator`
        
        if operandExpression == "" { return } // 맨 앞에 operator가 못오게 방지하는 것
        
        
        if calculateExpression.isEmpty {
            calculateExpression += operandExpression
            a.append(operandExpression)
            makeExpressionStackView(operatorType: operatorExpression, operand: operandExpression)
            print(`operator`)
        
        } else {
            calculateExpression += operatorExpression + operandExpression
            a.append(operatorExpression + operandExpression)
            makeExpressionStackView(operatorType: operatorExpression, operand: operandExpression)
        }
        
        operandExpression = ""
        print(a)
    }
    
    func makeFirstExpressionStackView(operand: String) {
        let operandExpressionLabel: UILabel = {
            let operandExpressionLabel = UILabel()
            operandExpressionLabel.text = operand
            operandExpressionLabel.textColor = .white
            return operandExpressionLabel
        }()
        
        let partOfExpressionStackView: UIStackView = { let partOfExpressionStackView = UIStackView()
            partOfExpressionStackView.axis = .horizontal
            partOfExpressionStackView.distribution = .fillProportionally
            return partOfExpressionStackView
        }()
        partOfExpressionStackView.addArrangedSubview(operandExpressionLabel)
        
        expressionStackView.addArrangedSubview(partOfExpressionStackView)
    }
    
    func makeExpressionStackView(operatorType: String, operand: String) {
        let operatorExpressionLabel: UILabel = {
            let operatorExpressionLabel = UILabel()
            operatorExpressionLabel.textColor = .white
            return operatorExpressionLabel
        }()
        
        let operandExpressionLabel: UILabel = {
            let operandExpressionLabel = UILabel()
            operandExpressionLabel.textColor = .white
            return operandExpressionLabel
        }()
        
        operatorExpressionLabel.text = operatorType
        operandExpressionLabel.text = operand
        
        if Double(calculateExpression) != nil {
            operatorExpressionLabel.text = nil
            operandExpressionLabel.text = operand
        } else {
            operatorExpressionLabel.text = operatorType
            operandExpressionLabel.text = operand
        }
            

            let partOfExpressionStackView = UIStackView()
            partOfExpressionStackView.axis = .horizontal
            partOfExpressionStackView.distribution = .fillProportionally
            partOfExpressionStackView.spacing = 5
            partOfExpressionStackView.addArrangedSubview(operatorExpressionLabel)
            partOfExpressionStackView.addArrangedSubview(operandExpressionLabel)
        
        expressionStackView.addArrangedSubview(partOfExpressionStackView)
        expressionStackView.layoutIfNeeded()
    }
    
    func setScrollView() {
        expressionScrollView.layoutIfNeeded()
        expressionScrollView.setContentOffset(<#T##contentOffset: CGPoint##CGPoint#>, animated: <#T##Bool#>)
    }
    
    @IBAction func ceButton(_ sender: Any) {
        operandExpression = ""
            numberLabel.text = ""
    }
    
    @IBAction func acButton(sender: UIButton) {
        
    }
    
    @IBAction func resultButton(sender: UIButton) {
        print(calculateExpression)
    }
}

