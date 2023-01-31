//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    
    private var workingSpace: String = ""
    private var operand = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private func setUp() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction private func numberButtonTapped(_ sender: UIButton) {
        if let number = sender.currentTitle {
            operand += number
        }
        
        operandLabel.text! = operand
    }
    
    @IBAction private func zeroAndCommaButtonTapped(_ sender: UIButton) {
        if operandLabel.text! == "0" {
            return
        }
        
        if let input = sender.currentTitle {
            operand += input
        }
        
        operandLabel.text! = operand
    }
    
    
    @IBAction private func chageSignButtonTapped(_ sender: UIButton) {
        if var operand = Int(operandLabel.text!) {
            operand = -operand
            operandLabel.text! = String(operand)
        } else if var operand = Double(operandLabel.text!) {
            operand = -operand
            operandLabel.text! = String(operand)
        }
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        operandLabel.text! = "0"
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        operatorLabel.text! = `operator`
        
        if !operandLabel.text!.isEmpty && operandLabel.text! != "0" {
            workingSpace += operandLabel.text! + operatorLabel.text!
        }
        
        operand = ""
        operandLabel.text! = "0"
    }
    
    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        workingSpace += operandLabel.text!
        print(workingSpace)
        var formula = ExpressionParser.parse(from: workingSpace)
        let result = formula.result()
        
        if result.isNaN {
            operandLabel.text! = "NaN"
            operatorLabel.text! = ""
            operand = ""
            workingSpace = ""
        } else {
            print(result)
            operandLabel.text! = useNumberFormatter(result)
            operatorLabel.text! = ""
            operand = ""
            workingSpace = ""
        }
    }
    
    @IBAction private func clearAllButtonTapped(_ sender: UIButton) {
        workingSpace = ""
        operand = ""
        setUp()
    }
    
    private func useNumberFormatter(_ input: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        var result = numberFormatter.string(for: input) ?? "0"
        
        if result.count >= 20 {
            let index = result.index(result.startIndex, offsetBy: 19)
            result = String(result[...index])
        }
        
        return result
    }
}
