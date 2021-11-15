//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputedOperatorLabel: UILabel!
    @IBOutlet weak var inputedOperandLabel: UILabel!
    @IBOutlet weak var toBeCalculateFormulaStackView: UIStackView!
    
    @IBOutlet weak var inputDotButton: UIButton!
    @IBOutlet weak var inputZeroZeroButton: UIButton!
    @IBOutlet weak var inputZeroButton: UIButton!
    @IBOutlet weak var inputOneButton: UIButton!
    @IBOutlet weak var inputTwoButton: UIButton!
    @IBOutlet weak var inputThreeButton: UIButton!
    @IBOutlet weak var inputFourButton: UIButton!
    @IBOutlet weak var inputFiveButton: UIButton!
    @IBOutlet weak var inputSixButton: UIButton!
    @IBOutlet weak var inputSevenButton: UIButton!
    @IBOutlet weak var inputEightButton: UIButton!
    @IBOutlet weak var inputNineButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var cleanEntry: UIButton!
    @IBOutlet weak var convertPositiveOrNegativeNumber: UIButton!
    
    var fomula: String = ""
    var operand: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputedOperandLabel.text = ""
    }
    
    @IBAction private func numberDidTap(_ sender: UIButton) {
        operand += operands(for: sender)
        inputedOperandLabel.text = operand
    }
    
    private func operands(for button: UIButton) -> String {
        switch button {
        case inputDotButton:
            return "."
        case inputZeroButton:
            return "0"
        case inputZeroZeroButton:
            return "00"
        case inputOneButton:
            return "1"
        case inputTwoButton:
            return "2"
        case inputThreeButton:
            return "3"
        case inputFourButton:
            return "4"
        case inputFiveButton:
            return "5"
        case inputSixButton:
            return "6"
        case inputSevenButton:
            return "7"
        case inputEightButton:
            return "8"
        case inputNineButton:
            return "9"
        default:
            return ""
        }
    }
}

