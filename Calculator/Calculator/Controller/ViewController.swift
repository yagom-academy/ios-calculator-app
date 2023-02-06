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
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearEntryButton: UIButton!
    @IBOutlet weak var changeSignButton: UIButton!
    @IBOutlet weak var calculationButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    //MARK: - UILabel Outlet
    @IBOutlet weak var inputOperandsLabel: UILabel!
    @IBOutlet weak var inputOperatorsLabel: UILabel!
    
    //MARK: - UIView Outlet
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var scrollView: UIScrollView!
    
    var currentOperand: String {
        return inputOperandsLabel.text ?? Sign.zero
    }
    var currentOperator: String {
        return inputOperatorsLabel.text ?? Sign.nothing
    }
    var currentInputFormula: [String] = []
    var oldInputFormula: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    func reset() {
        inputOperandsLabel.text = Sign.zero
        inputOperatorsLabel.text = Sign.nothing
    }
    
    func makeStackView(_ operatorSign: String, _ operand: String) -> UIStackView {
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
    
    func formatNumber(_ result: Double) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = 20

        return numberFormatter.string(from: NSNumber(value: result)) ?? Sign.nothing
    }
    
    func removeComma(_ inputString: String) -> String {
        let removedCommaString = inputString.replacingOccurrences(of: ",", with: "")
        
        return removedCommaString
    }
    
    func settingScrollView() {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0,
                                            y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: false)
    }
    
    //MARK: - IBAciton
    @IBAction func operandsButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        guard let zero = sender.currentTitle,
              currentOperand != Sign.zero else { return }
        inputOperandsLabel.text = currentOperand + zero
    }
    
    @IBAction func operatorsButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard let dot = sender.currentTitle,
              currentOperand.contains(Sign.dot) == false else { return }
        inputOperandsLabel.text = currentOperand + dot
    }
    
    @IBAction func calculationButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        reset()
        currentInputFormula = []
        oldInputFormula = []
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction func changeSignButtonTapped(_ sender: UIButton) {
        guard currentOperand != Sign.zero else { return }
        
        if currentOperand.hasPrefix(Sign.minus) {
            inputOperandsLabel.text = currentOperand.trimmingCharacters(in: ["-"])
        } else {
            inputOperandsLabel.text = Sign.minus + currentOperand
        }
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        inputOperandsLabel.text = Sign.zero
    }
}
