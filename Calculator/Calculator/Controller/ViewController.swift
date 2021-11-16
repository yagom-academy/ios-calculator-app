//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
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
        calculatorStackView.subviews.forEach{
            $0.removeFromSuperview()
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
    
    func scrollToBottom(_ view: UIScrollView) {
        let bottomOffset = CGPoint(x: 0, y: view.contentSize.height)
        view.setContentOffset(bottomOffset, animated: false)
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
        calculatorStackView.addArrangedSubview(formula)
        operandLabel.text = "0"
        operatorLabel.text = currentOperatorButtonText
        
        scrollToBottom(calculatorScrollView)
    }
    
    func addFormula(operand: String, operator: String) -> UIStackView {
        let formulaStackView = UIStackView()
        let operandLabel = UILabel()
        operandLabel.text = operand
        guard calculatorStackView.subviews.count > 0 else {
            setUpFormulaLabel(of: operandLabel)
            formulaStackView.addArrangedSubview(operandLabel)
            return formulaStackView
        }
        let operatorLabel = UILabel()
        operatorLabel.text = `operator`
        setUpFormulaLabel(of: operatorLabel)
        setUpFormulaLabel(of: operandLabel)
        formulaStackView.axis = .horizontal
        formulaStackView.alignment = .fill
        formulaStackView.distribution = .fill
        formulaStackView.spacing = 8
        formulaStackView.addArrangedSubview(operatorLabel)
        formulaStackView.addArrangedSubview(operandLabel)
        return formulaStackView
    }
    
    func setUpFormulaLabel(of label: UILabel) {
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.adjustsFontForContentSizeCategory = true
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

