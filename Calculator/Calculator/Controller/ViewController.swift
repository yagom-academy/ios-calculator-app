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
    private var isNoneNumber: Bool = true
    private var isResult: Bool = false
    private var formulaToSend = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCalculator()
    }
    //MARK: - IBAction
    @IBAction func touchACButton(_ sender: UIButton) {
        initializeCalculator()
    }
    
    @IBAction func touchCEButton(_ sender: UIButton) {
        self.operandLabel.text = "0"
        self.isNoneNumber = true
    }
    
    @IBAction func touchChangeSignButton(_ sender: UIButton) {
        guard let operandText = self.operandLabel.text else { return }
        if operandText == "0" { return }
        if operandText.contains("-") {
            self.operandLabel.text = operandText.replacingOccurrences(of: "-", with: "")
        } else {
            self.operandLabel.text = "-" + operandText
        }
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let operandText = self.operandLabel.text, operandText.count < 20 else { return }
        guard let inputNumber = sender.titleLabel?.text else { return }
        if self.operandLabel.text == "NaN" {
            removeFormula()
        }
        if isResult == true {
            removeFormula()
            self.operandLabel.text = changeNumberFormat(number: inputNumber)
        } else {
            self.operandLabel.text = self.showZeroAfterDot(number: operandText + inputNumber)
        }
        self.isNoneNumber = false
        self.isResult = false
    }
    
    @IBAction func touchDotButton(_ sender: UIButton) {
        guard let operandText = self.operandLabel.text else { return }
        if operandText.contains(".") { return }
        self.operandLabel.text = operandText + "."
    }
    
    @IBAction func touchOperationButton(_ sender: UIButton) {
        guard let inputOperation = sender.titleLabel?.text else { return }
        guard let operandText = self.operandLabel.text else { return }
        guard let operationText = self.operationLabel.text else { return }
        if self.formulaListStackView.subviews.isEmpty && operandText == "0" || operandText == "NaN" { return }
        if isResult == true {
            removeFormula()
            self.isResult = false
        }
        self.operationLabel.text = inputOperation
        if isNoneNumber == true { return }
        addFormula(operation: operationText, operand: operandText)
        self.operandLabel.text = "0"
        self.isNoneNumber = true
    }
    
    @IBAction func touchResultButton(_ sender: UIButton) {
        if self.isResult == true { return }
        if self.formulaListStackView.subviews.isEmpty { return }
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
    private func initializeCalculator() {
        removeFormula()
        self.operandLabel.text = "0"
        self.operationLabel.text = ""
        self.formulaToSend = ""
        self.isNoneNumber = true
    }
    
    private func showZeroAfterDot(number: String) -> String {
        if number.contains(".") && number.last == "0" { return number }
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
        if changedNumber == "-0" { return "0"}
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
        self.listScrollView.scrollToBottom(labelStackView: formulaListStackView)
    }
    
    private func removeFormula() {
        self.formulaListStackView.subviews.forEach({
            $0.removeFromSuperview()})
    }
}

extension UIScrollView {
    func scrollToBottom(labelStackView: UIStackView) {
        layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: true)
    }
}
