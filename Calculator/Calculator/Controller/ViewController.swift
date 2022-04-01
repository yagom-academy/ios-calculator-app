//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
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
            self.operandLabel.text = operandsText.removeString(target: minusSign)
        } else {
            self.operandLabel.text = minusSign + operandsText
        }
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text else {
            return
        }
        guard let operandsText = self.operandLabel.text, operandsText.removeString(target: ",").count < 15 else {
            return
        }
        if isResult == true {
            removeFormulaList()
            self.operandLabel.text = inputNumber
        } else {
            self.operandLabel.text = self.changeNumberFormat(number: operandsText + inputNumber)
            showNumberString(inputNumber: inputNumber, operandsText: operandsText)
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
        self.isResult = true
        self.isInputZero = true
    }
    
    func getResult() -> String {
        let a = sendFormula()
        var resultFormula = ExpressionParser.parse(frome: a)
    private func showNumberString(inputNumber: String, operandsText: String) {
        if inputNumber == stringZero && operandsText.contains(stringDot) {
            self.operandLabel.text = operandsText + inputNumber
        } else {
            self.operandLabel.text = self.changeNumberFormat(number: operandsText + inputNumber)
        }
    }
        let result = resultFormula.result()
        switch result {
        case .success(var number):
            number = number == -0 ? 0 : number
            let stringResult = changeNumberFormat(number: String(number))
            return stringResult
        case .failure(let error):
            return error.errorDescription
        }
    }
    
    private func resetCaculator() {
        removeFormulaList()
        self.operatorLabel.text = ""
        self.operandLabel.text = stringZero
        self.isInputZero = false
    }
    
    private func changeNumberFormat(number: String) -> String {
        let number = number.changeToDouble()
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = -2
        guard let changedNumber = numberFormatter.string(from: number as NSNumber) else {
            return ""
        }
        return changedNumber
    }
    
    private func addFormula(`operator`: String, operand: String) {
        addFormulaListStackView(operator: `operator`, operand: operand)
    }
    
    private func sendFormula() -> String {
        var formula: String = ""
        self.formulaListStackView.arrangedSubviews.forEach({a in
            let operatorLabel = a.subviews[0] as? UILabel
            let operandLabel = a.subviews[1] as? UILabel
            formula = "\(formula) \(operatorLabel?.text ?? "") \(operandLabel?.text ?? "")"
        })
        
        return formula
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
    
    private func removeFormulaList() {
        self.formulaListStackView.arrangedSubviews.forEach{
            $0.removeFromSuperview()
        }
    }
}

extension UIScrollView {
    func scrollToBottom() {
        layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: true)
    }
}
