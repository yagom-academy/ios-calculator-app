//  Calculator - ViewController.swift
//  Created by quokka

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
    private var firstOperatorValue = ""
    private var storeFormulaValue = ""
    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetInputFormulaLabel()
        resetOperatorLabel()
        removeOperatorLabelTextAtInputValueIsZero()
    }
    
    @IBAction private func touchUpOperandBtns(_ sender: UIButton) {
        if inputFormulaLabel.text == "0" { inputOperatorLabel.text = "" }
        guard let inputOperandValue = operandBtns[sender.tag].titleLabel?.text,
              let inputFormulaText = inputFormulaLabel.text else { return }
        let resultValue = inputFormulaText+inputOperandValue
        inputFormulaLabel.text = convertDecimalValue(resultValue)
    }
    
    @IBAction private func touchUpOperatorBtns(_ sender: UIButton) {
        guard let inputOperatorValue = operatorBtns[sender.tag].titleLabel?.text,
              let inputFormulaText = inputFormulaLabel.text else { return }
        
        if inputFormulaLabel.text == "0" {
            inputOperatorLabel.text = inputOperatorValue; return
        }
        
        appendToScrollViewAfterCheckEnteredResultValueIsNone(inputFormulaText, inputOperatorValue)
        storeFormulaValue += (inputFormulaText+inputOperatorValue)
        inputOperatorLabel.text = inputOperatorValue
        resetInputFormulaLabel()
    }
    
    private func resetInputFormulaLabel() {
        inputFormulaLabel.text = ""
    }
    
    private func appendToScrollViewAfterCheckEnteredResultValueIsNone(_ inputFormulaText: String,_ operatorValue: String) {
        if storeFormulaValue == "" {
            firstOperatorValue += operatorValue
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
        if inputOperatorLabel.text == "" {
           setInputFormulaTextIsZero()
       } else if let inputFormulaText = inputFormulaLabel.text,
           let inputFormulaLastValue = inputFormulaText.last,
           let _ = Int(inputFormulaLastValue.description) {
            inputFormulaLabel.text?.removeLast()
        } else if inputOperatorLabel.text?.isEmpty == false,
                  inputOperatorLabel.text?.isEmpty == false {
        }
    }
    
    @IBAction private func touchUpAllClear() {
        inputFormulaLabel.text?.removeAll()
        inputOperatorLabel.text?.removeAll()
        resetInputFormulaLabel()
        removeAllStackView()
        setInputFormulaTextIsZero()
    }
    
    private func setInputFormulaTextIsZero() {
        inputFormulaLabel.text = "0"
    }
    
    private func removeAllStackView() {
        formulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
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
    
    private func resetStoreFormulaValue() {
        storeFormulaValue = ""
    }
    
    private func resetOperatorLabel() {
        inputOperatorLabel.text = ""
    }
    
    @IBAction private func startCalculationBtn(_ sender: UIButton) {
        if inputOperatorLabel.text == "" { return }
        guard let inputFormulaText = inputFormulaLabel.text else { return }
        storeFormulaValue += inputFormulaText
        do {
            let result = try ExpressionParser.parse(from: storeFormulaValue).result()
            inputFormulaLabel.text = String(Int(result))
        } catch CalculateError.isNaN {
            inputFormulaLabel.text = CalculateError.isNaN.errorDescription
        } catch {
            print(error)
        }
        resetStoreFormulaValue()
        resetOperatorLabel()
        makeFormula()
    }
    
    func makeFormula() {
        var formula = ""
        formulaStackView.arrangedSubviews.forEach {
            guard let subStackView = $0 as? UIStackView,
                  let operatorLabel = subStackView.arrangedSubviews.first as? UILabel,
                  let operandLabel = subStackView.arrangedSubviews.last as? UILabel else { return }
            
            guard let operandText = operandLabel.text,
                  let operatorText = operatorLabel.text else { return }
            if operatorLabel.text?.isEmpty == true {
                formula += operandText
                formula += firstOperatorValue
            } else {
                formula += operandText
                formula += operatorText
            }
        }
    }
}
