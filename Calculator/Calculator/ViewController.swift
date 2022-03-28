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
    private var enteredResultValue = ""
    
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
        if enteredResultValue == "" {
            appendFormulaValueToScrollView(enteredValue, operatorsValue: "")
        } else {
            appendFormulaValueToScrollView(enteredValue, operatorsValue: inputOperatorValue)
        }
        enteredResultValue += enteredValue+inputOperatorValue
        inputOperatorLabel.text = inputOperatorValue
        inputFormulaLabel.text = "0"
    }
    
    private func appendFormulaValueToScrollView(_ operandsValue: String, operatorsValue: String) {
        let operandsValueLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.white
            label.font = .preferredFont(forTextStyle: .title3)
            label.text = operandsValue
            return label
        }()
        
        let operatorValueLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.white
            label.text = operatorsValue
            return label
        }()
        
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [operatorValueLabel, operandsValueLabel])
            return stackView
        }()
        formulaStackView.addArrangedSubview(stackView)
        enteredFormulaValueScrollView.addSubview(formulaStackView)
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
    
    @IBAction private func startCalculationBtn(_ sender: Any) throws {
        guard let inputValue = inputFormulaLabel.text else { return }
        enteredResultValue += inputValue
        do {
            let result = try ExpressionParser.parse(from: enteredResultValue).result()
            inputFormulaLabel.text = String(Int(result))
        } catch CalculateError.isNaN(.nan) {
            inputFormulaLabel.text = CalculateError.isNaN(.nan).errorDescription
        } catch CalculateError.cannotCalculation {
            print(CalculateError.cannotCalculation.errorDescription as Any)
        } catch CalculateError.operandIsNil {
            print(CalculateError.operandIsNil.errorDescription as Any)
        } catch CalculateError.operatorIsNil {
            print(CalculateError.operatorIsNil.errorDescription as Any)
        }
    }
}
