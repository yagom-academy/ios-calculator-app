//
//  ViewController.swift
//  Created by Wonbi
//

import UIKit

class ViewController: UIViewController {
    private var currentOperand: String = "0"
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func tapOperandButton(_ sender: UIButton) {
        guard let tappedOperand = sender.currentTitle else { return }
        
        switch tappedOperand {
        case "⁺⁄₋":
            handleSignButton()
        case ".":
            handleDotButton()
        case "0", "00":
            handleZeroButtons(from: tappedOperand)
        default:
            appendOperands(from: tappedOperand)
        }
        operandLabel.text = currentOperand
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
    }
    
    @IBAction func tapEqualsButton(_ sender: UIButton) {
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
    }

    @IBAction func tapACButton(_ sender: UIButton) {
    }
}

// handling Operands
extension ViewController {
    private func handleSignButton() {
        if currentOperand.first == "-" {
            currentOperand.removeFirst()
        } else {
            currentOperand = "-" + currentOperand
        }
    }
    
    private func handleDotButton() {
        if currentOperand.contains(".") { return }
        currentOperand.append(".")
    }
    
    private func handleZeroButtons(from operand: String) {
        if Double(currentOperand) == .zero { return }
        currentOperand.append(operand)
    }
    
    private func appendOperands(from operand: String) {
        if currentOperand == "0"{
            currentOperand = operand
        } else if currentOperand == "-0" {
            currentOperand = "-" + operand
        } else {
            currentOperand.append(operand)
        }
    }
}
