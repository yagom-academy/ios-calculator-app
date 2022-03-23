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
    
    var currentDisplayNumber: String = ""
    
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
        multiplyButton.value = "*"
        divideButton.value = "/"
    }
    
    @IBAction func numberClick(sender: NumberButton) {
        //.처리에 대해선 추후 고민
        currentDisplayNumber = currentDisplayNumber + (sender.value ?? "")
        setDisplayLabel()
    }
    
    func setDisplayLabel() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        currentNumberLabel.text = numberFormatter.string(for: currentDisplayNumber) ?? "0"
    }
}

