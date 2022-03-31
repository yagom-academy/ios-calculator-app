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
    
    var allCalculatStackIsEmpty: Bool { allCalculatStack.arrangedSubviews.isEmpty }
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 20
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDefaultLabel()
    }
    
    func setUpDefaultLabel() {
        operandLabel.text = .zero
        operatorLabel.text = .empty
    }
}

// MARK: - IBAction
private extension ViewController {
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if !allCalculatStackIsEmpty && (operatorLabel.text?.isEmpty == true) {
            allClearStackView()
            
            operandLabel.text = ""
        }
        
        guard let operandText = operandLabel.text , removeComma(operandText).count < 20 else { return }
                
        if (operandLabel.text?.contains(String.dot) == true) {
            updateOperandLabel(sender)
        } else {
            updateNumberFormat(sender)
        }
    }
        
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if (operandLabel.text?.contains(String.dot) == true) { return }
        
        updateOperandLabel(sender)
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        operandLabel.text = .zero
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let operandText = operandLabel.text, CalauletorError(rawValue: operandText) == nil else { return }
        
        if  operandLabel.text == .zero && allCalculatStackIsEmpty {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        addStackView()
        
        operatorLabel.text = sender.currentTitle
        operandLabel.text = .zero
        
        scrollToBottom()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        allClearStackView()
        
        setUpDefaultLabel()
    }
    
    @IBAction func touchUpChangeSign(_ sender: UIButton) {
        if  operandLabel.text == .zero { return }
        
        guard let operandText = operandLabel.text else { return }
        
        let nonCommaOperandText = removeComma(operandText)
        
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
    
    func removeComma(_ input: String) -> String {
        input.replacingOccurrences(of: ",", with: "")
    }
    
    func updateNumberFormat(_ button: UIButton) {
        guard let operandText = operandLabel.text, let inputText = button.currentTitle else { return }
        
        let nonCommaOperandText = removeComma(operandText + inputText)
        
        guard let number = numberFormatter.number(from: nonCommaOperandText) else { return }
        
        operandLabel.text = numberFormatter.string(from: number)
    }
    
    func updateOperandLabel(_ button: UIButton) {
        guard let operandText = operandLabel.text, let inputText = button.currentTitle else { return }
        
        operandLabel.text = operandText + inputText
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
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }
    
    func addStackView() {
        let calculationStackView: UIStackView = makeStackView()
        
        [makeLabel(labelText: operatorLabel.text),
         makeLabel(labelText: operandLabel.text)].forEach { calculationStackView.addArrangedSubview($0) }
        
        allCalculatStack.addArrangedSubview(calculationStackView)
    }
    
    func allClearStackView() {
        allCalculatStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
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
            
            formula += removeComma(operandText)
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

