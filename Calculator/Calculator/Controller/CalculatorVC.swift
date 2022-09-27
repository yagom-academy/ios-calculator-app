//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorVC: UIViewController {

    var calculateFormula: String = ""
    
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
    }

    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if operandLabel.text?.first == "0" {
            operandLabel.text?.removeFirst()
        }
        operandLabel.text?.append(sender.titleLabel?.text ?? "")
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if (operandLabel.text?.contains(".") ?? false) {
            return
        } else {
            operandLabel.text?.append(sender.titleLabel?.text ?? "")
        }
    }
    
    @IBAction func touchUpAcButton(_ sender: UIButton) {
        resetAllUI()
    }
    
    @IBAction func touchUpCeButton(_ sender: UIButton) {
        operatorLabel.text = ""
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpConvertPlusMinusButton(_ sender: UIButton) {
        if operandLabel.text == "0" {
            return
        } else if operatorLabel.text == "+" {
            operatorLabel.text = "−"
        } else {
            operatorLabel.text = "+"
        }
    }
    
}

