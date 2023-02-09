//
//  Calculator - ViewController.swift
//  Created by christy, Muri.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
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
        return inputOperatorsLabel.text ?? Sign.blank
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
        inputOperatorsLabel.text = Sign.blank
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
    
    private func formatNumber(_ result: Decimal) -> String {
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter.string(from: result as NSNumber) ?? Sign.blank
    }
    
    private func removeComma(_ inputString: String) -> String {
        let removedCommaString = inputString.replacingOccurrences(of: Sign.comma, with: Sign.blank)
        
        return removedCommaString
    }
    
    private func settingScrollView() {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0,
                                            y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: true)
    }
    
    //MARK: - IBAciton
    @IBAction private func operandsButtonTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle,
              currentOperand.filter { Int(String($0)) != nil }.count < 20 else { return }

        if currentOperand == Sign.zero {
            inputOperandsLabel.text = number
        } else {
            let currentNumber = currentOperand + number
            let removedNumber = removeComma(currentNumber)
            let formattedString = formatNumber(Decimal(string: removedNumber) ?? 0 )
            
            inputOperandsLabel.text = formattedString
        }
    }
    
    @IBAction private func zeroButtonTapped(_ sender: UIButton) {
        guard let zero = sender.currentTitle,
              currentOperand != Sign.zero,
              currentOperand.count < 26 else { return }
        
        let currentNumber = currentOperand + zero
        
        guard currentNumber.filter { $0 == Character(Sign.dot) }.isEmpty else {
            inputOperandsLabel.text = currentNumber
            
            return
        }
        
        let numberWithoutComma = removeComma(currentNumber)
        let formattedString = formatNumber(Decimal(string: numberWithoutComma) ?? 0 )
        
        inputOperandsLabel.text = formattedString
    }
    
    @IBAction private func operatorsButtonTapped(_ sender: UIButton) {
        var newStackView: UIStackView = UIStackView()
        
        guard let currentSign = sender.currentTitle else { return }
        
        if inputOperandsLabel.text == Sign.zero {
            inputOperatorsLabel.text = currentSign
        } else {
            let removedComma = removeComma(currentOperand)
            newStackView = makeStackView(
                currentOperator,
                formatNumber(Decimal(string: removedComma) ?? 0)
            )
            
            stackView.addArrangedSubview(newStackView)
            settingScrollView()
            
            if currentOperator == Sign.blank {
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
              currentOperand.contains(Sign.dot) == false,
              currentOperand.count < 26 else { return }
        
        inputOperandsLabel.text = currentOperand + dot
    }
    
    @IBAction private func calculationButtonTapped(_ sender: UIButton) {
        guard currentInputFormula.isEmpty == false else { return }
        let removedComma = removeComma(currentOperand)
        let newStackView = makeStackView(
            currentOperator,
            formatNumber(Decimal(string: removedComma) ?? 0)
        )
        
        stackView.addArrangedSubview(newStackView)
        settingScrollView()
        
        currentInputFormula.append(currentOperator)
        currentInputFormula.append(currentOperand)
        
        let stringFormula = currentInputFormula.joined(separator: Sign.blank)
        let removedCommaFormula = removeComma(stringFormula)
        var parsedFormula = ExpressionParser.parse(from: removedCommaFormula)
        let result = parsedFormula.result()
        
        inputOperatorsLabel.text = Sign.blank
        inputOperandsLabel.text = formatNumber(Decimal(result))
        oldInputFormula.append(String(result))
        currentInputFormula.removeAll()
    }
    
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        resetLabelsText()
        currentInputFormula.removeAll()
        oldInputFormula.removeAll()
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

