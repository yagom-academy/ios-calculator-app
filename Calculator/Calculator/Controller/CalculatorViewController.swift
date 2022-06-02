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
    
    let numberFormatter = NumberFormatter()
    
    var inputValue = ""
    var presentValue = ""
    var presentOperator = ""
    var operatorStorage: [String] = []
    var beforePresentNumberStore: [String] = []
    var userIsInTheAfterTabEqualButton = false
    var userIsInTheMiddleOfTyping = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultLabels()
        settingNumberFormaatter()
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        
        if presentValue.contains(".") && buttonTitle == "." {
            return
        }
        
        addOperator(to: buttonTitle)
        
        isTabAnswerButton()
        
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        
        addOperatorStorage(buttonTitle)
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
        
        if ["⁺⁄₋"].contains(buttonTitle) && presentValue != "0" {
            didTapSignButton()
        }
    }
    
    private func makeStackLabel() {
        guard let numberLabelValue = numberLabel.text else {
            return
        }
        
        let stackView = UIStackView()
        let stackNumberLabel = UILabel()
        let stackOperatorLabel = UILabel()
        let bottomOffSetY = previousValues.contentSize.height - previousValues.bounds.height + numberLabel.font.lineHeight
        let bottomOffset = CGPoint(x: 0, y: bottomOffSetY)
        
        previousValues.setContentOffset(bottomOffset, animated: false)
        
        stackNumberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackNumberLabel.textColor = .white
        stackOperatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackOperatorLabel.textColor = .white
        
        if userIsInTheMiddleOfTyping {
            stackNumberLabel.text = numberLabelValue
        }
        
        if userIsInTheMiddleOfTyping == false {
            stackNumberLabel.text = numberLabelValue
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
        let bottomOffSetY = previousValues.contentSize.height - previousValues.bounds.height + numberLabel.font.lineHeight
        let bottomOffset = CGPoint(x: 0, y: bottomOffSetY)
        
        previousValues.setContentOffset(bottomOffset, animated: false)
        
        stackNumberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackNumberLabel.textColor = .white
        stackOperatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackOperatorLabel.textColor = .white
        
        stackNumberLabel.text = presentValue
        stackOperatorLabel.text = "\(presentOperator) "
        
        stackView.addArrangedSubview(stackOperatorLabel)
        stackView.addArrangedSubview(stackNumberLabel)
        valuesStackView.addArrangedSubview(stackView)
    }
    
    private func defaultLabels() {
        numberLabel.text = "0"
        operatorLabel.text = ""
        firstNumberLable.removeFromSuperview()
        secondNumberLable.removeFromSuperview()
        firstOperatorLabel.removeFromSuperview()
        secondOperatorLabel.removeFromSuperview()
    }
    
    private func settingNumberFormaatter() {
        numberFormatter.roundingMode = .floor
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 3
    }
    
    private func didTapAnswerButton() {
        guard let previousValue = beforePresentNumberStore.last else {
            return
        }
        
        if userIsInTheAfterTabEqualButton {
            caculatorAfterResult(to: previousValue)
        }
        
        if userIsInTheAfterTabEqualButton == false {
            calculatorResult()
        }
        presentValue = ""
    }
    
    private func didTapACButton() {
        presentValue = ""
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
        presentValue = ""
        numberLabel.text = "0"
    }
    
    private func didTapSignButton() {
        if presentValue.contains("-") {
            filterHyphen()
        }
        
        if presentValue.contains("-") == false {
            presentValue = "-" + presentValue
        }
        
        numberLabel.text = "\(presentValue)"
    }
    
    private func caculatorAfterResult(to value: String) {
        inputValue = "\(presentValue) \( presentOperator ) \(value)"
        
        if !value.isEmpty && !inputValue.isEmpty {
            var parse = ExpressionParser.parse(from: (inputValue))
            let result = try! parse.result()
            
            guard let trimmedResult = numberFormatter.string(from: result as NSNumber) else {
                return
            }
            numberLabel.text = trimmedResult
            makeResultLabel()
        }
    }
    
    private func calculatorResult() {
        inputValue += presentValue
        
        if !presentValue.isEmpty && !inputValue.isEmpty {
            var parse = ExpressionParser.parse(from: (inputValue))
            let result = try! parse.result()
            
            guard let trimmedResult = numberFormatter.string(from: result as NSNumber) else {
                return
            }
            numberLabel.text = trimmedResult
            makeResultLabel()
            userIsInTheAfterTabEqualButton = true
        }
    }
    
    private func filterHyphen() {
        presentValue = presentValue.filter { word in
            if word == "-" {
                return false
            }
            return true
        }
    }
    
    private func addOperator(to buttonTitle: String) {
        if userIsInTheMiddleOfTyping {
            inputValue += presentValue
            inputValue += " \(operatorStorage.removeLast()) "
            
            presentValue = ""
            operatorStorage = []
            
            presentValue += buttonTitle
            numberLabel.text = buttonTitle
            return
        }
        presentValue += buttonTitle
        numberLabel.text = presentValue
    }
    
    private func isTabAnswerButton() {
        if userIsInTheAfterTabEqualButton {
            userIsInTheAfterTabEqualButton = true
            return
        }
        beforePresentNumberStore.append(presentValue)
    }
    
    private func addOperatorStorage(_ buttonTitle: String) {
        if userIsInTheMiddleOfTyping {
            presentOperator = buttonTitle
            operatorLabel.text = buttonTitle
            
            operatorStorage.append(" \(buttonTitle) ")
            numberLabel.text = "0"
            return
        }
        makeStackLabel()
        
        presentOperator = buttonTitle
        operatorLabel.text = buttonTitle
        
        operatorStorage.append(" \(buttonTitle) ")
        numberLabel.text = "0"
        userIsInTheMiddleOfTyping = true
        userIsInTheAfterTabEqualButton = false
    }
}

