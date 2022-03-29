//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var listScrollView: UIScrollView!
    @IBOutlet weak var formulaListStackView: UIStackView!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    private var isInputZero: Bool = false
    private var isResult: Bool = false
    private var formulaToSend = ""
    private let stringZero = "0"
    private let minusSign = "-"
    private let stringNaN = "NaN"
    private let stringDot = "."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    //MARK: - IBAction
    @IBAction func touchACButton(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction func touchCEButton(_ sender: UIButton) {
        self.operandLabel.text = stringZero
        self.isInputZero = false
    }
    
    @IBAction func touchChangeSignButton(_ sender: UIButton) {
        guard let operandText = self.operandLabel.text else { return }
        if operandText == stringZero { return }
        if operandText.contains(minusSign) {
            self.operandLabel.text = operandText.replacingOccurrences(of: minusSign, with: "")
        } else {
            self.operandLabel.text = minusSign + operandText
        }
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let operandText = self.operandLabel.text, operandText.count < 20 else { return }
        guard let inputNumber = sender.titleLabel?.text else { return }
        if isResult == true {
            removeFormula()
            self.operandLabel.text = changeNumberFormat(number: inputNumber)
        } else {
            self.operandLabel.text = self.showZeroAfterDot(number: operandText + inputNumber)
        }
        self.isInputZero = true
        self.isResult = false
    }
    
    @IBAction func touchDotButton(_ sender: UIButton) {
        guard let operandText = self.operandLabel.text else { return }
        if operandText.contains(stringDot) { return }
        self.operandLabel.text = operandText + stringDot
    }
    
    @IBAction func touchOperationButton(_ sender: UIButton) {
        guard let inputOperation = sender.titleLabel?.text else { return }
        guard let operandText = self.operandLabel.text else { return }
        guard let operationText = self.operationLabel.text else { return }
        if self.formulaListStackView.subviews.isEmpty && operandText == stringZero || operandText == stringNaN { return }
        if isResult == true {
            removeFormula()
            self.isResult = false
        }
        self.operationLabel.text = inputOperation
        if isInputZero == false { return }
        addFormula(operation: operationText, operand: operandText)
        self.operandLabel.text = stringZero
        self.isInputZero = false
    }
    
    @IBAction func touchResultButton(_ sender: UIButton) {
        if self.isResult == true { return }
        if self.formulaListStackView.arrangedSubviews.isEmpty { return }
        guard let operandText = self.operandLabel.text else { return }
        guard let operationText = self.operationLabel.text else { return }
        addFormula(operation: operationText, operand: operandText)
        var resultFormula = ExpressionParser.parse(from: self.formulaToSend)
        let result = resultFormula.result()
        self.operandLabel.text = changeNumberFormat(number: String(result))
        self.operationLabel.text = ""
        self.formulaToSend = ""
        self.isResult = true
    }
    //MARK: - Functions
    private func resetCalculator() {
        removeFormula()
        self.operandLabel.text = stringZero
        self.operationLabel.text = ""
        self.formulaToSend = ""
        self.isInputZero = false
    }
    
    private func showZeroAfterDot(number: String) -> String {
        if number.contains(stringDot) && number.last == Character(stringZero) { return number }
        return changeNumberFormat(number: number)
    }
    
    private func changeToDouble(number: String) -> Double {
        return Double(number.replacingOccurrences(of: ",", with: "")) ?? 0
    }
    
    private func changeNumberFormat(number: String) -> String {
        let number = changeToDouble(number: number)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = -2
        guard let changedNumber = numberFormatter.string(from: number as NSNumber) else { return "" }
        if changedNumber == "-0" { return stringZero}
        return changedNumber
    }
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }
    
    private func makeLabel(element: String) -> UILabel {
        let label = UILabel()
        label.text = element
        label.textColor = .white
        return label
    }
    
    private func addFormula(operation: String, operand: String) {
        self.formulaToSend = "\(self.formulaToSend) \(operation) \(String(changeToDouble(number: operand)))"
        let numberStackView = makeStackView()
        numberStackView.addArrangedSubview(makeLabel(element: operation))
        numberStackView.addArrangedSubview(makeLabel(element: changeNumberFormat(number: operand)))
        self.formulaListStackView.addArrangedSubview(numberStackView)
        self.listScrollView.scrollToBottom()
    }
    
    private func removeFormula() {
        self.formulaListStackView.arrangedSubviews.forEach({
            $0.removeFromSuperview()})
    }
}

extension UIScrollView {
    func scrollToBottom() {
        layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: true)
    }
}
