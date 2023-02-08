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
    
    private var expressions: [String] = []
    private var isCalculatedStatus: Bool = false
    private var currentOperator: String { operatorLabel.text ?? Sign.zero }
    private var currentOperand: String { operandLabel.text ?? Sign.empty }
    private let calculateManager = CalculateManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    private func resetCalculator() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.empty
        expressions.removeAll()
        operationContentStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func setCurrentOperand(_ sender: UIButton){
        calculateManager.setCurrentOperand(to: operandLabel.text)
    }
    
    @IBAction private func didTapNumberButton(_ sender: UIButton) {
        calculateManager.setCurrentOperand(to: operandLabel.text)
        let result = calculateManager.updateOperand(input: sender.currentTitle)
        operandLabel.text = result
    }

    @IBAction private func didTapDot(_ sender: UIButton) {
        calculateManager.setCurrentOperand(to: operandLabel.text)
        let operandContainedDot = calculateManager.updateDot(at: currentOperand)
        operandLabel.text = operandContainedDot
    }
    
    @IBAction private func didTapOperatorButton(_ sender: UIButton) {
        updateOperator(with: sender.currentTitle)
    }
    
    @IBAction private func didTapACButton(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction private func didTapCEButton(_ sender: UIButton) {
        operandLabel.text = Sign.zero
    }
    
    @IBAction private func didTapConvertPositiveAndNegativeNumber(_ sender: UIButton) {
        let operandValue = convertPositiveAndNegativeNumber()
        
        operandLabel.text = operandValue.applyFormatter()
    }
    
    @IBAction private func didTapEqualButton(_ sender: UIButton) {
        guard operatorLabel.text != Sign.blank else { return }
        
        setOperationContentStackView(operatorValue: currentOperator, operandValue: currentOperand)
        isCalculatedStatus = true
        displayOperationResult()
    }
    
    private func displayOperationResult() {
        expressions.append(currentOperator)
        expressions.append(currentOperand.removeComma())
        
        let input = expressions.joined(separator: Sign.blank)
        
        let result = ExpressionParser.parse(from: input).result()
        
        guard result.isNaN == false else {
            operatorLabel.text = Sign.blank
            operandLabel.text = Sign.nan
            expressions.removeAll()
            return
        }
        
        operatorLabel.text = Sign.blank
        operandLabel.text = String(result).applyFormatter()
        expressions.removeAll()
    }

    private func updateOperator(with sign: String?) {
        let operand = currentOperand.removeComma()
        
        guard expressions.isEmpty == false else {
            let operand = currentOperand.removeComma()
            expressions.append(operand)
            
            setOperationContentStackView(operatorValue: Sign.empty,
                                         operandValue: operand.applyFormatter())
            isCalculatedStatus = false
            operatorLabel.text = sign
            operandLabel.text = Sign.zero
            return
        }
        
        guard operandLabel.text != Sign.zero else {
            operatorLabel.text = sign
            return
        }
        
        setOperationContentStackView(operatorValue: currentOperator,
                                     operandValue: operand.applyFormatter())
        
        expressions.append(currentOperator)
        expressions.append(operand)
        
        isCalculatedStatus = false
        operatorLabel.text = sign
        operandLabel.text = Sign.zero
    }
    
    private func convertPositiveAndNegativeNumber() -> String {
        guard var operands = operandLabel.text,
              operands != Sign.zero  else { return Sign.zero }
        
        if operands.first == Sign.negative {
            operands.removeFirst()
        } else {
            operands = "\(Sign.negative)" + operands
        }
        return operands
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
