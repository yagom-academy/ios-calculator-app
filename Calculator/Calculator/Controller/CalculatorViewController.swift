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
    
    @IBOutlet weak var horizontalStackView: UIStackView!
    
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
    
    private func inputAtOperandsLabel(by inputText: String) {
        temporaryOperandText += inputText
        operandsLabel.text = temporaryOperandText
    }
    
    @IBAction func tappedOperatorButtons(_ sender: UIButton) {
        guard let operatorButtonsTitleText = sender.titleLabel?.text else {
            return
        }
        let currentOperandsLabel = operandsLabel.text
        
        guard isValidZeroInOperandsLabel(currentOperandsLabel: currentOperandsLabel) else {
            return
        }
        
        let currentOperatorslabel = operatorsLabel.text
        
        addArrangedStackView(operators: currentOperatorslabel, operands: currentOperandsLabel)
        inputOperatorsLabel(by: operatorButtonsTitleText)
    }
    
    private func isValidZeroInOperandsLabel(currentOperandsLabel: String?) -> Bool {
        if currentOperandsLabel == "0" {
            return false
        }
        return true
    }
    
    private func inputOperatorsLabel(by inputText: String) {
        operatorsLabel.text = inputText
    }
    
    func addArrangedStackView(operators: String?, operands: String?) {
        guard let operators = operators, let operands = operands else {
            return
        }
        
        let scrollViewOperatorsLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            label.textAlignment = .right
            label.text = "\(operators)"
            return label
        }()
        
        let scrollViewOperandsLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            label.textAlignment = .right
            label.text = "\(operands)"
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
        
        horizontalStackView.addArrangedSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor).isActive = true
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

