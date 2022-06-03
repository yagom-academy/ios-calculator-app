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
        
        if presentNumbers.contains(".") && buttonTitle == "." {
            return
        }
        updateNumberLabel(to: buttonTitle)
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        
        presentOperator = buttonTitle
        operatorLabel.text = buttonTitle
        
        operatorStorage.append(" \(buttonTitle) ")
        makePreviousLabels()
        numberLabel.text = "0"
    }
    
    @IBAction func touchResultButton(_ sender: UIButton) {
        didTapAnswerButton()
    }
    
    @IBAction func touchOptionButton(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        
        if buttonTitle == OptionButton.allClear.rawValue  {
            didTapAllClearButton()
        }
        
        if buttonTitle == OptionButton.clearEntry.rawValue {
            didTapClearEentryButton()
        }
        
        if buttonTitle == OptionButton.changeSign.rawValue && presentNumbers != "0" {
            didTapSignButton()
        }
    }
    
    private func makePreviousLabels() {
        let stackView = UIStackView()
        let stackNumberLabel = UILabel()
        let stackOperatorLabel = UILabel()
        let bottomOffsetY = previousValues.contentSize.height - previousValues.bounds.height + numberLabel.font.lineHeight
        let bottomOffset = CGPoint(x: 0, y: bottomOffsetY)
        
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
            
            guard let NSNresult = numberFormatter.string(from: result as NSNumber) else {
                return
            }
            numberLabel.text = NSNresult
            
        }
        inputValue = ""
        presentNumbers = ""
    }
    
    private func didTapAllClearButton() {
        presentNumbers = ""
        inputValue = ""
        numberLabel.text = "0"
        operatorLabel.text = ""
        
        valuesStackView.subviews.forEach { views in
            views.removeFromSuperview()
        }
    }
    
    private func didTapClearEentryButton() {
        presentNumbers = ""
        numberLabel.text = "0"
    }
    
    private func didTapSignButton() {
        checkNumberSign()
        numberLabel.text = "\(presentNumbers)"
    }
    
    private func updateNumberLabel(to buttonTitle: String) {
        if operatorStorage.isEmpty {
            presentNumbers += buttonTitle
            numberLabel.text = presentNumbers
            return
        }
        operatorChoice += operatorStorage.removeLast()
        inputValue += presentNumbers
        inputValue += " \(operatorChoice) "
        
        presentNumbers = ""
        operatorChoice = ""
        operatorStorage = []
        
        presentNumbers += buttonTitle
        numberLabel.text = buttonTitle
    }
    
    private func checkNumberSign() {
        if presentNumbers.contains("-") {
            filterNumberSign()
            return
        }
        presentNumbers = "-" + presentNumbers
    }
    
    private func filterNumberSign() {
        presentNumbers = presentNumbers.filter { word in
            if word == "-" {
                return false
            }
            return true
        }
    }
}

