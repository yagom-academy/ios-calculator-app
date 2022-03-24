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
        inputFormulaLabel.text = ""
        inputOperatorLabel.text = ""
    }
    
    @IBAction func appendOperandToInputFormulaLabel(_ sender: UIButton) {
        guard let operand = operandBtns[sender.tag].titleLabel?.text,
              let inputValue = inputFormulaLabel.text else { return }
        inputFormulaLabel.text = inputValue+operand
    }
    
    @IBAction func appendOperatorToInputFormulaLabel(_ sender: UIButton) {
        guard let operatorValue = operatorBtns[sender.tag].titleLabel?.text,
              let inputValue = inputFormulaLabel.text else { return }
        inputFormulaLabel.text = inputValue+operatorValue
    }
    
    @IBAction func touchUpEntryClear() {
        guard let _ = inputFormulaLabel.text?.removeLast() else { return }
    }
    
    @IBAction func touchUpAllClear() {
        guard let _ = inputFormulaLabel.text?.removeAll() else { return }
    }
    
    @IBAction func switchPlusAndMinus() {
        if inputOperatorLabel.text == "➕" {
            inputOperatorLabel.text = "➖"
        } else {
            inputOperatorLabel.text = "➕"
        }
    }
}
