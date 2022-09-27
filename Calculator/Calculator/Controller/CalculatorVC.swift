//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorVC: UIViewController {
    
    var currentNumber: String = ""
    
    @IBOutlet private weak var calculationFormulaScroll: UIScrollView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAllUI()
    }
    
    private func resetAllUI() {
        mainStackView.subviews.forEach { $0.removeFromSuperview()
        }
        operatorLabel.text = ""
        operandLabel.text = "0"
        currentNumber = ""
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if operandLabel.text?.first == "0" {
            operandLabel.text?.removeFirst()
        }
        currentNumber.append(sender.titleLabel?.text ?? "")
        operandLabel.text = currentNumber
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if currentNumber.contains(".") {
            return
        } else {
            currentNumber.append(sender.titleLabel?.text ?? "")
        }
        operandLabel.text = currentNumber
    }
    
    @IBAction func touchUpAcButton(_ sender: UIButton) {
        resetAllUI()
    }
    
    @IBAction func touchUpCeButton(_ sender: UIButton) {
        currentNumber = ""
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpConvertPlusMinusButton(_ sender: UIButton) {
        if operandLabel.text == "0" {
            return
        } else if currentNumber.first == "-" {
            currentNumber.remove(at: currentNumber.startIndex)
        } else {
            currentNumber = "-\(currentNumber)"
        }
        operandLabel.text = currentNumber
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        if operandLabel.text == "0" {
            return
        } else {
            operatorLabel.text = sender.titleLabel?.text
            //makeFormulaStackView()
            operandLabel.text = "0"
        }
    }
    
    
    
}
