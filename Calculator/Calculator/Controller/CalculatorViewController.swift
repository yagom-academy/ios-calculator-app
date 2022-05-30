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
    
    var userIsInTheMiddleOfTyping = false
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
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        
        if userIsInTheMiddleOfTyping {
            inputValue += presentNumbers
            inputValue += " \(operatorStorage.removeLast()) "
            
            presentNumbers = ""
            operatorStorage = []
            
            presentNumbers += "\(buttonTitle)"
            numberLabel.text = "\(buttonTitle)"
            
        } else if presentNumbers.contains(".") && buttonTitle == "." {
            return
            
        } else {
            presentNumbers += "\(buttonTitle)"
            numberLabel.text = "\(presentNumbers)"
        }
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        
        if userIsInTheMiddleOfTyping {
            presentOperator = buttonTitle
            operatorLabel.text = "\(buttonTitle)"
            
            operatorStorage.append(" \(buttonTitle) ")
            numberLabel.text = "0"
        } else {
            makeStackLabel()
            
            presentOperator = buttonTitle
            operatorLabel.text = "\(buttonTitle)"
            
            operatorStorage.append(" \(buttonTitle) ")
            numberLabel.text = "0"
            userIsInTheMiddleOfTyping = true
        }
    }
    
    @IBAction func touchResultButton(_ sender: UIButton) {
        didTapAnswerButton()
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction func touchOptionButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        
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
                                   y: previousValues.contentSize.height
                                   - previousValues.bounds.height
                                   + numberLabel.font.lineHeight)
        previousValues.setContentOffset(bottomOffset, animated: false)
        
        stackNumberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackNumberLabel.textColor = .white
        stackOperatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackOperatorLabel.textColor = .white
        
        if userIsInTheMiddleOfTyping {
            stackNumberLabel.text = "\(presentNumbers)"
        } else {
            stackNumberLabel.text = "\(presentNumbers)"
            stackOperatorLabel.text = "\(presentOperator) "
        }
        
        stackView.addArrangedSubview(stackOperatorLabel)
        stackView.addArrangedSubview(stackNumberLabel)
        valuesStackView.addArrangedSubview(stackView)
    }
    
    private func makeResultLabel() {
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
                guard let trimmedResult = numberFormatter.string(from: result as NSNumber) else {
                    return
                }
                numberLabel.text = "\(trimmedResult)"
                makeResultLabel()
            }
        }
        presentNumbers = ""
    }
    
    private func didTapACButton() {
        presentNumbers = ""
        presentOperator = ""
        inputValue = ""
        numberLabel.text = "0"
        operatorLabel.text = ""
        
        valuesStackView.subviews.forEach { views in
            views.removeFromSuperview()
        }
        userIsInTheMiddleOfTyping = false
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

