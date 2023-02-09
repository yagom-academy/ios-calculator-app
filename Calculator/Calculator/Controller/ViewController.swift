//
//  Calculator - ViewController.swift
//  Created by 혜모리, 릴라.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operationContentStackView: UIStackView!
    @IBOutlet private weak var operationScrollView: UIScrollView!
    
    private let calculateManager = CalculateManager()
    private var currentOperator: String { operatorLabel.text ?? Sign.zero }
    private var currentOperand: String { operandLabel.text ?? Sign.empty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    private func resetCalculator() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.empty
        calculateManager.clearExpressions()
        operationContentStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func setCurrentOperand(_ sender: UIButton){
        calculateManager.setCurrentOperand(to: operandLabel.text)
    }
    
    @IBAction private func didTapNumberButton(_ sender: UIButton) {
        guard let result = calculateManager.updateOperand(input: sender.currentTitle) else {
            return
        }
        operandLabel.text = result
    }

    @IBAction private func didTapDot(_ sender: UIButton) {
        let operandContainedDot = calculateManager.updateDot()
        operandLabel.text = operandContainedDot
    }
    
    @IBAction private func didTapOperatorButton(_ sender: UIButton) {
        let sign = sender.currentTitle
        let operand = currentOperand.removeComma()
        
        guard calculateManager.updateOperator(with: sign) == true else {
            operatorLabel.text = sign
            return
        }
        setOperationContentStackView(operatorValue: currentOperator,
                                     operandValue: operand.applyFormatter())
        operatorLabel.text = sign
        operandLabel.text = Sign.zero
    }
    
    @IBAction private func didTapACButton(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction private func didTapCEButton(_ sender: UIButton) {
        operandLabel.text = Sign.zero
    }
    
    @IBAction private func didTapConvertPositiveAndNegativeNumber(_ sender: UIButton) {
        let operandValue = calculateManager.convertPositiveNegative()
        
        operandLabel.text = operandValue.applyFormatter()
    }
    
    @IBAction private func didTapEqualButton(_ sender: UIButton) {
        guard operatorLabel.text != Sign.blank else { return }
        setOperationContentStackView(operatorValue: currentOperator, operandValue: currentOperand)
        displayOperationResult()
    }
    
    private func displayOperationResult() {
        let result = calculateManager.calculateExpressions(operatorSign: currentOperator)
        
        guard result.isNaN == false else {
            operatorLabel.text = Sign.blank
            operandLabel.text = Sign.nan
            calculateManager.clearExpressions()
            return
        }
        operatorLabel.text = Sign.blank
        operandLabel.text = String(result).applyFormatter()
        calculateManager.clearExpressions()
    }
    
    private func createLabel(input: String) -> UILabel {
        let label = UILabel()
        
        label.text = input
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }
    
    private func createOperationStackView(operatorLabel: UILabel,
                                          operandLabel: UILabel) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        return stackView
    }
    
    private func setScrollView() {
        operationScrollView.layoutIfNeeded()
        operationScrollView.setContentOffset(CGPoint(x: 0,
                                                     y: operationScrollView.contentSize.height
                                                     - operationScrollView.bounds.height),
                                             animated: true)
    }
    
    private func setOperationContentStackView(operatorValue: String, operandValue: String) {
        let operatorLabel = createLabel(input: operatorValue)
        let operandLabel = createLabel(input: operandValue)
        let operationStackView = createOperationStackView(operatorLabel: operatorLabel,
                                                          operandLabel: operandLabel)
        operationContentStackView.addArrangedSubview(operationStackView)
        setScrollView()
    }
}
