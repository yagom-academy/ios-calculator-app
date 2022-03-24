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
    
    private var numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    // MARK: - IBAction
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if operandLabel.text == "0" { operandLabel.text = "" }
        
        updateOperandLabel(sender)
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        if operandLabel.text == "0" && sender.currentTitle == "00" { return }
        
        updateOperandLabel(sender)
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if (operandLabel.text?.contains(".") == true) && sender.currentTitle == "." { return }
        
        updateOperandLabel(sender)
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        if  operandLabel.text == "0" {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        let calculationStackView: UIStackView = makeCalculationStackView()
        
        [makeLabel(labelText: operatorLabel.text),
         makeLabel(labelText: operandLabel.text)].forEach { calculationStackView.addArrangedSubview($0) }
        
        allCalculationStack.addArrangedSubview(calculationStackView)
        
        operatorLabel.text = sender.currentTitle
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        allCalculationStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        setUpDefaultLabel()
    }
    
    @IBAction func touchUpChangeSign(_ sender: UIButton) {
        guard let operandText = operandLabel.text else { return }
        
        let nonCommaOperandText = removeComma(operandText)
        
        guard let number = Double(nonCommaOperandText) else { return }
        
        operandLabel.text = numberFormatter.string(from: (number * -1) as NSNumber)
    }
    
    // MARK: - Method
    
    func updateOperandLabel(_ button: UIButton) {
        guard let text = operandLabel.text, let inputText = button.currentTitle else { return }
        
        operandLabel.text = text + inputText
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDefaultLabel()
    }
}
