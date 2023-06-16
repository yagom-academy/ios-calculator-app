//
//  Calculator - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//  last modified by karen, Mary.

import UIKit

final class MainViewController: UIViewController {
    private var expression = String()
    private var operandsValue = String()
    private var operatorValue = String()
    private var isResult = false
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var expressionStackView: UIStackView!
    @IBOutlet weak var expressionScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }

    private func clearAll() {
        clearOperands()
        clearOperator()
        clearExpression()
        clearStackView()
    }
    
    private func clearExpression() {
        expression = Strings.empty
    }
    
    private func clearOperands(labelUpdate: Bool = true) {
        operandsValue = Strings.empty
        if labelUpdate {
            operandsLabel.text = Strings.zero
        }
    }
    
    private func clearOperator() {
        operatorValue = Strings.empty
        operatorLabel.text = Strings.empty
    }
    
    private func clearStackView() {
        guard expressionStackView.subviews.count > 0 else { return }
        
        expressionStackView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        if isResult { isResult = false }
        if operandsValue.isEmpty == false {
            expression.append(operatorValue + operandsValue)
            insertStackView(with: operatorValue, operandsValue)
        }
        
        updateOperator(to: `operator`)
        clearOperands()
    }
    
    private func insertStackView(with strings: String...) {
        let labels = strings.map { createUILabel(text: $0) }
        let subStackView = createSubStackView(with: labels)
        
        expressionStackView.addArrangedSubview(subStackView)
        expressionScrollView.layoutIfNeeded()
        expressionScrollView.scrollToBottom()
    }
    
    private func updateOperator(to `operator`: String) {
        operatorValue = `operator`
        operatorLabel.text = `operator`
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        if isResult {
            isResult = false
            clearAll()
        }
        guard let selectedNumber = sender.currentTitle else { return }
        if operandsValue.contains(Strings.dot) && selectedNumber == Strings.dot { return }
        
        switch (operandsValue, selectedNumber) {
        case (Strings.zero, Strings.zero),
             (Strings.zero, Strings.doubleZero),
             (Strings.empty, Strings.zero) where expression.isEmpty,
             (Strings.empty, Strings.doubleZero):
            return
        case (Strings.empty, Strings.dot):
             updateOperands(to: Strings.zero + selectedNumber)
        case (Strings.zero, _),
             (Strings.empty, _):
             updateOperands(to: selectedNumber)
        default:
             updateOperands(to: operandsValue + selectedNumber)
        }

        if let formattedNumber = Double(operandsValue)?.changeNumberFormat() {
            operandsLabel.text = formattedNumber
        }
    }
    
    private func updateOperands(to value: String, willUpdateLabel: Bool = true) {
        operandsValue = value
        if willUpdateLabel {
            operandsLabel.text = value
        }
    }
    
    @IBAction private func tapEqualsButton(_ sender: UIButton) {
        do {
            if operandsValue.isEmpty == false {
                expression.append(operatorValue + operandsValue)
                insertStackView(with: operatorValue, operandsValue)
            }
            
            var formula = ExpressionParser.parse(from: expression)
            let result = try formula.result()
            let formattedResult = result.changeNumberFormat() ?? Strings.nan

            clearOperator()
            clearExpression()
            operandsLabel.text = formattedResult
            updateOperands(to: "\(result)", willUpdateLabel: false)
            isResult = true
        } catch {
            operandsLabel.text = Strings.nan
            clearOperands(labelUpdate: false)
        }
    }
    
    @IBAction private func tapAllClearButton(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction private func tapClearEntryButton(_ sender: UIButton) {
        clearOperands()
    }
    
    @IBAction private func tapChangeSignButton(_ sender: UIButton) {
        guard operandsValue.isEmpty == false else { return }
        if operandsValue.hasPrefix(Strings.minus) {
            updateOperands(to: String(operandsValue.dropFirst()))
        } else {
            updateOperands(to: Strings.minus + operandsValue)
        }
    }
}

extension MainViewController {
    private func createUILabel(text: String) -> UILabel {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.text = text
        
        return label
    }
    
    private func createSubStackView(with labels: [UILabel]) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.spacing = 8
        labels.forEach {
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }
}

extension MainViewController {
    private enum Strings {
        static let empty = ""
        static let zero = "0"
        static let dot = "."
        static let doubleZero = "00"
        static let minus = "-"
        static let nan = "NaN"
    }
}
