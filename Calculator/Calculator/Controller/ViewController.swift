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
        isCalculated = false
    }
    
    func resetStackViewAll() {
        enterdFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func resetInputNumber() {
        inputNumberLabel.text = "0"
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
        operatorAndOperands.forEach { calculationRecord.append($0) }
    }
    
    @IBAction func signChangeButtonTapped(_ sender: UIButton) {
        if inputNumberLabel.text?.contains("-") == true {
            inputNumberLabel.text?.removeFirst()
            return
        }
        
        if let value = inputNumberLabel.text, value != "0" {
            inputNumberLabel.text = "-" + value
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
        // 가독성 너무 문제인데..
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
        
        if inputOperatorLabel.text == ""{
            addSubStackView()
            addCalculationRecord([inputNumberLabel.text])
            resetInputNumber()
            inputOperatorLabel.text = `operator`
            return
        }
        
        if inputNumberLabel.text == "0" {
            inputOperatorLabel.text = `operator`
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
        
        print(calculationRecord.compactMap { $0 }.joined(separator: " "))
    }
}

