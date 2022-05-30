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
    
    var inputValue = ""
    var presentNumbers = ""
    var presentOperator = ""
    var operatorStorage = [""]
    
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
        let ButtonTitle = sender.currentTitle!

        if !operatorStorage.isEmpty {
            inputValue += presentNumbers
            inputValue += " \(operatorStorage.removeLast()) "
            
            presentNumbers = ""
            operatorStorage = []
            
            presentNumbers += "\(ButtonTitle)"
            numberLabel.text = "\(ButtonTitle)"
            
        } else if presentNumbers.contains(".") && ButtonTitle == "." {
            return
            
        } else {
            presentNumbers += "\(ButtonTitle)"
            numberLabel.text = "\(presentNumbers)"
        }
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        let ButtonTitle = sender.currentTitle!
        
        presentOperator = ButtonTitle
        operatorLabel.text = "\(ButtonTitle)"
        
        if ["+", "−", "÷", "×"].contains(ButtonTitle) {
            operatorStorage.append(" \(ButtonTitle) ")
                        
            makeStackLabel()
            numberLabel.text = "0"
            
        } else if ["="].contains(ButtonTitle) {
            didTapAnswerButton()
            
        }
    }
    
    @IBAction func touchOptionButton(_ sender: UIButton) {
        let ButtonTitle = sender.currentTitle!
        
        if ["AC"].contains(ButtonTitle) {
            didTapACButton()
            
        } else if ["CE"].contains(ButtonTitle) {
            didTapCEButton()
            
        } else if ["⁺⁄₋"].contains(ButtonTitle) && presentNumbers != "0" {
            didTapSignButton()
            
        }
    }
    
    private func makeStackLabel() {
        let stackView = UIStackView()
        let stackNumberLabel = UILabel()
        let stackOperatorLabel = UILabel()
        
        let bottomOffset = CGPoint(x: 0,
                                   y: previousValues.contentSize.height
                                   - previousValues.bounds.height
                                   + numberLabel.font.lineHeight)
        previousValues.setContentOffset(bottomOffset, animated: false)
        
        stackNumberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackNumberLabel.textColor = .white
        stackOperatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackOperatorLabel.textColor = .white
        
        stackNumberLabel.text = "\(presentNumbers)"
        stackOperatorLabel.text = "\(presentOperator) "
        
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

        if !presentNumbers.isEmpty && !inputValue.isEmpty {
            var parse = ExpressionParser.parse(from: (inputValue))
            let result = try! parse.result()
            
            if result.description.count < 20 {
                guard let NSNresult = numberFormatter.string(from: result as NSNumber) else {
                    return
                }
                numberLabel.text = "\(NSNresult)"
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

