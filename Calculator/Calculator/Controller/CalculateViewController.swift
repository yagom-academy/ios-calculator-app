//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculateViewController: UIViewController {
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var currentFormulaStackView: UIStackView!
    @IBOutlet weak var currentFormulaScrollView: UIScrollView!
    
    private var calculatorManager = CalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeOperandLabel()
        initializeOperatorLabel()
    }
    
    //MARK: - IBAction
    
    @IBAction func tappedOperandsButton(_ sender: UIButton) {
        guard let number = sender.currentTitle,
              let operandLabelText = currentOperandLabel.text,
              let labelText = calculatorManager.verifyButton(for: number, currentLabel: operandLabelText) else {
            return
        }
        
        currentOperandLabel.text = labelText
    }
    
    @IBAction func tappedDotButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              let labelText = calculatorManager.verifyButton(for: ".", currentLabel: operandLabelText) else {
            return
        }
        
        currentOperandLabel.text = labelText
    }
    
    @IBAction func tappedZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              let number = sender.currentTitle,
              let labelText = calculatorManager.verifyButton(for: number, currentLabel: operandLabelText) else {
            return
        }
        
        currentOperandLabel.text = labelText
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              let operatorText = sender.currentTitle,
              let labelText = calculatorManager.verifyActionButton(for: operatorText, currentLabel: operandLabelText) else {
            currentOperatorLabel.text = sender.currentTitle
            return
        }
        
        addCurrentFormulaOnView()
        initializeOperandLabel()
        currentOperatorLabel.text = labelText
    }
    
    @IBAction func tappedResultButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
                let labelText = calculatorManager.verifyActionButton(for: "result", currentLabel: operandLabelText) else {
            return
        }
        
        addCurrentFormulaOnView()
        initializeOperatorLabel()
        currentOperandLabel.text = labelText
    }
    
    @IBAction func tappedChangeSignButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              let labelText = calculatorManager.verifyActionButton(for: "sign", currentLabel: operandLabelText) else {
            return
        }

        currentOperandLabel.text = labelText
    }
    
    @IBAction func tappedClearButton(_ sender: UIButton) {
        calculatorManager.clearEntryButton()
        initializeOperandLabel()
    }
    
    @IBAction func tappedAllClearButton(_ sender: UIButton) {
        currentFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        calculatorManager.allClearButton()
        initializeOperandLabel()
        initializeOperatorLabel()
    }
    
    // MARK: - Methods
    
    private func initializeOperandLabel() {
        currentOperandLabel.text = "0"
    }
    
    private func initializeOperatorLabel() {
        currentOperatorLabel.text = ""
    }
    
    private func addCurrentFormulaOnView() {
        guard let operatorLabelText = currentOperatorLabel.text,
              let operandLabelText = currentOperandLabel.text else {
            return
        }
        
        setCurrentFormulaViewOnScroll(operatorLabelText, FormManager.transformResult(from: operandLabelText))
    }
}

extension CalculateViewController {
    private func makeCurrentFormulaLabelStackView(_ `operator`: String, _ operand: String) -> UIStackView {
        let operatorLabel = UILabel(text: `operator`)
        let operandLabel = UILabel(text: operand)
        return UIStackView(firstLabel: operatorLabel, secondLabel: operandLabel)
    }
    
    private func setCurrentFormulaViewOnScroll(_ `operator`: String, _ operand: String) {
        currentFormulaStackView.addArrangedSubview(makeCurrentFormulaLabelStackView(`operator`, operand))
        
        currentFormulaScrollView.layoutIfNeeded()
        currentFormulaScrollView.setContentOffset(CGPoint(x: 0, y: currentFormulaScrollView.contentSize.height - currentFormulaScrollView.bounds.height), animated: true)
    }
}
