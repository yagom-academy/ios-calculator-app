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
            mathematicalExpressionStackView.subviews.forEach { $0.removeFromSuperview() }
        }
    }
    
    @IBAction func switchSignButton(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else {
            return
        }
        guard let operand = Int(operandLabelText) else {
            return
        }
        guard operand != 0 else {
            return
        }
        operandLabel.text = String(-Int(operand))
        
    }
    
    @IBAction func operatorsButtonAction(_ sender: UIButton) {
        guard !mathematicalExpressionStackView.subviews.isEmpty || operandLabel.text != "0" else {
            return
        }
        
        let operatorOfSignLabel: UILabel = {
            let label = UILabel()
            label.text = operandLabel.text
            label.font = UIFont.systemFont(ofSize: 25)
            label.textColor = .white
            return label
        }()
        
        let operandOfSignLabel: UILabel = {
            let label = UILabel()
            label.text = operatorLabel.text
            label.font = UIFont.systemFont(ofSize: 25)
            label.textColor = .white
            return label
        }()
        
        let signStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [operandOfSignLabel, operatorOfSignLabel])
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = 8
            return stackView
        }()
        
        mathematicalExpressionStackView.addArrangedSubview(signStackView)
        
        operatorLabel.text = sender.currentTitle
        operandLabel.text = "0"
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

