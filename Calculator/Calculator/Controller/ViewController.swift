//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - UIButton Outlet
    @IBOutlet var operandsButton: [UIButton]!
    @IBOutlet var operatorsButton: [UIButton]!
    @IBOutlet var zeroButton: [UIButton]!
    @IBOutlet private weak var allClearButton: UIButton!
    @IBOutlet private weak var clearEntryButton: UIButton!
    @IBOutlet private weak var changeSignButton: UIButton!
    @IBOutlet private weak var calculationButton: UIButton!
    @IBOutlet private weak var dotButton: UIButton!
    
    //MARK: - UILabel Outlet
    @IBOutlet private weak var inputOperandsLabel: UILabel!
    @IBOutlet private weak var inputOperatorsLabel: UILabel!
    
    //MARK: - UIView Outlet
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var scrollView: UIScrollView!
    
    private var currentOperand: String {
        return inputOperandsLabel.text ?? Sign.zero
    }
    private var currentOperator: String {
        return inputOperatorsLabel.text ?? Sign.nothing
    }
    private var currentInputFormula: [String] = []
    private var oldInputFormula: [String] = []
    private let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetLabelsText()
    }
    
    private func resetLabelsText() {
        inputOperandsLabel.text = Sign.zero
        inputOperatorsLabel.text = Sign.nothing
    }
    
    private func makeStackView(_ operatorSign: String, _ operand: String) -> UIStackView {
        let view = UIStackView()
        let operandLabel = UILabel()
        let operatorLabel = UILabel()
        
        operatorLabel.text = operatorSign
        operatorLabel.textColor = .white
        operandLabel.text = operand
        operandLabel.textColor = .white
        
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 8
        
        view.addArrangedSubview(operatorLabel)
        view.addArrangedSubview(operandLabel)
        
        return view
    }
    
    private func formatNumber(_ result: Double) -> String {
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = 20

        return numberFormatter.string(from: NSNumber(value: result)) ?? Sign.nothing
    }
    
    private func removeComma(_ inputString: String) -> String {
        let removedCommaString = inputString.replacingOccurrences(of: ",", with: "")
        
        return removedCommaString
    }
    
    private func settingScrollView() {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0,
                                            y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: false)
    }
    
    //MARK: - IBAciton
    @IBAction private func operandsButtonTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        
        if currentOperand == Sign.zero {
            inputOperandsLabel.text = number
        } else {
            let currentNumber = currentOperand + number
            let removedNumber = removeComma(currentNumber)
            let formattedString = formatNumber(Double(removedNumber) ?? 0 )
            
            inputOperandsLabel.text = formattedString
        }
    }
    
    @IBAction private func zeroButtonTapped(_ sender: UIButton) {
        guard let zero = sender.currentTitle,
              currentOperand != Sign.zero else { return }
        inputOperandsLabel.text = currentOperand + zero
    }
    
    @IBAction private func operatorsButtonTapped(_ sender: UIButton) {
        var newStackView: UIStackView = UIStackView()
        
        guard let currentSign = sender.currentTitle else { return }

        if inputOperandsLabel.text == Sign.zero {
            inputOperatorsLabel.text = currentSign
        } else {
            newStackView = makeStackView(currentOperator, currentOperand)
            stackView.addArrangedSubview(newStackView)
            settingScrollView()
            
            if currentOperator == Sign.nothing {
                currentInputFormula.append(currentOperand)
            } else {
                currentInputFormula.append(currentOperator)
                currentInputFormula.append(currentOperand)
            }
            
            inputOperatorsLabel.text = currentSign
            inputOperandsLabel.text = Sign.zero
        }
    }
    
    @IBAction private func dotButtonTapped(_ sender: UIButton) {
        guard let dot = sender.currentTitle,
              currentOperand.contains(Sign.dot) == false else { return }
        inputOperandsLabel.text = currentOperand + dot
    }
    
    @IBAction private func calculationButtonTapped(_ sender: UIButton) {
        guard currentInputFormula.isEmpty == false else { return }
        let newStackView = makeStackView(currentOperator, currentOperand)
        stackView.addArrangedSubview(newStackView)
        settingScrollView()
        
        currentInputFormula.append(currentOperator)
        currentInputFormula.append(currentOperand)
        
        let stringFormula = currentInputFormula.joined(separator: " ")
        let removedCommaFormula = removeComma(stringFormula)
        var parsedFormula = ExpressionParser.parse(from: removedCommaFormula)
        let result = parsedFormula.result()

        inputOperatorsLabel.text = Sign.nothing
        inputOperandsLabel.text = formatNumber(result)
        oldInputFormula.append(String(result))
        currentInputFormula = []
    }
    
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        resetLabelsText()
        currentInputFormula = []
        oldInputFormula = []
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func changeSignButtonTapped(_ sender: UIButton) {
        guard currentOperand != Sign.zero else { return }
        
        if currentOperand.hasPrefix(Sign.minus) {
            inputOperandsLabel.text = currentOperand.trimmingCharacters(in: ["-"])
        } else {
            inputOperandsLabel.text = Sign.minus + currentOperand
        }
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        inputOperandsLabel.text = Sign.zero
    }
}
