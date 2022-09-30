//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    private var operand: String = ""
    private var isDotButtonTapped: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func oneToNineOperandButtonTapped(_ sender: UIButton) {
        guard let selectedOperand = Operand.matchOperandButtonTag(location: sender.tag) else {
            return
        }
        
        updateOperandLabel(with: selectedOperand.bringOperandSymbol)
    }
    
    @IBAction func dotButtonTapped(_ sender: Any) {
        if !operand.isEmpty && !isDotButtonTapped {
            updateOperandLabel(with: ".")
            isDotButtonTapped = true
        }
    }
    
    func updateOperandLabel(with input: String) {
        operand += input
        operandLabel.text = operand
    }

    func setOperandLabelToZero() {
        operandLabel.text = "0"
    }
    
    func setInitialOperatorLabel() {
        operatorLabel.text = ""
    }
}

