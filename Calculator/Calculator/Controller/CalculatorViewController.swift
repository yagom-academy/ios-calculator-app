//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    enum CalculatorValue {
        static let emptyArray: String = ""
        static let zero: String = "0"
        static let zeroDecimal: String = "0.1"
        static let decimalPoint: String = "."
    }

    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var scrollStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var listStackView: UIStackView!
    
    var operandNumber = CalculatorValue.emptyArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        operandLabel.text = CalculatorValue.zero
        operatorLabel.text = CalculatorValue.emptyArray
        scrollStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func numberButtonDidTap(_ sender: UIButton) {
        guard let number = sender.title(for: .normal) else { return }
        
        if operandNumber.count < 20 {
            operandNumber += number
            operandLabel.text = operandNumber
        }
    }
    
    @IBAction private func dotButtonDidTap(_ sender: UIButton) {
        if operandNumber.isEmpty {
            operandNumber = CalculatorValue.zeroDecimal
            operandLabel.text = operandNumber
        } else if operandNumber.last == Character(CalculatorValue.decimalPoint) || operandNumber.count == 20 {
            operandLabel.text = operandNumber
        } else {
            operandNumber += CalculatorValue.decimalPoint
            operandLabel.text = operandNumber
        }
    }
    
    
    @IBAction private func operatorButtonDidTap(_ sender: UIButton) {
        guard let operatorSymbol = sender.title(for: .normal) else { return }
        
        addScrollStackView()
        operandNumber = CalculatorValue.emptyArray
        operandLabel.text = CalculatorValue.zero
        operatorLabel.text = operatorSymbol
    }
    
    private func addListStackView() -> UIStackView {
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        let stackView = UIStackView()
        
        stackView.spacing = 8
        operandLabel.textColor = .white
        operatorLabel.textColor = .white
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.text = self.operatorLabel.text
        operandLabel.text = self.operandLabel.text
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        return stackView
    }
    
    private func addScrollStackView() {
        scrollStackView.addArrangedSubview(addListStackView())
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        formulaScrollView.layoutIfNeeded()
        formulaScrollView.setContentOffset(CGPoint(x: 0, y: formulaScrollView.contentSize.height - formulaScrollView.bounds.height), animated: false)
        }
}

