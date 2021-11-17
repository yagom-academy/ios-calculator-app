//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
    }
    
    @IBOutlet weak var operandLabel: UILabel?
    @IBOutlet weak var operatorLabel: UILabel?
    
    var textInput = ""
    var operandText = "0"
    var operatorText = ""
    
    func setLabel() {
        operandLabel?.text = operandText
        operatorLabel?.text = operatorText
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if operandText == "0" {
            operandText = sender.currentTitle ?? "0"
        } else {
            operandText += sender.currentTitle ?? "0"
        }
        
        operandLabel?.text = operandText
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        if operandText == "0" {
            operandText = "0"
        } else {
            operandText += sender.currentTitle ?? "0"
        }
        
        operandLabel?.text = operandText
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        operandText += sender.currentTitle ?? "0"
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        textInput += operandText
        operatorText = sender.currentTitle ?? "0"
        textInput += operatorText
        operatorLabel?.text = operatorText
        operandText = "0"
        operandLabel?.text = "0"
    }
    
    @IBAction func touchUpPlusMinusButton(_ sender: UIButton) {
        if operandText.hasPrefix("−") {
            operandText.removeFirst()
        } else {
            operandText = "−" + operandText
        }
        
        operandLabel?.text = operandText
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        textInput = ""
        operandText = "0"
        operatorText = ""
        operatorLabel?.text = operatorText
        operandLabel?.text = operandText
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        operandText = "0"
        operandLabel?.text = operandText
    }
    
}


