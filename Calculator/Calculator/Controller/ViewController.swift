//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandLabel.text = "0"
        operatorLabel.text = ""
    }

    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        stackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func touchUpCleanEntryButton(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpSignButton(_ sender: UIButton) {
        guard let operand = operandLabel.text, operand != "0", operand != "." else {
            return
        }
        guard operand.hasPrefix("-") else {
            operandLabel.text = "-\(operand)"
            return
        }
        
        operandLabel.text = String(operand.suffix(operand.count - 1))
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let currentOperand = sender.currentTitle else {
            return
        }
        guard let operand = operandLabel.text, operand != "0" else {
            operandLabel.text = currentOperand
            return
        }

        operandLabel.text = operand + currentOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        operatorLabel.text = sender.currentTitle
        
        guard operandLabel.text != "0", operandLabel.text != "." else {
            return
        }
        
        addStackView()
        operandLabel.text = "0"
    }
    
    func addStackView() {
        let recordedFormulaLabel: [UILabel] = configureItem()
        let content: UIStackView = configureContent(item: recordedFormulaLabel)
        stackView.addArrangedSubview(content)
    }
    
    func configureContent(item formula: [UILabel]) -> UIStackView {
        let content: UIStackView = UIStackView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.axis = .horizontal
        content.alignment = .fill
        content.distribution = .equalSpacing
        content.spacing = 8
        formula.forEach { content.addArrangedSubview($0) }
        
        return content
    }

    func configureItem() -> [UILabel] {
        let recordedOperatorLabel: UILabel = UILabel()
        recordedOperatorLabel.font = .preferredFont(forTextStyle: .title3)
        recordedOperatorLabel.text = operatorLabel.text
        recordedOperatorLabel.textColor = .white
        let recordedOperandLabel: UILabel = UILabel()
        recordedOperandLabel.font = .preferredFont(forTextStyle: .title3)
        recordedOperandLabel.text = operandLabel.text
        recordedOperandLabel.textColor = .white
        
        return [recordedOperatorLabel, recordedOperandLabel]
    }
}

