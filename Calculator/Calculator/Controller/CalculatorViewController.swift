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
        guard let operatorButtonsTextLabel = sender.titleLabel?.text else {
            return
        }
        inputOperatorsLabel(by: operatorButtonsTextLabel)
    }
    
    private func inputOperatorsLabel(by input: String) {
        operatorsLabel.text = input
    }
    
    @IBAction func tappedAllClearButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedClearElementButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedPositiveNegativeConversionButton(_ sender: UIButton) {
    }
}

