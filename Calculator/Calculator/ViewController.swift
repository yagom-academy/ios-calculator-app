//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var allCalculationStack: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 20
        return formatter
    }()
    
    // MARK: - IBAction
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        guard let operandText = operandLabel.text , removeComma(operandText).count < 20 else { return }
        
        if operandLabel.text == "0" { operandLabel.text = "" }
        
        updateOperandLabel(sender)
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        if operandLabel.text == "0" && sender.currentTitle == "00" { return }
        
        updateOperandLabel(sender)
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if (operandLabel.text?.contains(".") == true) && sender.currentTitle == "." { return }
        
        updateDotOperandLabel(sender)
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        if  operandLabel.text == "0" {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        addStackView()
        
        operatorLabel.text = sender.currentTitle
        operandLabel.text = "0"
        
        scrollToBottom()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        allCalculationStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        setUpDefaultLabel()
    }
    
    @IBAction func touchUpChangeSign(_ sender: UIButton) {
        if  operandLabel.text == "0" { return }
        
        guard let operandText = operandLabel.text else { return }
        
        let nonCommaOperandText = removeComma(operandText)
        
        guard let number = Double(nonCommaOperandText) else { return }
        
        operandLabel.text = numberFormatter.string(from: (number * -1) as NSNumber)
    }
    
    @IBAction func touchUpCalculationButton(_ sender: Any) {
        if operatorLabel.text == "" { return }
        
        var arithmeticExpressio = ""
        
        addStackView()
        
        scrollToBottom()
        
        allCalculationStack.arrangedSubviews.forEach {
            let stack = $0 as? UIStackView
            let operatorLabel = stack?.arrangedSubviews[0] as? UILabel
            let operandLabel = stack?.arrangedSubviews[1] as? UILabel
            
            if operatorLabel?.text?.isEmpty == false {
                guard let operatorText = operatorLabel?.text else { return }
                arithmeticExpressio += " \(operatorText) "
            } else {
                arithmeticExpressio = ""
            }
            
            guard let operandText = operandLabel?.text else { return }
            arithmeticExpressio += removeComma(operandText)
        }
        
        do {
            operandLabel.text = try numberFormatter.string(for: ExpressionParser.parse(from: arithmeticExpressio).result())
        } catch {
            operandLabel.text = "NaN"
        }
        
        operatorLabel.text = ""
        
    }
    // MARK: - Method
    
    func removeComma(_ input: String) -> String {
        input.replacingOccurrences(of: ",", with: "")
    }
    
    func updateOperandLabel(_ button: UIButton) {
        guard let operandText = operandLabel.text, let inputText = button.currentTitle else { return }
        
        let nonCommaOperandText = removeComma(operandText + inputText)
        
        guard let number = numberFormatter.number(from: nonCommaOperandText) else { return }
        
        operandLabel.text = numberFormatter.string(from: number)
    }
    
    func updateDotOperandLabel(_ button: UIButton) {
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
    
    func makeCalculationStackView() -> UIStackView {
        let calculationStack = UIStackView()
        
        calculationStack.axis = .horizontal
        calculationStack.alignment = .fill
        calculationStack.distribution = .fill
        calculationStack.spacing = 8
        
        return calculationStack
    }
    
    func setUpDefaultLabel() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    func addStackView() {
        let calculationStackView: UIStackView = makeCalculationStackView()
        
        [makeLabel(labelText: operatorLabel.text),
         makeLabel(labelText: operandLabel.text)].forEach { calculationStackView.addArrangedSubview($0) }
        
        allCalculationStack.addArrangedSubview(calculationStackView)
    }
    
    // MARK: - ScrollView Method
    
    func scrollToBottom() {
        scrollView.layoutIfNeeded()
        
        let positionValue = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
        
        if (positionValue.y > 0) {
            scrollView.setContentOffset(positionValue, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDefaultLabel()
    }
}
