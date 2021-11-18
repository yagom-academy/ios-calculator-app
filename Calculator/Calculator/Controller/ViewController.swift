//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController, CalculatorDelegate {
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    
    let calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLabels()
    }
}

// MARK:- IBAction
extension ViewController {
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
    }
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
    }
    @IBAction func toggleSignButtonTapped(_ sender: UIButton) {
    }
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
    }
    @IBAction func equalsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func dotButtonTapped(_ sender: UIButton) {
    }
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
    }
    @IBAction func doubleZeroButtonTapped(_ sender: UIButton) {
    }
    @IBAction func digitButtonTapped(_ sender: UIButton) {
    }
}

// MARK:-
extension ViewController {
    func clearLabels() {
        let blank = ""
        let zero = "0"
        
        currentOperatorLabel.text = blank
        currentOperandLabel.text = zero
        verticalStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
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
