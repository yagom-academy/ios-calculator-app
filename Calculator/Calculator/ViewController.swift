//  Calculator - ViewController.swift
//  Created by quokka.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calculatingValueLabel: UILabel!
    @IBOutlet weak var inputFormulaLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet var operandBtns: [UIButton]!
    @IBOutlet var operatorBtns: [UIButton]!
    
    @IBOutlet weak var allClearBtn: UIButton!
    @IBOutlet weak var clearEntryBtn: UIButton!
    @IBOutlet weak var plusAndMinusBtn: UIButton!
    @IBOutlet weak var calculationBtn: UIButton!
    var inputValueResult = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputFormulaLabel.text = "0"
        inputOperatorLabel.text = ""
        removeOperatorLabelTextAtInputValueIsZero()
    }
    
    @IBAction func touchUpOperandBtns(_ sender: UIButton) {
        guard let operand = operandBtns[sender.tag].titleLabel?.text,
              let inputValue = inputFormulaLabel.text else { return }
        inputFormulaLabel.text = inputValue+operand
    }
    
    @IBAction func touchUpOperatorBtns(_ sender: UIButton) {
        if inputFormulaLabel.text == "0", inputOperatorLabel.text?.isEmpty == false { return }
        guard let operatorValue = operatorBtns[sender.tag].titleLabel?.text,
              let operandValue = inputFormulaLabel.text else { return }
        inputOperatorLabel.text = operatorValue
        calculatingValueLabel.text = operandValue
        inputFormulaLabel.text = "0"
    }
    
    @IBAction func touchUpEntryClear() {
        if let inputValue = inputFormulaLabel.text,
           let inputLastValue = inputValue.last,
           let _ = Int(inputLastValue.description) {
            inputFormulaLabel.text?.removeLast()
        } else if inputOperatorLabel.text?.isEmpty == false {
        } else {
            inputFormulaLabel.text?.removeLast()
        }
    }
    
    @IBAction func touchUpAllClear() {
        inputFormulaLabel.text?.removeAll()
        inputOperatorLabel.text?.removeAll()
        inputFormulaLabel.text = "0"
    }
    
    @IBAction func switchPlusAndMinusToInputOperatorLabel() {
        if inputOperatorLabel.text == "➕" {
            inputOperatorLabel.text = "➖"
        } else {
            inputOperatorLabel.text = "➕"
        }
    }
    
    func removeOperatorLabelTextAtInputValueIsZero() {
        if inputFormulaLabel.text == "0" {
            inputOperatorLabel.text?.removeAll()
        }
    }
}
