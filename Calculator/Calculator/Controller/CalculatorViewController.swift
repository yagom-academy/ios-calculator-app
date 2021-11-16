//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var calculationHistoryStackView: UIStackView!
    @IBOutlet weak var calculationHistoryScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    @IBAction func touchUpNumberPadButton(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else {
            return
        }
        
        guard let tapedNumber = sender.titleLabel?.text else {
            return
        }
        
        if operandLabelText == "0" {
            if tapedNumber == "0" || tapedNumber == "00" {
                return
            } else {
                operandLabel.text = tapedNumber
                return
            }
        }
        
        operandLabel.text = operandLabelText + tapedNumber
    }
    @IBAction func touchUpAllClear(_ sender: UIButton) {
        reset()
    }
    
    func reset() {
        operandLabel.text = "0"
        operatorLabel.text = ""
        allClear()
    }
    
    func addFormula() {
        let stackView = UIStackView()
        
        if let `operator` = operatorLabel.text {
            let insultingoperatingLable = UILabel()
            insultingoperatingLable.textColor = UIColor.white
            insultingoperatingLable.text = `operator`
            
            stackView.addArrangedSubview(insultingoperatingLable)
        }
        
        guard let operand = operandLabel.text else {
            return
        }
        
        let insultinOperandLabel = UILabel()
        insultinOperandLabel.textColor = UIColor.white
        insultinOperandLabel.text = operand
        
        
        stackView.addArrangedSubview(insultinOperandLabel)
        
        calculationHistoryStackView.addArrangedSubview(stackView)
    }
    
    func allClear() {
        for subview in calculationHistoryStackView.subviews {
            subview.removeFromSuperview()
        }
    }
    
    func clearEntry() {
        operandLabel.text = "0"
    }
    
    
}

