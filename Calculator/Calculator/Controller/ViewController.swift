//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var verticalStackView: UIStackView!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private weak var currentOperandLabel: UILabel!
    
    private let calculator = Calculator()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.calculator.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearToInitialState()
    }
}

// MARK:- IBAction
private extension ViewController {
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        calculator.allClearButtonDidTap()
    }
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        calculator.clearEntryButtonDidTap()
    }
    @IBAction func toggleSignButtonTapped(_ sender: UIButton) {
        calculator.toggleSignButtonDidTap()
    }
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else { return }
        calculator.operatorButtonDidTap(operator: `operator`)
    }
    @IBAction func equalsButtonTapped(_ sender: UIButton) {
        calculator.equalsButtonDidTap()
    }
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        calculator.dotButtonDidTap()
    }
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        calculator.zeroButtonDidTap()
    }
    @IBAction func doubleZeroButtonTapped(_ sender: UIButton) {
        calculator.doubleZeroButtonDidTap()
    }
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        calculator.digitButtonDidTap(number: number)
    }
}

// MARK:- Delegate Implementation
extension ViewController: CalculatorDelegate {
    func clearToInitialState() {
        currentOperatorLabel.text = ""
        currentOperandLabel.text = "0"
        verticalStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func addFormulaLine(operator: String, operand: String) {
        let operatorLabel = makeFormulaLabel(with: `operator`)
        let operandLabel = makeFormulaLabel(with: operand)
        let horizontalStackView =
            makeHorizontalStackView(operator: operatorLabel,
                                    operand: operandLabel)
        
        verticalStackView.addArrangedSubview(horizontalStackView)
    }
}


// MARK:- Formula StackView Factory
private extension ViewController {
    func makeFormulaLabel(with text: String) -> UILabel {
        let label = UILabel()
        
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.text = text
        
        return label
    }
    
    func makeHorizontalStackView(operator: UILabel,
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
