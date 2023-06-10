//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var userTyping = false
    private var formula = ""
    private let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var displayOperandLabel: UILabel!
    @IBOutlet weak var displayOperatorLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        
        if userTyping {
            let currentText = displayOperandLabel.text!
            displayOperandLabel.text = currentText + digit
        } else {
            displayOperandLabel.text = digit
        }
        
        userTyping = true
    }
    
    @IBAction func touchOperator(_ sender: UIButton) {
        guard let inputOperator = sender.currentTitle else { return }
        
        displayOperatorLabel.text = "\(inputOperator)"
    }
    
    @IBAction func touchCalculate(_ sender: UIButton) {
        
    }
    
    @IBAction func touchMenu(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "AC":
            clearOperandLabel()
            clearOperatorLabel()
        case "CE":
            clearOperandLabel()
            print("clearEntry")
        case "⁺⁄₋":
            print("chageSign")
        case ".":
            print(".")
        case "00":
            print("00")
        default:
            break
        }
    }
    
    private func addFormula() {
        
    }
    
    private func addToStackView(_ operationSign: String, _ operands: String) {
        let label = UILabel()
        label.text = "\(operationSign) \(operands)"
        
        stackView.addArrangedSubview(label)
    }

    private func clearOperandLabel() {
        displayOperandLabel.text = "0"
    }
    
    private func clearOperatorLabel() {
        displayOperatorLabel.text?.removeAll()
    }
    
    private func clearStackView() {
        stackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func changeSign() {
        ㅇ
    }
}
