//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    let inputProcessor = InputProcessor()
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var recordStackView: UIStackView!
    @IBOutlet weak var recordScrollView: UIScrollView!
    @IBOutlet weak var equalButton: UIButton!
    
    override func viewDidLoad() {
        self.displayLabel.text = "0"
        self.equalButton.isEnabled = false
        self.recordScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.recordStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        self.displayLabel.text = self.inputProcessor.inputOperand(sender.unwrappedTitle)
    }
    
    @IBAction private func tapDecimalPointButton(_ sender: UIButton) {
        self.displayLabel.text = self.inputProcessor.inputOperand(".")
    }
    
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        self.operatorLabel.text = self.inputProcessor.inputOperator(sender.unwrappedTitle) { `operator`, operand in
            self.displayLabel.text = "0"
            return self.recordOnStack(operater: `operator`, operand: operand)
        }
        self.equalButton.isEnabled = true
    }

    
    @IBAction private func tapEqualButton(_ sender: UIButton) {
        self.displayLabel.text = self.inputProcessor.getResult {`operator`, operand in
            return self.recordOnStack(operater: `operator`, operand: operand)
        }
        self.operatorLabel.text = ""
        self.equalButton.isEnabled = false
    }
    
    @IBAction private func tapAllClearButton(_ sender: UIButton) {
        self.inputProcessor.allClear()
        self.displayLabel.text = "0"
        self.operatorLabel.text = ""
        self.clearRecords()
    }
    
    @IBAction private func tapClearEntryButton(_ sender: UIButton) {
        self.inputProcessor.clearLastOperand()
        self.displayLabel.text = "0"
    }
    
    @IBAction private func tapSignChangeButton(_ sender: UIButton) {
        self.displayLabel.text = self.inputProcessor.toggleSign()
    }
    
    private func recordOnStack(operater: String, operand: String) {
        let operatorLabel = UILabel.generate(text: operater)
        let operandLabel = UILabel.generate(text: operand)
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.spacing = 10
            
            return stackView
        }()
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        self.recordStackView.addArrangedSubview(stackView)
        self.scrollToBottom()
    }
    
    private func scrollToBottom() {
        self.recordScrollView.layoutIfNeeded()
        let scrollSize = self.recordScrollView.bounds.size.height
        let contentSize = self.recordStackView.bounds.size.height
        let bottomOffset = CGPoint(x: 0, y: contentSize - scrollSize)
        self.recordScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func clearRecords() {
        self.recordStackView.arrangedSubviews.forEach {
            self.recordStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
