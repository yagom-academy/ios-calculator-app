//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
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
    // MARK: - Method
    
    func updateOperandLabel(_ button: UIButton) {
        guard let text = operandLabel.text, let inputText = button.currentTitle else { return }
        
        operandLabel.text = text + inputText
    }
    
    func makeOperandLabel(labelText: String) -> UILabel {
        let operandLabel = UILabel()
        
        operandLabel.text = labelText
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandLabel.text = "0"
        operatorLabel.text = ""
    }


}

