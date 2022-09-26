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
        operandLabel.text = ""
    }

    @IBAction func numberButtonTouchUp(_ sender: UIButton) {
        operandLabel.text?.append(sender.titleLabel?.text ?? "")
    }
    
    @IBAction func acButtonTouchUp(_ sender: UIButton) {
        resetAllUI()
    }
    
    @IBAction func ceButtonTouchUp(_ sender: UIButton) {
        operatorLabel.text = ""
        operandLabel.text = ""
    }
    
    @IBAction func convertPlusMinusButtonTouchUp(_ sender: UIButton) {
        if operandLabel.text == "" {
            return
        } else if operatorLabel.text == "+" {
            operatorLabel.text = "−"
        } else {
            operatorLabel.text = "+"
        }
    }
    
}

