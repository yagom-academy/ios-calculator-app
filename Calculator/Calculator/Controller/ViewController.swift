//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var formulaToSend = ""
    private let stringZero = "0"
    private let stringDot = "."
    private let minusSign = "-"
    private var isInputZero = false
    private var isResult = false
    
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var listScrollView: UIScrollView!
    @IBOutlet private weak var formulaListStackView: UIStackView!
    
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
        guard let operandsText = self.operandLabel.text, operandsText.replacingOccurrences(of: ",", with: "").count < 15 else {
            return
        }
        if isResult == true {
            removeFormulaList()
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
        if self.formulaListStackView.subviews.isEmpty && operandsText == stringZero || operandsText == "NaN" {
            return
        }
        self.operatorLabel.text = inputOperator
        if isInputZero == false {
            return
        }
        if self.isResult == true {
            removeFormulaList()
            self.isResult = false
        }
        addFormula(operator: operatorText, operand: operandsText)
        self.operandLabel.text = stringZero
        self.isInputZero = false
    }
    
    @IBAction func touchResultButton(_ sender: UIButton) {
        if self.isResult == true {
            return
        }
        if self.formulaListStackView.arrangedSubviews.isEmpty {
            return
        }
        guard let operatorText = self.operatorLabel.text else {
            return
        }
        guard let operandsText = self.operandLabel.text else {
            return
        }
        addFormula(operator: operatorText, operand: operandsText)
        self.operandLabel.text = getResult()
        self.operatorLabel.text = ""
        self.formulaToSend = ""
        self.isResult = true
    }
    
    func getResult() -> String {
        var resultFormula = ExpressionParser.parse(frome: self.formulaToSend)
        let result = resultFormula.result()
        switch result {
        case .success(let number):
            let stringResult = changeNumberFormat(number: String(number))
            return stringResult == "-0" ? "0" : stringResult
        case .failure(let error):
            return error.errorDescription
        }
    }
    
    private func resetCaculator() {
        removeFormulaList()
        self.operatorLabel.text = ""
        self.operandLabel.text = stringZero
        self.formulaToSend = ""
        self.isInputZero = false
    }
    
    private func removeFormulaList() {
        self.formulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func checkZeroAfterDot(number: String) -> String {
        if number.contains(stringDot) && number.last == Character(stringZero) {
            return number
        }
        return changeNumberFormat(number: number)
    }
    
    private func changeToDouble(number: String) -> Double {
        let doubleNumber = Double(number.replacingOccurrences(of: ",", with: "")) ?? 0
        return doubleNumber
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
    
    private func addFormula(`operator`: String, operand: String) {
        self.formulaToSend = "\(self.formulaToSend) \(`operator`) \(String(changeToDouble(number: operand)))"
        addFormulaListStackView(operator: `operator`, operand: operand)
    }
}
// MARK: - About View
extension ViewController {
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
    
    private func addFormulaListStackView(`operator`: String, operand: String) {
        let numberStackView = makeStackView()
        numberStackView.addArrangedSubview(makeLabel(element: `operator`))
        numberStackView.addArrangedSubview(makeLabel(element: operand))
        self.formulaListStackView.addArrangedSubview(numberStackView)
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
