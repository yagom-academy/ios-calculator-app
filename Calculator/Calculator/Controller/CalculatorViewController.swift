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
    
    var calculatorModel = CalculatorModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultLabels()
        calculatorModel.settingNumberFormaatter()
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        let operand: String = calculatorModel.addOperand(to: buttonTitle)
        numberLabel.text = operand
        calculatorModel.isTabAnswerButton()
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        let operatorSign = calculatorModel.addOperatorStorage(to: buttonTitle)
        operatorLabel.text = operatorSign
        makeStackLabel(test: operatorSign)
        numberLabel.text = "0"
    }
    
    @IBAction func touchResultButton(_ sender: UIButton) {
        guard calculatorModel.presentValue.isEmpty == false else {
            return
        }
        let result = calculatorModel.didTapAnswerButton()
        
        numberLabel.text = result
        makeResultLabel()
        calculatorModel.userIsInTheMiddleOfTyping = false
        calculatorModel.userIsInTheAfterTabAnswerButton = true
        operatorLabel.text = ""
        calculatorModel.presentValue = ""
    }
    
    @IBAction func touchOptionButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
    
        switch buttonTitle {
        case "AC":
            numberLabel.text = "0"
            operatorLabel.text = ""

            valuesStackView.subviews.forEach { views in
                views.removeFromSuperview()
            }
            return calculatorModel.didTapAllClearButton()
        case "CE":
            numberLabel.text = "0"
            operatorLabel.text = ""
            return calculatorModel.didTapClearEntryButton()
        case "⁺⁄₋":
            guard calculatorModel.presentValue != "0" else {
                return
            }
            return didTapSignButton()
        default:
            return
        }
    }
    
    func didTapSignButton() {
        if calculatorModel.userIsInTheAfterTabAnswerButton {
            let checkHypen = calculatorModel.checkHyphen(to: calculatorModel.resultValue)
            numberLabel.text = "\(checkHypen)"
            calculatorModel.resultValue = checkHypen
            return
        }
        let checkHypen = calculatorModel.checkHyphen(to: calculatorModel.presentValue)
        numberLabel.text = "\(checkHypen)"
        calculatorModel.presentValue = checkHypen
    }
    
    private func defaultLabels() {
        numberLabel.text = "0"
        operatorLabel.text = ""
        firstNumberLable.removeFromSuperview()
        secondNumberLable.removeFromSuperview()
        firstOperatorLabel.removeFromSuperview()
        secondOperatorLabel.removeFromSuperview()
    }
    
    private func makeStackLabel(test: String) {
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
        
        isCheckMakeStackLabel(test: test, to: numberLabelValue, from: stackNumberLabel, from: stackOperatorLabel)
        
        stackView.addArrangedSubview(stackOperatorLabel)
        stackView.addArrangedSubview(stackNumberLabel)
        valuesStackView.addArrangedSubview(stackView)
    }
    
    private func isCheckMakeStackLabel(test: String, to numberLabelValue: String, from stackNumberLabel: UILabel, from stackOperatorLabel: UILabel) {
        
        if calculatorModel.userIsInTheMiddleOfTyping {
            stackNumberLabel.text = numberLabelValue
            stackOperatorLabel.text = " \(calculatorModel.presentOperator) "
            return
        }
        stackNumberLabel.text = numberLabelValue
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

        stackNumberLabel.text = calculatorModel.presentValue
        stackOperatorLabel.text = "\(calculatorModel.presentOperator) "

        stackView.addArrangedSubview(stackOperatorLabel)
        stackView.addArrangedSubview(stackNumberLabel)
        valuesStackView.addArrangedSubview(stackView)
    }
}
