//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var isCalculated: Bool {
        operandLabel.text != "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFormulaLabel()
    }
    
    private func setUpFormulaLabel() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        guard let currentOperandButtonText = sender.titleLabel?.text else {
            return
        }
        guard operandLabel.text! != "0" || currentOperandButtonText != "00" else {
            return
        }
        guard isCalculated else {
            operandLabel.text! = currentOperandButtonText
            return
        }
        operandLabel.text! += currentOperandButtonText
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard isCalculated else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        guard isCalculated || operatorLabel.text != "" else {
            return
        }
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        let hasDotNotIncluded = operandLabel.text?.contains(".") == false
        guard hasDotNotIncluded else {
            return
        }
        guard let currentOperandButtonText = sender.titleLabel?.text else {
            return
        }
        operandLabel.text! += currentOperandButtonText
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        guard isCalculated else {
            return
        }
        let hasMinusNotIncluded = operandLabel.text!.contains("-") == false
        guard hasMinusNotIncluded else {
            operandLabel.text!.remove(at: operandLabel.text!.startIndex)
            return
        }
        operandLabel.text = "-" + operandLabel.text!
    }
}

