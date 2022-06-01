//
//  Calculator - CalculatorViewController.swift
//  Created by Brad.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBOutlet weak var firstNumberLable: UILabel!
    @IBOutlet weak var secondNumberLable: UILabel!
    @IBOutlet weak var firstOperatorLabel: UILabel!
    @IBOutlet weak var secondOperatorLabel: UILabel!
    
    @IBOutlet weak var previousValues: UIScrollView!
    @IBOutlet weak var valuesStackView: UIStackView!
    
    var inputValue: String = ""
    var presentNumbers: String = ""
    var presentOperator: String = ""
    var operatorStorage: [String] = []
    var operatorChoice: String = ""
    
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
        operatorLabel.text = ""
        removeOldLabls()
        
        numberFormatter.roundingMode = .floor
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 3
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        
        if operatorStorage.isEmpty == false {
            operatorChoice += operatorStorage.removeLast()
            inputValue += presentNumbers
            inputValue += " \(operatorChoice) "
            
            presentNumbers = ""
            operatorChoice = ""
            operatorStorage = []
            
            presentNumbers += buttonTitle
            numberLabel.text = buttonTitle
            
        } else if presentNumbers.contains(".") && buttonTitle == "." {
            return
            
        } else {
            presentNumbers += buttonTitle
            numberLabel.text = presentNumbers
        }
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        
        presentOperator = buttonTitle
        operatorLabel.text = buttonTitle    
        
        if ["+", "−", "÷", "×"].contains(buttonTitle) {
            operatorStorage.append(" \(buttonTitle) ")
            makeStackLabel()
            numberLabel.text = "0"
            
        }
        
        if ["="].contains(buttonTitle) {
            didTapAnswerButton()
            
        }
    }
    
    @IBAction func touchOptionButton(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        
        if ["AC"].contains(buttonTitle) {
            didTapACButton()
            
        }
        
        if ["CE"].contains(buttonTitle) {
            didTapCEButton()
            
        }
        
        if ["⁺⁄₋"].contains(buttonTitle) && presentNumbers != "0" {
            didTapSignButton()
    
        }
    }
    
    private func makeStackLabel() {
        let stackView = UIStackView()
        let stackNumberLabel = UILabel()
        let stackOperatorLabel = UILabel()
        
        let bottomOffset = CGPoint(x: 0,
                                   y: previousValues.contentSize.height -
                                   previousValues.bounds.height +
                                   numberLabel.font.lineHeight)
        previousValues.setContentOffset(bottomOffset, animated: false)
        
        stackNumberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackNumberLabel.textColor = .white
        stackOperatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackOperatorLabel.textColor = .white
        
        stackNumberLabel.text = presentNumbers
        stackOperatorLabel.text = presentOperator
        
        stackView.addArrangedSubview(stackOperatorLabel)
        stackView.addArrangedSubview(stackNumberLabel)
        valuesStackView.addArrangedSubview(stackView)
    }
    
    private func removeOldLabls() {
        firstNumberLable.removeFromSuperview()
        secondNumberLable.removeFromSuperview()
        firstOperatorLabel.removeFromSuperview()
        secondOperatorLabel.removeFromSuperview()
    }
    
    private func didTapAnswerButton() {
        inputValue += presentNumbers

        if presentNumbers.isEmpty == false && inputValue.isEmpty == false {
            var parse = ExpressionParser.parse(from: (inputValue))
            let result = try! parse.result()
            
            if result.description.count < 20 {
                guard let NSNresult = numberFormatter.string(from: result as NSNumber) else {
                    return
                }
                numberLabel.text = NSNresult
            }
        }
        inputValue = ""
        presentNumbers = ""
    }
    
    private func didTapACButton() {
        presentNumbers = ""
        inputValue = ""
        numberLabel.text = "0"
        operatorLabel.text = ""
        
        valuesStackView.subviews.forEach { views in
            views.removeFromSuperview()
        }
    }
    
    private func didTapCEButton() {
        presentNumbers = ""
        numberLabel.text = "0"
    }
    
    private func didTapSignButton() {
        if presentNumbers.contains("-") {
            presentNumbers = presentNumbers.filter { word in
                if word == "-" {
                    return false
                }
                return true
            }
        } else {
            presentNumbers = "-" + presentNumbers
        }
        numberLabel.text = "\(presentNumbers)"
    }
}

