//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var workingSpace: String = ""
    var operand = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    func setUp() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        if let number = sender.currentTitle {
            operand += number
        }
        
        operandLabel.text! = operand
    }
    
    @IBAction func zeroAndCommaButtonTapped(_ sender: UIButton) {
        if operandLabel.text! == "0" {
            return
        }
        
        if let input = sender.currentTitle {
            operand += input
        }
        
        operandLabel.text! = operand
    }
    
    
    @IBAction func chageSignButtonTapped(_ sender: UIButton) {
        if var operand = Int(operandLabel.text!) {
            operand = -operand
            operandLabel.text! = String(operand)
        } else if var operand = Double(operandLabel.text!) {
            operand = -operand
            operandLabel.text! = String(operand)
        }
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        operandLabel.text! = "0"
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        operatorLabel.text! = `operator`
        
        if !operandLabel.text!.isEmpty && operandLabel.text! != "0" {
            workingSpace += " " + operandLabel.text! + " " + operatorLabel.text!
        }
        
        operand = ""
        operandLabel.text! = "0"
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        workingSpace += " " + operandLabel.text!
        var formula = ExpressionParser.parse(from: workingSpace)
        let result = formula.result()
        operandLabel.text! = String(result)
        operand = ""
        workingSpace = ""
    }
    
    @IBAction func clearAllButtonTapped(_ sender: UIButton) {
        workingSpace = ""
        operand = ""
        setUp()
    }
}
