//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mathematicalExpressionStackView: UIStackView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func acButtonAction(_ sender: UIButton) {
        mathematicalExpressionStackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func ceButtonAction(_ sender: UIButton) {
        operandLabel.text = ""
        if operatorLabel.text == "" && !mathematicalExpressionStackView.subviews.isEmpty {
            operandLabel.text = ""
            mathematicalExpressionStackView.subviews.forEach { $0.removeFromSuperview() }
        }
    }
    
    @IBAction func switchSignButton(_ sender: UIButton) {
    }
    
    @IBAction func operatorsButtonAction(_ sender: Any) {
    }
    
    @IBAction func operandsButtonAction(_ sender: UIButton) {
        if mathematicalExpressionStackView.subviews.isEmpty {
            operandLabel.text = sender.currentTitle
        } else {
            operandLabel.text = (operandLabel.text ?? "") + (sender.currentTitle ?? "") 
        }
    }
    
    @IBAction func calculateButtonAction(_ sender: Any) {
    }
    
}

