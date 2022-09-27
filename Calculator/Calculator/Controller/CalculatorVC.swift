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
        //resetAllUI()
    }
    
    private func resetAllUI() {
        mainStackView.subviews.forEach { $0.removeFromSuperview()
        }
        operatorLabel.text = ""
        operandLabel.text = ""
    }

    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        operandLabel.text?.append(sender.titleLabel?.text ?? "")
    }
    
    @IBAction func touchUpdotButton(_ sender: UIButton) {
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
        operandLabel.text = ""
    }
    
    @IBAction func touchUpConvertPlusMinusButton(_ sender: UIButton) {
        if operandLabel.text == "" {
            return
        } else if operatorLabel.text == "+" {
            operatorLabel.text = "−"
        } else {
            operatorLabel.text = "+"
        }
    }
    
}

