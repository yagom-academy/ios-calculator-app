//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var scrollStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var listStackView: UIStackView!
    
    var operandNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        operandLabel.text = "0"
        operatorLabel.text = ""
        scrollStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction func numberButtonDidTap(_ sender: UIButton) {
        guard let number = sender.title(for: .normal) else { return }
        
        if operandNumber.count < 20 {
            operandNumber += number
            operandLabel.text = operandNumber
        }
    }
    
    @IBAction func dotButtonDidTap(_ sender: UIButton) {
        if operandNumber.isEmpty {
            operandNumber = "0."
            operandLabel.text = operandNumber
        } else if operandNumber.last == "." || operandNumber.count == 20 {
            operandLabel.text = operandNumber
        } else {
            operandNumber += "."
            operandLabel.text = operandNumber
        }
    }
    
    
    @IBAction func operatorButtonDidTap(_ sender: UIButton) {
        guard let operatorSymbol = sender.title(for: .normal) else { return }
        
        addScrollStackView()
        operandNumber = ""
        operandLabel.text = "0"
        operatorLabel.text = operatorSymbol
    }
    
    func addListStackView() -> UIStackView {
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
    
    func addScrollStackView() {
        scrollStackView.addArrangedSubview(addListStackView())
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        formulaScrollView.layoutIfNeeded()
        formulaScrollView.setContentOffset(CGPoint(x: 0, y: formulaScrollView.contentSize.height - formulaScrollView.bounds.height), animated: false)
        
        }
}

