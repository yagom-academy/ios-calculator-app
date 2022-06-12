//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    private enum CalculatorConstants {
        static let minus: Character = "-"
        static let maximumDigits = 20
        static let zero = "0"
        static let dot = "."
        static let emptyString = ""
        static let nan = "NaN"
        static let error = "Err"
    }
    
    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    @IBOutlet private weak var receivedInputsScrollView: UIScrollView!
    @IBOutlet private weak var receivedInputsStackView: UIStackView!
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = CalculatorConstants.maximumDigits
        formatter.roundingMode = .halfUp
        return formatter
    }()
    
    private var currentNumber: String = CalculatorConstants.zero
    private var currentOperator: String = CalculatorConstants.emptyString
    private var snippets: [(`operator`: String, operand: String)] = []
    private var firstDecimalPointInCurrentNumber = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshNumberLabel()
        refreshOperatorLabel()
    }
}

// MARK: - UI 갱신을 위한 메서드
extension CalculatorViewController {
    private func refreshNumberLabel() {
        let newNumber = Double(currentNumber)
        var newNumberData = numberFormatter.string(for: newNumber) ?? CalculatorConstants.zero
        
        if currentNumber.hasSuffix(CalculatorConstants.dot) {
            newNumberData += CalculatorConstants.dot
        }
        
        DispatchQueue.main.async {
            self.currentNumberLabel.text = newNumberData
        }
    }
    
    private func refreshOperatorLabel() {
        DispatchQueue.main.async {
            self.currentOperatorLabel.text = self.currentOperator
        }
    }
    
    private func insertIndividualStackView(with operatorData: String, and operandData: String) {
        let operatorLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.text = operatorData
            return label
        }()
        let operandLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.text = operandData
            return label
        }()
        
        let individualStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.addArrangedSubview(operatorLabel)
            stackView.addArrangedSubview(operandLabel)
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.spacing = 8
            return stackView
        }()
        
        DispatchQueue.main.async {
            self.receivedInputsStackView.addArrangedSubview(individualStackView)
        }
    }
    
    private func clearStackView() {
        DispatchQueue.main.async {
            self.receivedInputsStackView.subviews.forEach {
                $0.removeFromSuperview()
            }
        }
    }
}

// MARK: - 내부 동작을 위한 메서드
extension CalculatorViewController {
    private func isNotNaNOrErr(_ currentNumber: String) -> Bool {
        return (currentNumber != CalculatorConstants.nan
                && currentNumber != CalculatorConstants.error)
    }
    
    private func hasResult() -> Bool {
        return (snippets.isEmpty
                && currentOperator.isEmpty
                && currentNumberLabel.text != CalculatorConstants.zero
                && receivedInputsStackView.arrangedSubviews.isNotEmpty)
    }
}

// MARK: - 각 버튼을 눌렀을 때의 동작을 위한 메서드
extension CalculatorViewController {
    @IBAction private func pressNumberButton(_ sender: UIButton) {
        if (snippets.isNotEmpty && currentOperator.isEmpty) || hasResult() {
            return
        }
        
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        switch currentNumber {
        case CalculatorConstants.nan,
            CalculatorConstants.error:
            return
        case CalculatorConstants.zero:
            currentNumber = number
        default:
            currentNumber += number
        }
        
        refreshNumberLabel()
    }
    
    @IBAction func pressDotButton(_ sender: UIButton) {
        guard firstDecimalPointInCurrentNumber, !hasResult() else {
            return
        }
        
        currentNumber += CalculatorConstants.dot
        firstDecimalPointInCurrentNumber = false

        refreshNumberLabel()
    }
    
    @IBAction private func pressOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
        
        switch currentNumber {
        case CalculatorConstants.nan,
            CalculatorConstants.error:
            return
        case CalculatorConstants.zero:
            if snippets.isNotEmpty {
                currentOperator = `operator`
            }
        default:
            let operandData = Double(currentNumber)
            let formattedNumber = numberFormatter.string(for: operandData) ?? CalculatorConstants.zero
            snippets.append((currentOperator, currentNumber))
            insertIndividualStackView(with: currentOperator, and: formattedNumber)
            currentOperator = `operator`
            currentNumber = CalculatorConstants.zero
        }
        
        firstDecimalPointInCurrentNumber = true
        refreshNumberLabel()
        refreshOperatorLabel()
        receivedInputsScrollView.scrollDownToBottom()
    }
    
    @IBAction private func pressEqualButton(_ sender: UIButton) {
        guard isNotNaNOrErr(currentNumber),
              currentOperator.isNotEmpty else {
            return
        }
        
        let operatorNow = currentOperator
        let operandData = Double(currentNumber)
        let operandNow = numberFormatter.string(for: operandData) ?? CalculatorConstants.zero
        snippets.append((operatorNow, currentNumber))
        insertIndividualStackView(with: currentOperator, and: operandNow)
        
        var totalString = CalculatorConstants.emptyString
        snippets.forEach {
            totalString += $0.`operator`
            totalString += $0.operand
        }
        
        let formula = ExpressionParser.parse(from: totalString)
        
        do {
            let result = try formula.result()
            currentNumber = String(result)
        } catch CalculatorError.dividedByZero {
            currentNumber = CalculatorConstants.nan
        } catch {
            currentNumber = CalculatorConstants.error
        }
        currentOperator = CalculatorConstants.emptyString
        
        snippets.removeAll()
        firstDecimalPointInCurrentNumber = true
        refreshNumberLabel()
        refreshOperatorLabel()
        receivedInputsScrollView.scrollDownToBottom()
    }
    
    @IBAction private func pressCEButton(_ sender: UIButton) {
        guard isNotNaNOrErr(currentNumber) else {
            return
        }
        
        currentNumber = CalculatorConstants.zero
        firstDecimalPointInCurrentNumber = true
        refreshNumberLabel()
    }
    
    @IBAction private func pressACButton(_ sender: UIButton) {
        snippets.removeAll()
        currentNumber = CalculatorConstants.zero
        currentOperator = CalculatorConstants.emptyString
        
        firstDecimalPointInCurrentNumber = true
        refreshNumberLabel()
        refreshOperatorLabel()
        clearStackView()
    }
    
    @IBAction private func pressInvertButton(_ sender: UIButton) {
        guard !hasResult() else {
            return
        }
        
        if currentNumber.first == CalculatorConstants.minus {
            currentNumber.remove(at: currentNumber.startIndex)
        } else {
            currentNumber = String(CalculatorConstants.minus) + currentNumber
        }
        
        refreshNumberLabel()
    }
}

