//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var operandLabel: UILabel?
    @IBOutlet weak var operatorLabel: UILabel?
    
    var textInput = ""
    var operandText = ""
    var operatorText = ""
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if operandLabel?.text == "0"  {
            operandText = sender.currentTitle ?? "0"
        } else {
            operandText += sender.currentTitle ?? "0"
        }
        
        operandLabel?.text = operandText
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        if operandLabel?.text == "0" {
            operandText = "0"
        } else {
            operandText += sender.currentTitle ?? "0"
        }
        
        operandLabel?.text = operandText
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if operandText.contains(".") {
            return
        } else {
            operandText += sender.currentTitle ?? "0"
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        textInput += operandText
        guard let lastWord = textInput.last else {
            return
        }
        if lastWord.isNumber {
        } else {
            textInput.removeLast()
        }
        operatorText = sender.currentTitle ?? "0"
        textInput += operatorText
        operatorLabel?.text = operatorText
        operandText = ""
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
        operandText = ""
        operatorText = ""
        operatorLabel?.text = ""
        operandLabel?.text = "0"
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        operandText = ""
        operandLabel?.text = "0"
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        textInput += operandLabel?.text ?? "0"
        var parserResult = ExpressionParser.parse(from: textInput)
        
        do {
            textInput = ""
            operatorText = ""
            operandText = String(try parserResult.result())
            operatorLabel?.text = operatorText
            operandLabel?.text = operandText
        } catch QueueError.emptyOperandItem {
            
        } catch QueueError.emptyOperatorItem {
            
        } catch {
            
        }
    }
}


