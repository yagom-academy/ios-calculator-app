//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var enterdFormulaStackView: UIStackView!
    
    private var isCalculated: Bool = false
    private var calculationRecord: [String?] = []
    
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
        setup()
    }
    
    func setup() {
        resetInputNumber()
        resetInputOperator()
        resetStackViewAll()
    }
    
    func resetStackViewAll() {
        enterdFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func resetInputNumber() {
        inputNumberLabel.text = CalculatorNameSpace.zero
    }
    
    func resetInputOperator() {
        inputOperatorLabel.text = ""
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
    
    func numberFomatter(_ str: Double) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        return numberFormatter.string(for: str)
    }
    
    @IBAction func signChangeButtonTapped(_ sender: UIButton) {
        if inputNumberLabel.text?.contains(CalculatorNameSpace.negative) == true {
            inputNumberLabel.text?.removeFirst()
            return
        }
        
        if let value = inputNumberLabel.text, value != "0" {
            inputNumberLabel.text = CalculatorNameSpace.negative + value
            return
        }
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        setup()
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        resetInputNumber()
    }
    
    @IBAction func operandsInputButtonTapped(_ sender: UIButton) {
        guard let value = sender.currentTitle else { return }
        
        if inputNumberLabel.text == "0", value == "0" {
            return
        } else if inputNumberLabel.text == "0", value == "00" {
            return
        } else if inputNumberLabel.text == "0", value == "." {
            inputNumberLabel.text?.append(value)
        } else if inputNumberLabel.text == "0" {
            inputNumberLabel.text = value
        } else if inputNumberLabel.text?.contains(".") == true, value == "."{
            return
        } else {
            inputNumberLabel.text?.append(value)
        }

    }
    
    @IBAction func operatorsInputButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        isCalculated = false
        
        if inputNumberLabel.text == CalculatorNameSpace.zero {
            inputOperatorLabel.text = `operator`
            return
        }
        
        if inputOperatorLabel.text == "" {
            addSubStackView()
            addCalculationRecord([inputNumberLabel.text])
            inputOperatorLabel.text = `operator`
            resetInputNumber()
            return
        }
        
        addSubStackView()
        addCalculationRecord([inputOperatorLabel.text, inputNumberLabel.text])
        
        inputOperatorLabel.text = `operator`
        resetInputNumber()
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        guard !isCalculated else { return }
        addCalculationRecord([inputOperatorLabel.text, inputNumberLabel.text])
        
        var parseData = ExpressionParser.parse(from: calculationRecord.compactMap { $0 }.joined(separator: " "))
        
        do {
            addSubStackView()
            inputNumberLabel.text = numberFomatter(try parseData.result())
            inputOperatorLabel.text = ""
            calculationRecord = []
            isCalculated = true
        } catch {
            inputNumberLabel.text = CalculatorNameSpace.nan
            isCalculated = true
        }
        
    }
}


