//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var inputNumberLabel: UILabel!
    @IBOutlet private weak var inputOperatorLabel: UILabel!
    @IBOutlet private weak var historyInputOperatorLabel: UILabel!
    @IBOutlet private weak var historyInputNumberLabel: UILabel!
    @IBOutlet private weak var historyInputStackView: UIStackView!
    @IBOutlet private weak var historyInputScrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    private var formula = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    private var calculationFormula: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
    }
    
    private func autoSlideScrollView() {
        historyInputScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(
            x: 0,
            y: historyInputScrollView.contentSize.height
            - historyInputScrollView.bounds.size.height
            + historyInputScrollView.contentInset.bottom
        )
        historyInputScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func makeHistoryStackView(operatorLabel: UILabel, operandLabel: UILabel) -> UIStackView {
        var stackView: UIStackView {
            let stackView = UIStackView()
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = 8
            stackView.addArrangedSubview(operatorLabel)
            stackView.addArrangedSubview(operandLabel)
            return stackView
        }
        return stackView
    }
    
    private func addStackView(_ numberWithOutComma: String) {
        guard let operatorText = inputOperatorLabel.text,
              let operandValue = Double(numberWithOutComma),
              let doubleValue = numberFormatter.string(for: operandValue) else {
            return
        }
        
        let operatorLabel = makeHistoryInputLabel(inputText: operatorText)
        let operandLabel = makeHistoryInputLabel(inputText: doubleValue)
        let stackView = makeHistoryStackView(operatorLabel: operatorLabel, operandLabel: operandLabel)
        historyInputStackView.addArrangedSubview(stackView)
        autoSlideScrollView()
    }
    
    private func makeHistoryInputLabel(inputText: String) -> UILabel {
        var inputLabel: UILabel {
            let inputLabel = UILabel()
            
            inputLabel.text = inputText
            inputLabel.textColor = UIColor.white
            inputLabel.translatesAutoresizingMaskIntoConstraints = false
            return inputLabel
        }
        return inputLabel
    }
    
    private func deleteAllHistory() {
        calculationFormula = ""
        inputOperatorLabel.text = ""
        inputNumberLabel.text = Literal.numberZero.value
        
        for view in historyInputStackView.subviews {
            view.removeFromSuperview()
        }
    }
    
    private func addZero(inputText: String, zero: String) {
        let numberWithOutComma = inputText.replacingOccurrences(of: Literal.comma.value, with: "")
        let pointCount = numberWithOutComma.filter { $0 == Character(Literal.point.value) }.count
        let isTwoInsertable: (Bool, Bool) = (
            numberWithOutComma == Literal.numberZero.value,
            pointCount == Int(Literal.numberOne.value)
        )
        
        switch isTwoInsertable {
        case (true, _):
            return
        case (false, false):
            if let number: Double = Double(numberWithOutComma + zero) {
                inputNumberLabel.text = numberFormatter.string(for: number)
            }
        case (_, true):
            inputNumberLabel.text = inputText + zero
        default:
            return
        }
    }
    
    private func addPoint(inputText: String, point: Character) {
        if inputText.filter({ $0 == point }).count == 0 {
            inputNumberLabel.text = inputText + String(point)
        }
    }
    
    private func addNumber(inputText: String, number: String) {
        if inputText == Literal.numberZero.value {
            inputNumberLabel.text = number
        } else {
            let numberWithOutComma = inputText.replacingOccurrences(of: Literal.comma.value, with: "")
            if let number: Double = Double(numberWithOutComma + number) {
                inputNumberLabel.text = numberFormatter.string(for: number)
            }
        }
    }
    
    private func invertNumber(inputText: String) {
        guard inputText != Literal.numberZero.value else { return }
        
        if inputText.prefix(1) != Literal.invertSign.value {
            inputNumberLabel.text = Literal.invertSign.value + inputText
        } else {
            inputNumberLabel.text = inputText.replacingOccurrences(of: Literal.invertSign.value, with: "")
        }
    }
    
    private func addOperator(inputText: String, operatorValue: String) {
        let numberWithOutComma = inputText.replacingOccurrences(of: Literal.comma.value, with: "")
        let isInsertable: (Bool, Bool) = (
            numberWithOutComma == Literal.numberZero.value,
            inputOperatorLabel.text == ""
        )
        
        switch isInsertable {
        case (true, true):
            return
        case (true, false):
            inputOperatorLabel.text = operatorValue
            let suffix = calculationFormula.suffix(1)
            let operators = Operator.allCases.map { String($0.rawValue) }
            
            if operators.contains(String(suffix)) {
                calculationFormula.removeLast()
                calculationFormula.removeLast()
            }
            
            calculationFormula += " " + convertOperator(operatorValue)
        default:
            addStackView(numberWithOutComma)
            calculationFormula += " " + numberWithOutComma
            calculationFormula += " " + convertOperator(operatorValue)
            inputNumberLabel.text = Literal.numberZero.value
            inputOperatorLabel.text = operatorValue
        }
    }
    
    private func convertOperator(_ operatorValue: String) -> String {
        switch operatorValue {
        case Literal.multiplication.value:
            return Literal.realMultiplication.value
        case Literal.division.value:
            return Literal.realDivision.value
        default:
            return operatorValue
        }
    }
    
    private func checkOperatorCount() -> Bool {
        let operators = Operator.allCases.map { convertOperator(String($0.rawValue)) }.joined()
        let separators = CharacterSet(charactersIn: operators)
        
        if calculationFormula.components(separatedBy: separators).count <= 1 {
            return false
        }
        return true
    }
    
    private func showResult(inputText: String) {
        guard checkOperatorCount() == true else { return }
        
        let numberWithOutComma = inputText.replacingOccurrences(of: Literal.comma.value, with: "")
        addStackView(numberWithOutComma)
        
        calculationFormula += " " + numberWithOutComma
        calculationFormula.removeFirst()
        formula = ExpressionParser.parse(from: calculationFormula)
        calculationFormula = ""
        
        inputOperatorLabel.text = ""
        if let result = numberFormatter.string(for: formula.result()),
           result != Literal.infinity.value {
            inputNumberLabel.text = result
        } else {
            inputNumberLabel.text = Literal.nan.value
        }
    }
    
    @IBAction private func touchUpCalculatorButton(sender: UIButton) {
        guard let operatorValue = sender.titleLabel?.text,
              let inputText = inputNumberLabel.text else {
            return
        }
        
        switch operatorValue {
        case Literal.ac.value:
            deleteAllHistory()
        case Literal.ce.value:
            inputNumberLabel.text = Literal.numberZero.value
        case Literal.invertSymbol.value:
            invertNumber(inputText: inputText)
        case Literal.result.value:
            showResult(inputText: inputText)
        default:
            addOperator(inputText: inputText, operatorValue: operatorValue)
        }
    }
    
    @IBAction private func touchUpNumberButton(sender: UIButton) {
        guard let number = sender.titleLabel?.text,
              let inputText = inputNumberLabel.text else {
            return
        }
        
        switch number {
        case Literal.numberZero.value, Literal.numberDoubleZero.value:
            addZero(inputText: inputText, zero: number)
        case Literal.point.value:
            addPoint(inputText: inputText, point: Character(number))
        default:
            addNumber(inputText: inputText, number: number)
        }
    }
}
