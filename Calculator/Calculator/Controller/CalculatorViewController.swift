//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    @IBOutlet weak private var inputNumberLabel: UILabel!
    @IBOutlet weak private var inputOperatorLabel: UILabel!
    @IBOutlet weak private var formulaScrollView: UIScrollView!
    @IBOutlet weak private var enterdFormulaStackView: UIStackView!
    
    private var isCalculated: Bool = false
    private var calculationRecord: [String?] = []
    private let numberFormatter = NumberFormatter()
    
    private var formulaStackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }
    
    private var operandLabel: UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = inputNumberLabel.text
        label.textColor = .white
        label.textAlignment = .right
        return label
    }
    
    private var operatorLabel: UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = inputOperatorLabel.text
        label.textColor = .white
        label.textAlignment = .right
        return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorSetup()
    }
    
    @IBAction private func signChangeButtonTapped(_ sender: UIButton) {
        guard inputNumberLabel.text != CalculatorNameSpace.nan else { return }
        
        if inputNumberLabel.text?.contains(CalculatorNameSpace.negative) == true {
            inputNumberLabel.text?.removeFirst()
            return
        }
        
        if let value = inputNumberLabel.text, value != CalculatorNameSpace.zero {
            inputNumberLabel.text = CalculatorNameSpace.negative + value
            return
        }
    }
    
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        calculatorSetup()
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        if inputNumberLabel.text == CalculatorNameSpace.nan { return }
        
        if isCalculated {
            calculatorSetup()
        } else {
            resetInputNumber()
            resetInputOperator()
        }
    }
    
    @IBAction private func operandsInputButtonTapped(_ sender: UIButton) {
        guard let value = sender.currentTitle,
              var numberLabel = inputNumberLabel.text, numberLabel != CalculatorNameSpace.nan  else { return }
        if calculationRecord == [] {
            inputOperatorLabel.text = ""
        }
    
        switch value {
        case CalculatorNameSpace.dot:
            if numberLabel.contains(".") { return }
            
            if numberLabel == CalculatorNameSpace.zero {
                numberLabel.append(".")
                inputNumberLabel.text = numberLabel
                return
            }
            numberLabel.append(value)
            inputNumberLabel.text = numberLabel
        case CalculatorNameSpace.zero:
            if numberLabel == CalculatorNameSpace.zero { return }
            
            if numberLabel.contains(".") {
                numberLabel.append(value)
                inputNumberLabel.text = numberLabel
                return
            }
            fallthrough
        case CalculatorNameSpace.doubleZero:
            if numberLabel == CalculatorNameSpace.zero { return }
            fallthrough
        default:
            numberLabel.append(value)
            inputNumberLabel.text = numberFomatter(numberLabel.components(separatedBy: ",").joined())
        }
    }
    
    @IBAction private func operatorsInputButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle, inputNumberLabel.text != CalculatorNameSpace.nan else { return }
        
        isCalculated = false
        if inputNumberLabel.text == CalculatorNameSpace.zero {
            inputOperatorLabel.text = `operator`
            return
        }
        
        addSubStackView()
        addCalculationRecord([inputOperatorLabel.text, inputNumberLabel.text])
        resetInputNumber()
        inputOperatorLabel.text = `operator`
    }
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        guard !isCalculated else { return }
        
        addCalculationRecord([inputOperatorLabel.text, inputNumberLabel.text])
        
        var parse = ExpressionParser.parse(from: calculationRecord.compactMap { $0 }.joined(separator: " "))
        
        do {
            addSubStackView()
            resetInputOperator()
            inputNumberLabel.text = numberFomatter("\(try parse.result())")
            calculationRecord = []
            isCalculated = true
        } catch {
            resetInputOperator()
            inputNumberLabel.text = CalculatorNameSpace.nan
            isCalculated = true
        }
    }
}

private extension CalculatorViewController {
    func calculatorSetup() {
        resetInputNumber()
        resetInputOperator()
        resetCalculationRecord()
        enterdFormulaStackView.removeSubViewAll()
    }
    
    func resetInputNumber() {
        inputNumberLabel.text = CalculatorNameSpace.zero
    }
    
    func resetInputOperator() {
        inputOperatorLabel.text = ""
    }
    
    func resetCalculationRecord() {
        calculationRecord = []
    }
    
    func addSubStackView(){
        let stackView = formulaStackView
        let operandLabel = operandLabel
        let operatorLabel = operatorLabel
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        enterdFormulaStackView.addArrangedSubview(stackView)
        scrollViewScrollToBottom()
    }
    
    func scrollViewScrollToBottom() {
        formulaScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: formulaScrollView.contentSize.height - formulaScrollView.bounds.size.height)
        formulaScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    func addCalculationRecord(_ operatorAndOperands: [String?]) {
        operatorAndOperands.forEach {
            calculationRecord.append($0?.components(separatedBy: [","]).joined())
        }
    }
    
    func numberFomatter(_ numberString: String) -> String? {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        guard let number = numberFormatter.number(from: numberString) else { return nil }
        return numberFormatter.string(for: number)
    }
    
}
