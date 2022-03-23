//
//  Calculator - ViewController.swift
//  Created by 우롱차.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var numberZeroButton: NumberButton!
    @IBOutlet weak var numberDoubleZeroButton: NumberButton!
    @IBOutlet weak var numberDotButton: NumberButton!
    @IBOutlet weak var numberOneButton: NumberButton!
    @IBOutlet weak var numberTwoButton: NumberButton!
    @IBOutlet weak var numberThreeButton: NumberButton!
    @IBOutlet weak var numberFourButton: NumberButton!
    @IBOutlet weak var numberFiveButton: NumberButton!
    @IBOutlet weak var numberSixButton: NumberButton!
    @IBOutlet weak var numberSevenButton: NumberButton!
    @IBOutlet weak var numberEightButton: NumberButton!
    @IBOutlet weak var numberNineButton: NumberButton!
    
    @IBOutlet weak var addButton: OperandButton!
    @IBOutlet weak var subtractButton: OperandButton!
    @IBOutlet weak var multiplyButton: OperandButton!
    @IBOutlet weak var divideButton: OperandButton!
    
    @IBOutlet weak var currentNumberLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!

    @IBOutlet weak var processStackView: UIStackView!
    
    var currentDisplayNumber: String = ""
    var totalCalculate = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalizeButtonValue()
        // Do any additional setup after loading the view.
    }
    
    func initalizeButtonValue() {
        numberZeroButton.value = "0"
        numberDoubleZeroButton.value = "00"
        numberDotButton.value = "."
        numberOneButton.value = "1"
        numberTwoButton.value = "2"
        numberThreeButton.value = "3"
        numberFourButton.value = "4"
        numberFiveButton.value = "5"
        numberSixButton.value = "6"
        numberSevenButton.value = "7"
        numberEightButton.value = "8"
        numberNineButton.value = "9"

        addButton.value = "+"
        subtractButton.value = "-"
        multiplyButton.value = "×"
        divideButton.value = "÷"
    }
    
    @IBAction func numberClick(sender: NumberButton) {
        //.처리에 대해선 추후 고민
        currentDisplayNumber = currentDisplayNumber + (sender.value ?? "")
        setDisplayNumberLabel()
    }
    
    func setDisplayNumberLabel() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        //너무 자리수가 길어지면 0으로 표현되는 버그 있음
        let displayNSNumber = NSNumber(value: Double(currentDisplayNumber) ?? 0)
        currentNumberLabel.text = numberFormatter.string(from: displayNSNumber)
    }
    
    
    @IBAction func operandClick(sender: OperandButton) {
        let operand = sender.value ?? ""
        addStackView()
        setDisplayOperandLabel(operand: operand)
    }
    
    func setDisplayOperandLabel(operand: String) {
        currentOperandLabel.text = operand
    }
    
    func addStackView() {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .horizontal
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        let numberLabel = UILabel()
        numberLabel.textColor = .white
        numberLabel.text = currentDisplayNumber
        currentDisplayNumber = ""
        setDisplayNumberLabel()
        let operandLabel = UILabel()
        operandLabel.textColor = .white
        operandLabel.text = currentOperandLabel.text ?? ""
        verticalStackView.addArrangedSubview(operandLabel)
        verticalStackView.addArrangedSubview(numberLabel)
        processStackView.addArrangedSubview(verticalStackView)
    }
}

