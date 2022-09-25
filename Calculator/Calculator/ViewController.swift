//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var expression: String = ""
    
    @IBOutlet weak var operand: UILabel!
    @IBOutlet weak var `operator`: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberZeroButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: "0")
    }
    
    @IBAction func numberDoubleZeroButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: "00")
    }
    
    @IBAction func decimalPointButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: ".")
    }
    
    @IBAction func numberOnePressed(_ sender: UIButton) {
        updateOperandNumber(with: "1")
    }
    
    @IBAction func numberTwoButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: "2")
    }
    
    @IBAction func numberThreeButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: "3")
    }
    
    @IBAction func numberFourButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: "4")
    }
    
    @IBAction func numberFiveButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: "5")
    }
    
    @IBAction func numberSixButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: "6")
    }
    
    @IBAction func numberSevenButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: "7")
    }
    
    @IBAction func numberEightButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: "8")
    }
    
    @IBAction func numberNineButtonPressed(_ sender: UIButton) {
        updateOperandNumber(with: "9")
    }
    
    func updateOperandNumber(with number: String) {
        if operand.text == "0" {
            operand.text = number
        } else {
            if let operandText = operand.text {
                operand.text = operandText + number
            }
        }
    }
}

