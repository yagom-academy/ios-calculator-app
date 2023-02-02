//
//  Calculator - ViewController.swift
//  Created by kokkilE on 2023/01/25.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var expression: String = ""
    var constraintsOfLabelView: [NSLayoutConstraint]?
    @IBOutlet weak var scrollView: UIStackView!
    @IBOutlet weak var operatorUILabel: UILabel!
    @IBOutlet weak var operandUILabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpCalculatorButton(sender: UIButton) {
        guard let inputFromButton = sender.titleLabel?.text else {
            return
        }
        
        processInput(from: inputFromButton)
    }
    
    func processInput(from inputFromButton: String) {
        switch inputFromButton {
        case "AC":
            return
        case "CE":
            return
        case "⁺⁄₋":
            return
        case "+", "−", "÷", "×":
            return
        case "=":
            return
        case "0", "00":
            return
        case ".":
            processDotInput(inputFromButton)
        default:
            processNumberInput(inputFromButton)
        }
    }
    
    func processDotInput(_ inputFromButton: String) {
        guard operandUILabel.text?.contains(".") == false,
              let prevOperandUILabel = operandUILabel.text else { return }
        
        operandUILabel.text = prevOperandUILabel + inputFromButton
    }
    
    func processNumberInput(_ inputFromButton: String){
        guard let prevOperandUILabel = operandUILabel.text else { return }
        
        if operandUILabel.text == "0" {
            operandUILabel.text = inputFromButton == "0" || inputFromButton == "00" ? "0" : inputFromButton
            return
        }
        
        if !prevOperandUILabel.contains(".") {
            operandUILabel.text = formattingNumber(for: prevOperandUILabel + inputFromButton)
        } else {
            operandUILabel.text = formattingNumber(for: prevOperandUILabel + inputFromButton)
        }
    }
    
    func formattingNumber(for input: String) -> String {
        let formatter = NumberFormatter()
        
        let removedComma = input.components(separatedBy: ",").joined()
        
        guard let inputToNSNumber = formatter.number(from: removedComma) else {
            return input
        }
        
        formatter.maximumFractionDigits = 20
        formatter.roundingMode = .ceiling
        formatter.numberStyle = .decimal
        
        guard let formattingResult = formatter.string(for: inputToNSNumber) else { return input }
        
        return formattingResult
    }
}

