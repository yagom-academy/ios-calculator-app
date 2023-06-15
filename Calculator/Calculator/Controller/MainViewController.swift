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
        initializeAll()
    }

    private func initializeAll() {
        initializeOperands()
        initializeOperator()
        initializeExpression()
        initializeStackView()
    }
    
    private func initializeExpression() {
        expression = Strings.empty
    }
    
    private func initializeOperands(labelUpdate: Bool = true) {
        operandsValue = Strings.empty
        if labelUpdate {
            operandsLabel.text = Strings.zero
        }
    }
    
    private func initializeOperator() {
        operatorValue = Strings.empty
        operatorLabel.text = Strings.empty
    }
    
    private func initializeStackView() {
        guard expressionStackView.subviews.count > 0 else { return }
        
        expressionStackView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
    
    @IBAction private func hitOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        if isResult { isResult = false }
        if operandsValue.isEmpty == false {
            expression.append(operatorValue + operandsValue)
            insertStackView(with: operatorValue, operandsValue)
        }
        
        updateOperator(to: `operator`)
        initializeOperands()
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
    
    @IBAction private func hitNumberButton(_ sender: UIButton) {
        if isResult {
            isResult = false
            initializeAll()
        }
        guard let number = sender.currentTitle else { return }
        if operandsValue.contains(Strings.point) && number == Strings.point { return }
        
        switch (operandsValue, number) {
        case (Strings.zero, Strings.zero),
             (Strings.zero, Strings.doubleZero),
             (Strings.empty, Strings.zero) where expression.isEmpty,
             (Strings.empty, Strings.doubleZero):
            return
        case (Strings.empty, Strings.point):
             updateOperands(to: Strings.zero + number)
        case (Strings.zero, _),
             (Strings.empty, _):
             updateOperands(to: number)
        default:
             updateOperands(to: operandsValue + number)
        }

        if let formattedNumber = Double(operandsValue)?.changeNumberFormat() {
            operandsLabel.text = formattedNumber
        }
    }
    
    private func updateOperands(to value: String, labelUpdate: Bool = true) {
        operandsValue = value
        if labelUpdate {
            operandsLabel.text = value
        }
    }
    
    @IBAction private func hitEqualsButton(_ sender: UIButton) {
        do {
            if operandsValue.isEmpty == false {
                expression.append(operatorValue + operandsValue)
                insertStackView(with: operatorValue, operandsValue)
            }
            
            var formula = ExpressionParser.parse(from: expression)
            let result = try formula.result()
            let formattedResult = result.changeNumberFormat() ?? Strings.nan

            initializeOperator()
            initializeExpression()
            operandsLabel.text = formattedResult
            updateOperands(to: "\(result)", labelUpdate: false)
            isResult = true
        } catch {
            operandsLabel.text = Strings.nan
            initializeOperands(labelUpdate: false)
        }
    }
    
    @IBAction private func hitAllClearButton(_ sender: UIButton) {
        initializeAll()
    }
    
    @IBAction private func hitClearEntryButton(_ sender: UIButton) {
        initializeOperands()
    }
    
    @IBAction private func hitChangeSignButton(_ sender: UIButton) {
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
        static let point = "."
        static let doubleZero = "00"
        static let minus = "-"
        static let nan = "NaN"
    }
}
