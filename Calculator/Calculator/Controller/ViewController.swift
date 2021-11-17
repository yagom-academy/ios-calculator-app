//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    
    private var entry = OperandEntry()
    private var formula: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        addFormulaLine(operator: "-", operand: "1234567890")
        clearLabels()
    }
    
    @IBAction func allClearButtonDidTap(_ sender: UIButton) {
        entry.clear()
        updateOperandLabel()
    }
    @IBAction func clearEntryButtonDidTap(_ sender: UIButton) {
        entry.clear()
        updateOperandLabel()
    }
    @IBAction func toggleSignButtonDidTap(_ sender: UIButton) {
        entry.toggleSign()
        updateOperandLabel()
    }
    @IBAction func numberButtonDidTap(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        entry.append(number)
        updateOperandLabel()
    }
    @IBAction func operatorButtonDidTap(_ sender: UIButton) {
    }
    @IBAction func equalsButtonDidTap(_ sender: UIButton) {
        //
    }
    
    func clearLabels() {
        let blank = ""
        let zero = "0"
        
        currentOperatorLabel.text = blank
        currentOperandLabel.text = zero
        verticalStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func updateOperandLabel() {
        currentOperandLabel.text = entry.currentOperand
    }
    
    func updateOperatorLabel(by operator: String) {
        currentOperatorLabel.text = `operator`
    }
}

// MARK:- Adding Formula Line To StackView
extension ViewController {
    private func addFormulaLine(operator: String, operand: String) {
        let operatorLabel = makeFormulaLabel(with: `operator`)
        let operandLabel = makeFormulaLabel(with: operand)
        let horizontalStackView =
            makeHorizontalStackView(operator: operatorLabel,
                                    operand: operandLabel)
        
        verticalStackView.addArrangedSubview(horizontalStackView)
    }
    
    private func makeFormulaLabel(with text: String) -> UILabel {
        let label = UILabel()
        
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.text = text
        
        return label
    }
    
    private func makeHorizontalStackView(operator: UILabel,
                                         operand: UILabel) -> UIStackView {
        let horizontal = UIStackView()
        let defaultSpacing: CGFloat = 8
        
        horizontal.axis = .horizontal
        horizontal.translatesAutoresizingMaskIntoConstraints = false
        horizontal.addArrangedSubview(`operator`)
        horizontal.addArrangedSubview(operand)
        horizontal.spacing = defaultSpacing
        
        return horizontal
    }
}
