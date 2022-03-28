//  Calculator - ViewController.swift
//  Created by quokka.

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var inputFormulaLabel: UILabel!
    @IBOutlet private weak var inputOperatorLabel: UILabel!
    @IBOutlet private var operandBtns: [UIButton]!
    @IBOutlet private var operatorBtns: [UIButton]!
    
    @IBOutlet private weak var allClearBtn: UIButton!
    @IBOutlet private weak var clearEntryBtn: UIButton!
    @IBOutlet private weak var plusAndMinusBtn: UIButton!
    @IBOutlet private weak var enteredFormulaValueScrollView: UIScrollView!
    @IBOutlet private weak var formulaStackView: UIStackView!
    private var storeFormulaValue = ""
    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputFormulaLabel.text = "0"
        inputOperatorLabel.text = ""
        removeOperatorLabelTextAtInputValueIsZero()
    }
    
    @IBAction private func touchUpOperandBtns(_ sender: UIButton) {
        if inputFormulaLabel.text == "0" { inputOperatorLabel.text = "" }
        guard let inputOperandValue = operandBtns[sender.tag].titleLabel?.text,
              let enteredValue = inputFormulaLabel.text else { return }
        let resultValue = enteredValue+inputOperandValue
        inputFormulaLabel.text = convertDecimalValue(resultValue)
    }
    
    @IBAction private func touchUpOperatorBtns(_ sender: UIButton) {
        if inputFormulaLabel.text == "0", inputOperatorLabel.text?.isEmpty == false { return }
        
        guard let inputOperatorValue = operatorBtns[sender.tag].titleLabel?.text,
              let enteredValue = inputFormulaLabel.text else { return }
        
        appendToScrollViewAfterCheckEnteredResultValueIsNone(enteredValue, inputOperatorValue)
        storeFormulaValue += enteredValue+inputOperatorValue
        inputOperatorLabel.text = inputOperatorValue
        inputFormulaLabel.text = ""
    }
    
    private func appendToScrollViewAfterCheckEnteredResultValueIsNone(_ inputFormulaText: String,_ operatorValue: String) {
        if storeFormulaValue == "" {
            appendFormulaValueToScrollView(inputFormulaText, operatorsValue: "")
        } else {
            appendFormulaValueToScrollView(inputFormulaText, operatorsValue: operatorValue)
        }
    }
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }
    
    private func makeStack(_ labels: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: labels)
        return stack
    }
    
    private func addStack(_ stack: UIStackView) {
        formulaStackView.addArrangedSubview(stack)
        enteredFormulaValueScrollView.addSubview(formulaStackView)
    }
    
    private func appendFormulaValueToScrollView(_ operandsValue: String, operatorsValue: String) {
        let operandsValueLabel = makeLabel()
        let operatorValueLabel = makeLabel()
        
        operandsValueLabel.text = operandsValue
        operatorValueLabel.text = operatorsValue
        
        let stackView = makeStack([operatorValueLabel, operandsValueLabel])
        addStack(stackView)
    }
    
    private func convertDecimalValue(_ operatorValue: String) -> String? {
        if let operandDoubleValue = Double(operatorValue) {
            return numberFormatter.string(from: operandDoubleValue as NSNumber)
        } else {
            let operandDoubleValue = operatorValue.split(separator: ",").reduce("", +)
            guard let operandDoubleValue = Double(operandDoubleValue) else { return ""}
            return numberFormatter.string(from: operandDoubleValue as NSNumber)
        }
    }
    
    @IBAction private func touchUpEntryClear() {
        if let enteredValue = inputFormulaLabel.text,
           let inputLastValue = enteredValue.last,
           let _ = Int(inputLastValue.description) {
            inputFormulaLabel.text?.removeLast()
        } else if inputOperatorLabel.text?.isEmpty == false {
            inputFormulaLabel.text?.removeLast()
        }
    }
    
    @IBAction private func touchUpAllClear() {
        inputFormulaLabel.text?.removeAll()
        inputOperatorLabel.text?.removeAll()
        inputFormulaLabel.text = "0"
    }
    
    @IBAction private func switchPlusAndMinusToInputOperatorLabel() {
        if inputFormulaLabel.text == "0" { return }
        if let inputFormulaFirstValue = inputFormulaLabel.text?.first,
           let inputFormulaValue = inputFormulaLabel.text,
           let _ = Int(inputFormulaFirstValue.description) {
            inputFormulaLabel.text = "-"+inputFormulaValue
        } else if let inputFormulaFirstValue = inputFormulaLabel.text?.first,
            inputFormulaFirstValue == "-" {
            inputFormulaLabel.text?.removeFirst()
        }
    }
    
    private func removeOperatorLabelTextAtInputValueIsZero() {
        if inputFormulaLabel.text == "0" {
            inputOperatorLabel.text?.removeAll()
        }
    }
    
    @IBAction private func startCalculationBtn(_ sender: UIButton) {
        guard let inputFormulaText = inputFormulaLabel.text else { return }
        storeFormulaValue += inputFormulaText
        do {
            let result = try ExpressionParser.parse(from: storeFormulaValue).result()
            inputFormulaLabel.text = String(Int(result))
        } catch CalculateError.isNaN {
            inputFormulaLabel.text = "NaN"
        } catch {
            print(error)
        }
    }
}
