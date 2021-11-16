//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var formulaStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var isCalculated: Bool {
        operandLabel.text != "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFormulaLabel()
        removeFormulaView()
    }
    
    private func removeFormulaView() {
        formulaStackView.subviews.forEach{ view in
            view.removeFromSuperview()
        }
    }
    
    private func setUpFormulaLabel() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        guard let currentOperandButtonText = sender.titleLabel?.text else {
            return
        }
        guard operandLabel.text! != "0" || currentOperandButtonText != "00" else {
            return
        }
        guard isCalculated else {
            operandLabel.text! = currentOperandButtonText
            return
        }
        operandLabel.text! += currentOperandButtonText
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard isCalculated else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        guard let currentOperatorButtonText = sender.titleLabel?.text else {
            return
        }
        let formula = addFormula(operand: operandLabel.text!, operator: currentOperatorButtonText)
        formulaStackView.addArrangedSubview(formula)
        operandLabel.text = "0"
        operatorLabel.text = currentOperatorButtonText
    }
    
    func addFormula(operand: String, operator: String) -> UIStackView {
        let formulaStackView = UIStackView()
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        formulaStackView.axis = .horizontal
        formulaStackView.alignment = .firstBaseline
        formulaStackView.distribution = .fill
        formulaStackView.spacing = 8
        
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.textColor = .white
        operatorLabel.text = `operator`
        operatorLabel.adjustsFontForContentSizeCategory = true
        
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operandLabel.textColor = .white
        operandLabel.text = operand
        operandLabel.adjustsFontForContentSizeCategory = true
        
        formulaStackView.addArrangedSubview(operatorLabel)
        formulaStackView.addArrangedSubview(operandLabel)
        
        return formulaStackView
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        guard isCalculated || operatorLabel.text != "" else {
            return
        }
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        operandLabel.text = "0"
        operatorLabel.text = ""
        removeFormulaView()
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        let hasDotNotIncluded = operandLabel.text?.contains(".") == false
        guard hasDotNotIncluded else {
            return
        }
        guard let currentOperandButtonText = sender.titleLabel?.text else {
            return
        }
        operandLabel.text! += currentOperandButtonText
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        guard isCalculated else {
            return
        }
        let hasMinusNotIncluded = operandLabel.text!.contains("-") == false
        guard hasMinusNotIncluded else {
            operandLabel.text!.remove(at: operandLabel.text!.startIndex)
            return
        }
        operandLabel.text = "-" + operandLabel.text!
    }
}

