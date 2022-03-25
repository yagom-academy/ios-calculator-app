//
//  CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    private var temporaryOperandText: String = ""

    @IBOutlet weak var numberSingleZeroButton: UIButton!
    @IBOutlet weak var numberDoubleZeroButton: UIButton!
    @IBOutlet weak var singleDotButton: UIButton!
    @IBOutlet weak var numberOneButton: UIButton!
    @IBOutlet weak var numberTwoButton: UIButton!
    @IBOutlet weak var numberThreeButton: UIButton!
    @IBOutlet weak var numberFourButton: UIButton!
    @IBOutlet weak var numberFiveButton: UIButton!
    @IBOutlet weak var numberSixButton: UIButton!
    @IBOutlet weak var numberSevenButton: UIButton!
    @IBOutlet weak var numberEightButton: UIButton!
    @IBOutlet weak var numberNineButton: UIButton!
    
    @IBOutlet weak var equalSignButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearElementButton: UIButton!
    @IBOutlet weak var positiveNegativeConversionButton: UIButton!
    
    @IBOutlet weak var operatorsLabel: UILabel!
    @IBOutlet weak var operandsLabel: UILabel!
    
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandsLabel.text = "0"
        operatorsLabel.text = ""
    }
    
    @IBAction func tappedOperandButtons(_ sender: UIButton) {
        guard let operandButtonsTitleText = sender.titleLabel?.text else {
            return
        }
        let currentOperandsLabel = operandsLabel.text
        
        guard isValidZeroOrDot(inputText: operandButtonsTitleText,
                               currentLabel: currentOperandsLabel) else {
            return
        }
        appendOperandAtTemporaryOperandText(by: operandButtonsTitleText)
        inputAtOperandsLabel(by: operandButtonsTitleText)
    }
    
    private func isValidZeroOrDot(inputText: String, currentLabel: String?) -> Bool {
        if inputText.contains("0") && currentLabel == "0" {
            return false
        }
        if inputText == "." && ((currentLabel?.contains(".")) == true) {
            return false
        }
        return true
    }
    
    private func appendOperandAtTemporaryOperandText(by inputOperand: String) {
        temporaryOperandText += "\(inputOperand)"
        print(temporaryOperandText)
    }
    
    private func inputAtOperandsLabel(by inputOperand: String) {
        guard var temporaryLabel = operandsLabel.text else { return }
        
        if temporaryLabel == "0" {
            temporaryLabel = ""
        }
        temporaryLabel += "\(inputOperand)"
        operandsLabel.text = temporaryLabel
    }
    
    @IBAction func tappedOperatorButtons(_ sender: UIButton) {
        guard let operatorButtonsTitleText = sender.titleLabel?.text else {
            return
        }
        let currentOperandsLabel = operandsLabel.text
        let currentOperatorsLabel = operatorsLabel.text
        
        guard isValidZero(currentOperandsLabel: currentOperandsLabel) else {
            return
        }
        guard isValidDuplicateOperators() else {
            return
        }
        addArrangedStackView(operatorText: currentOperatorsLabel, operandText: currentOperandsLabel)
        inputAtOperatorsLabel(by: operatorButtonsTitleText)
        appendOperatorAtTemporaryOperandText(by: operatorButtonsTitleText)
        operandsLabel.text = "0"
    }
    
    private func isValidZero(currentOperandsLabel: String?) -> Bool {
        if currentOperandsLabel == "0" {
            return false
        }
        return true
    }
    
    private func isValidDuplicateOperators() -> Bool {
        if temporaryOperandText.hasSuffix("+") ||
           temporaryOperandText.hasSuffix("-") ||
           temporaryOperandText.hasSuffix("×") ||
           temporaryOperandText.hasSuffix("÷") {
            return false
        }
        return true
    }
    
    private func inputAtOperatorsLabel(by inputOperator: String) {
        operatorsLabel.text = inputOperator
    }
    
    private func appendOperatorAtTemporaryOperandText(by inputOperator: String) {
        temporaryOperandText += "\(inputOperator)"
    }
    
    private func addArrangedStackView(operatorText: String?, operandText: String?) {
        guard let operatorText = operatorText, let operandText = operandText else {
            return
        }
        
        let scrollViewOperatorsLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            label.textAlignment = .right
            label.text = "\(operatorText)"
            return label
        }()
        
        let scrollViewOperandsLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            label.textAlignment = .right
            label.text = "\(operandText)"
            return label
        }()
        
        let stackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [scrollViewOperatorsLabel, scrollViewOperandsLabel])
            view.axis = .horizontal
            view.alignment = .fill
            view.spacing = 8
            view.distribution = .fill
            view.contentMode = .scaleToFill
            return view
        }()
        
        verticalStackView.addArrangedSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor).isActive = true
    }
    
    @IBAction func tappedAllClearButton(_ sender: UIButton) {
        temporaryOperandText = ""
        operatorsLabel.text = ""
        operandsLabel.text = "0"
    }
    
    @IBAction func tappedClearElementButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedPositiveNegativeConversionButton(_ sender: UIButton) {
    }
}

