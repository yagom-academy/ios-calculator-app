//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var allCalculatStack: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var isCalculated: Bool { !allCalculatStack.isEmpty && operatorLabel.text?.isEmpty == true }
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 20
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetLabelText()
    }
    
    func resetLabelText() {
        operandLabel.text = .zero
        operatorLabel.text = .empty
    }
}

// MARK: - IBAction
private extension ViewController {
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if isCalculated {
            allCalculatStack.clearSubViews()
            
            operandLabel.text = ""
        }
        
        guard let operandText = operandLabel.text, removedComma(operandText).count < 20 else { return }
        guard let inputValue = sender.currentTitle else { return }
        
        updateOperandLabel(inputValue)
    }
        
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if (operandLabel.text?.contains(String.dot) == true) { return }
        
        guard let inputValue = sender.currentTitle else { return }
        
        updateOperandLabel(inputValue)
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        operandLabel.text = .zero
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let operandText = operandLabel.text, CalauletorError(rawValue: operandText) == nil else { return }
        
        if  operandLabel.text == .zero && allCalculatStack.isEmpty {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        addStackView()
        
        operatorLabel.text = sender.currentTitle
        operandLabel.text = .zero
        
        scrollToBottom()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        allCalculatStack.clearSubViews()
        
        resetLabelText()
    }
    
    @IBAction func touchUpChangeSign(_ sender: UIButton) {
        if  operandLabel.text == .zero { return }
        
        guard let operandText = operandLabel.text else { return }
        
        let nonCommaOperandText = removedComma(operandText)
        
        guard let number = Double(nonCommaOperandText) else { return }
        
        operandLabel.text = numberFormatter.string(from: (number * -1) as NSNumber)
    }
    
    @IBAction func touchUpCalculationButton() {
        if operatorLabel.text == .empty { return }
        
        addStackView()
        scrollToBottom()
        
        let formula = makeFormula()
        
        do {
            operandLabel.text = try numberFormatter.string(for: ExpressionParser.parse(from: formula).result())
        } catch {
            operandLabel.text = (error as? CalauletorError)?.rawValue
        }
        
        operatorLabel.text = .empty
    }
}

// MARK: - Method
private extension ViewController {
    
    func removedComma(_ input: String) -> String {
        input.replacingOccurrences(of: ",", with: "")
    }
    
    func updateOperandLabel(_ text: String) {
        if (operandLabel.text?.contains(String.dot) == true) {
            guard let operandText = operandLabel.text else { return }
            
            operandLabel.text = operandText + text
        } else {
            guard let operandText = operandLabel.text else { return }
            let nonCommaOperandText = removedComma(operandText + text)
            guard let number = numberFormatter.number(from: nonCommaOperandText) else { return }
            
            operandLabel.text = numberFormatter.string(from: number)
        }
    }
    
    func makeLabel(labelText: String?) -> UILabel {
        let operandLabel = UILabel()
        
        operandLabel.text = labelText
        operandLabel.textColor = .white
        operandLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return operandLabel
    }
    
    func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.spacing = 8
        
        return stackView
    }
    
    func addStackView() {
        let calculationStackView: UIStackView = makeStackView()
        
        [makeLabel(labelText: operatorLabel.text),
         makeLabel(labelText: operandLabel.text)].forEach { calculationStackView.addArrangedSubview($0) }
        
        allCalculatStack.addArrangedSubview(calculationStackView)
    }
    
    func makeFormula() -> String {
        var formula = ""
        
        allCalculatStack.arrangedSubviews.forEach {
            let subStackView = $0 as? UIStackView
            let operatorLabel = subStackView?.arrangedSubviews.first as? UILabel
            let operandLabel = subStackView?.arrangedSubviews.last as? UILabel
            
            if operatorLabel?.text?.isEmpty == false {
                guard let operatorText = operatorLabel?.text else { return }
                formula += " \(operatorText) "
            } else {
                formula = .empty
            }
            
            guard let operandText = operandLabel?.text else { return }
            
            formula += removedComma(operandText)
        }
        
        return formula
    }
}

// MARK: - ScrollView Method
private extension ViewController {
    
    func scrollToBottom() {
        scrollView.layoutIfNeeded()
        
        let positionValue = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
        
        if (positionValue.y > 0) {
            scrollView.setContentOffset(positionValue, animated: true)
        }
    }
}

// MARK: - UIStackView Method
private extension UIStackView {
    
    var isEmpty: Bool { self.arrangedSubviews.isEmpty }
    
    func clearSubViews() {
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}

