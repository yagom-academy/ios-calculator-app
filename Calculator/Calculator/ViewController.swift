//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class OperandButton: UIButton {
    var value: String?
}

class OperatorButton: UIButton {
    var value: String?
}

class FunctionalButton: UIButton {
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpOperandValue()
        setUpOpertorValue()
    }
    
    @IBOutlet var OperandButtons: [OperandButton]!
    
    @IBOutlet weak var OperandZeroButton: OperandButton!
    @IBOutlet weak var OperandCoupleZeroButton: OperandButton!
    @IBOutlet weak var OperandOneButton: OperandButton!
    @IBOutlet weak var OperandTwoButton: OperandButton!
    @IBOutlet weak var OperandThreeButton: OperandButton!
    @IBOutlet weak var OperandFourButton: OperandButton!
    @IBOutlet weak var OperandFiveButton: OperandButton!
    @IBOutlet weak var OperandSixButton: OperandButton!
    @IBOutlet weak var OperandSevenButton: OperandButton!
    @IBOutlet weak var OperandEightButton: OperandButton!
    @IBOutlet weak var OperandNineButton: OperandButton!
    @IBOutlet weak var OperandDotButton: OperandButton!
    
    
    
    @IBOutlet var OperatorButtons: [OperatorButton]!
    
    @IBOutlet weak var OperatorAddButton: OperatorButton!
    @IBOutlet weak var OperatorSubtractButton: OperatorButton!
    @IBOutlet weak var OperatorMultiplyButton: OperatorButton!
    @IBOutlet weak var OperatorDivideButton: OperatorButton!
    
    
    @IBOutlet weak var FuncAllClearButton: FunctionalButton!
    @IBOutlet weak var FuncClearEntryButton: FunctionalButton!
    @IBOutlet weak var FuncChangeSignButton: FunctionalButton!
    @IBOutlet weak var FuncExecuteButton: FunctionalButton!
    
    func setUpOperandValue() {
        OperandZeroButton.value = "0"
        OperandCoupleZeroButton.value = "00"
        OperandOneButton.value = "1"
        OperandTwoButton.value = "2"
        OperandThreeButton.value = "3"
        OperandFourButton.value = "4"
        OperandFiveButton.value = "5"
        OperandSixButton.value = "6"
        OperandSevenButton.value = "7"
        OperandEightButton.value = "8"
        OperandNineButton.value = "9"
        OperandDotButton.value = "."
    }
    
    func setUpOpertorValue() {
        OperatorAddButton.value = "+"
        OperatorSubtractButton.value = "-"
        OperatorMultiplyButton.value = "×"
        OperatorDivideButton.value = "÷"
    }

    @IBAction func OperandButtonAction(_ sender: OperandButton) {
        guard let input = sender.value else { return }
        print(input)
    }
    
    @IBAction func OperatorButtonAction(_ sender: OperatorButton) {
        guard let input = sender.value else { return }
        print(input)
    }
    
    
    @IBAction func FunctionalButtonAction(_ sender: FunctionalButton) {
        
        switch sender {
        case FuncAllClearButton:
            print("AC")
        case FuncClearEntryButton:
            print("CE")
        case FuncChangeSignButton:
            print("+/-")
        case FuncExecuteButton:
            print("=")
        default:
            return
        }
        
    }
    
}

