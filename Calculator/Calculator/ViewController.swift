//  Calculator - ViewController.swift
//  Created by quokka.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputFormulaLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet var operandBtns: [UIButton]!
    @IBOutlet var operatorBtns: [UIButton]!
    
    @IBOutlet weak var allClearBtn: UIButton!
    @IBOutlet weak var clearEntryBtn: UIButton!
    @IBOutlet weak var plusAndMinusBtn: UIButton!
    @IBOutlet weak var calculationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputFormulaLabel.text = "0"
        inputOperatorLabel.text = ""
    }
    
    @IBAction func appendOperandToInputFormulaLabel(_ sender: UIButton) {
        guard let operand = operandBtns[sender.tag].titleLabel?.text,
              let inputValue = inputFormulaLabel.text else { return }
        inputFormulaLabel.text = inputValue+operand
    }
}

