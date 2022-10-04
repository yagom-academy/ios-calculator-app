//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func numberButtonPressed(_ sender: UIButton) {
        guard let senderLabel = sender.titleLabel,
              let senderText = senderLabel.text
        else { return }
        updateOperandLabel(with: senderText)
    }
    
    @IBAction private func numberDoubleZeroButtonPressed(_ sender: UIButton) {
        if operandLabel.isZero {
            return
        }
        
        updateOperandLabel(with: "00")
    }
    
    private func updateOperandLabel(with number: String) {
        
        if operandLabel.isZero {
            operandLabel.text = number
        } else {
            if let operandText = operandLabel.text {
                operandLabel.text = operandText + number
            }
        }
    }
    
    private func addSubviewToStackView() {
        guard let operandText = operandLabel.text,
              let operatorText = operatorLabel.text else { return }
        
        let textLabel = UILabel()
        textLabel.text = operatorText + " " + operandText
        textLabel.textColor = .white
        textLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        stackView.addArrangedSubview(textLabel)
    }
    
    private func updateOperatorLabel(with `operator`: String) {
        operatorLabel.text = `operator`
    }
}

