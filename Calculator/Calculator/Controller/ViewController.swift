//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var fomulaToSend = ""
    private let stringZero = "0"
    private let stringDot = "."
    private let minusSign = "-"
    private var isInputZero = false
    private var isResult = false
    
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var listScrollView: UIScrollView!
    @IBOutlet private weak var fomulaListStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCaculator()
    }
    
    @IBAction private func touchACButton(_ sender: UIButton) {
        resetCaculator()
    }
    
    @IBAction func touchCEButton(_ sender: UIButton) {
        self.operandLabel.text = stringZero
        self.isInputZero = false
    }
    
    @IBAction func touchChangeSignButton(_ sender: UIButton) {
        guard let operandsText = self.operandLabel.text else {
            return
        }
        if operandsText == stringZero {
            return
        }
        if operandsText.contains(minusSign) {
            self.operandLabel.text = operandsText.replacingOccurrences(of: minusSign, with: "")
        } else {
            self.operandLabel.text = minusSign + operandsText
        }
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text else {
            return
        }
        guard let operandsText = self.operandLabel.text, operandsText.count < 20 else {
            return
        }
        if isResult == true {
            removeFomulaList()
            self.operandLabel.text = inputNumber
        } else {
            self.operandLabel.text = self.checkZeroAfterDot(number: operandsText + inputNumber)
        }
        self.isInputZero = true
        self.isResult = false
    }
    
    @IBAction func touchDotButton(_ sender: UIButton) {
        guard let operandsText = self.operandLabel.text else {
            return
        }
        if operandsText.contains(stringDot) {
            return
        }
        self.operandLabel.text = operandsText + stringDot
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.titleLabel?.text else {
            return
        }
        guard let operatorText = self.operatorLabel.text else {
            return
        }
        guard let operandsText = self.operandLabel.text else {
            return
        }
        if self.fomulaListStackView.subviews.isEmpty && operandsText == stringZero || operandsText == "NaN" {
            return
        }
        self.operatorLabel.text = inputOperator
        if isInputZero == false {
            return
        }
        if self.isResult == true {
            removeFomulaList()
            self.isResult = false
        }
        addFomula(operator: operatorText, operand: operandsText)
        self.operandLabel.text = stringZero
        self.isInputZero = false
    }
    
    @IBAction func touchResultButton(_ sender: UIButton) {
        if self.isResult == true {
            return
        }
        if self.fomulaListStackView.arrangedSubviews.isEmpty {
            return
        }
        guard let operatorText = self.operatorLabel.text else {
            return
        }
        guard let operandsText = self.operandLabel.text else {
            return
        }
        addFomula(operator: operatorText, operand: operandsText)
        var resultFomula = ExpressionParser.parse(frome: self.fomulaToSend)
        let result = resultFomula.result()
        switch result {
        case .success(let number):
            self.operandLabel.text = changeNumberFormat(number: String(number))
        case .failure(let error):
            self.operandLabel.text = error.errorDescription
        }
        self.operatorLabel.text = ""
        self.fomulaToSend = ""
        self.isResult = true
    }
    
    private func resetCaculator() {
        removeFomulaList()
        self.operatorLabel.text = ""
        self.operandLabel.text = stringZero
        self.isInputZero = false
    }
    
    private func removeFomulaList() {
        self.fomulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func checkZeroAfterDot(number: String) -> String {
        if number.contains(stringDot) && number.last == Character(stringZero) {
            return number
        }
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
        guard let changedNumber = numberFormatter.string(from: number as NSNumber) else {
            return ""
        }
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
    
    private func addFomula(`operator`: String, operand: String) {
        self.fomulaToSend = "\(self.fomulaToSend) \(`operator`) \(String(changeToDouble(number: operand)))"
        let numberStackView = makeStackView()
        numberStackView.addArrangedSubview(makeLabel(element: `operator`))
        numberStackView.addArrangedSubview(makeLabel(element: operand))
        self.fomulaListStackView.addArrangedSubview(numberStackView)
        self.listScrollView.scrollToBottom()
    }
}

extension UIScrollView {
    func scrollToBottom() {
        layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: true)
    }
}
