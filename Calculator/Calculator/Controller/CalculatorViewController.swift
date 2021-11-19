//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    //MARK: - @IBOutlet Properties
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var calculationHistoryStackView: UIStackView!
    @IBOutlet weak var calculationHistoryScrollView: UIScrollView!
    //MARK: - Properties
    private var isPositiveOperand = true
    private var currentOperand = ""
    private var currentOperator = ""
    private var historyStack: [String] = []
    private var isZero: Bool {
        return currentOperand == "0"
    }
    private var isNotZero: Bool {
        return currentOperand != "0"
    }
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        removeFormulaStackViews()
        resetCurrentOperand()
    }
    //MARK: - @IBAction Properties
    @IBAction func touchUpDigitButton(_ sender: UIButton) {
        guard let numberPressedString = sender.accessibilityIdentifier else {
            return
        }
        if isZero && numberPressedString != "." {
            currentOperand = ""
        }
        currentOperand += numberPressedString
        update(label: currentOperandLabel, to: currentOperand)
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let operatorPressedString = sender.accessibilityIdentifier,
              isNotZero else {
            return
        }
        refreshCalculateHistory()
        currentOperator = operatorPressedString
        update(label: currentOperatorLabel, to: currentOperator)
        resetCurrentOperand()
        autoScrollToBottom()
    }
    
    @IBAction func touchUpCalculateButton(_ sender: Any) {
        refreshCalculateHistory()
        guard let currentOperand = calculateResult(from: historyStack) else {
            return
        }
        historyStack.removeAll()
        currentOperator = ""
        removeFormulaStackViews()
        update(label: currentOperandLabel, to: currentOperand)
        update(label: currentOperatorLabel, to: currentOperator)
    }
    
    @IBAction func touchUpACButton(_ sender: Any) {
        removeFormulaStackViews()
        resetCurrentOperand()
        historyStack.removeAll()
    }
    
    @IBAction func touchUpCEButton(_ sender: Any) {
        resetCurrentOperand()
    }
    
    @IBAction func touchUpSignButton(_ sender: Any) {
        guard isNotZero else {
            return
        }
        isPositiveOperand.toggle()
        toggleSignOfOperand()
    }
}

extension CalculatorViewController {
    // MARK: - Functions
    private func removeFormulaStackViews() {
        calculationHistoryStackView.arrangedSubviews
            .forEach { placeHolderView in
                placeHolderView.removeFromSuperview()
            }
    }
    
    private func resetCurrentOperand() {
        currentOperand = "0"
        currentOperandLabel.text = "0"
    }
    
    private func update(label: UILabel, to data: String) {
        label.text = data
    }
    
    private func refreshCalculateHistory() {
        updateHistoryStackView(with: currentOperator, and: currentOperand)
        historyStack.append(contentsOf: [currentOperator, currentOperand])
    }
    
    private func updateHistoryStackView(with currentOperator: String, and currentOperand: String) {
        let formulaStackView = createFormulaStackView(with: currentOperator, and: currentOperand)
        add(formulaStackView, to: calculationHistoryStackView)
    }
    
    private func add(_ formulaStackView: UIStackView, to historyStackView: UIStackView) {
        historyStackView.addArrangedSubview(formulaStackView)
    }
    
    private func toggleSignOfOperand() {
        if isPositiveOperand {
            currentOperand = currentOperand.filter { $0.isNumber }
        } else {
            currentOperand = "-" + currentOperand
        }
        update(label: currentOperandLabel, to: currentOperand)
    }
    
    private func autoScrollToBottom() {
        calculationHistoryScrollView.layoutIfNeeded()
        let contentSizeHeight = calculationHistoryScrollView.contentSize.height
        let boundsHeight = calculationHistoryScrollView.bounds.height
        let contentInsetBottom = calculationHistoryScrollView.contentInset.bottom
        let bottomOffset = CGPoint(x: 0, y: contentSizeHeight - boundsHeight + contentInsetBottom)
        
        if bottomOffset.y > 0 {
            calculationHistoryScrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    private func createFormulaStackView(with currentOperator: String, and currentOperand: String) -> UIStackView {
        let formulaStackView = createStackView()
        let operandLabel = createLabel(with: currentOperand)
        if calculationHistoryStackView.arrangedSubviews.isEmpty {
            formulaStackView.addArrangedSubview(operandLabel)
            return formulaStackView
        }
        let operatorLabel = createLabel(with: currentOperator)
        formulaStackView.addArrangedSubview(operatorLabel)
        formulaStackView.addArrangedSubview(operandLabel)
        return formulaStackView
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func createLabel(with item: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = item
        label.textColor = .white
        label.adjustsFontForContentSizeCategory = true
        return label
    }
    
    private func calculateResult(from historyStack: [String]) -> String? {
        let equationString = historyStack.filter { $0 != "" }.joined()
        var formula = ExpressionParser.parse(from: equationString)
        let rawResult = formula.result()
        guard let result = rawResult.presentingFormat else {
            return nil
        }
        return result
    }
}
