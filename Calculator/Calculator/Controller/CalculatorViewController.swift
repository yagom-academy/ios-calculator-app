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
        guard let value = sender.currentTitle, inputNumberLabel.text != CalculatorNameSpace.nan  else { return }
        
        if calculationRecord == [] {
            inputOperatorLabel.text = ""
        }
        
        if inputNumberLabel.text == CalculatorNameSpace.zero {
            guard value != CalculatorNameSpace.doubleZero else { return }
            
            if value == CalculatorNameSpace.dot {
                inputNumberLabel.text?.append(value)
                return
            }
            
            inputNumberLabel.text = value
            return
        }
        
        if inputNumberLabel.text?.contains(CalculatorNameSpace.dot) == true, value == CalculatorNameSpace.dot { return }
        
        inputNumberLabel.text?.append(value)
        
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
            inputNumberLabel.text = numberFomatter(try parse.result())
            calculationRecord = []
            isCalculated = true
        } catch {
            resetInputOperator()
            inputNumberLabel.text = CalculatorNameSpace.nan
            isCalculated = true
        }
    }
}

extension CalculatorViewController {
    private func calculatorSetup() {
        resetInputNumber()
        resetInputOperator()
        resetCalculationRecord()
        enterdFormulaStackView.removeSubViewAll()
    }
    
    private func resetInputNumber() {
        inputNumberLabel.text = CalculatorNameSpace.zero
    }
    
    private func resetInputOperator() {
        inputOperatorLabel.text = ""
    }
    
    private func resetCalculationRecord() {
        calculationRecord = []
    }
    
    private func addSubStackView(){
        let stackView = formulaStackView
        let operandLabel = operandLabel
        let operatorLabel = operatorLabel
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        enterdFormulaStackView.addArrangedSubview(stackView)
        scrollViewScrollToBottom()
    }
    
    private func scrollViewScrollToBottom() {
        formulaScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: formulaScrollView.contentSize.height - formulaScrollView.bounds.size.height)
        formulaScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func addCalculationRecord(_ operatorAndOperands: [String?]) {
        operatorAndOperands.forEach {
            calculationRecord.append($0?.components(separatedBy: [","]).joined())
        }
    }
    
    private func numberFomatter(_ number: Double) -> String? {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        return numberFormatter.string(for: number)
    }
    
}
