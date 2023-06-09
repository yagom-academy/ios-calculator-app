//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var inputLabelStackView: UIStackView!
    
    @IBOutlet weak var allInputScrollView: UIScrollView!
    @IBOutlet weak var allInputStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetInputNumberLabel()
        resetInputOperatorLabel()
        resetAllInputStackView()
    }

    @IBAction func tapNumpad(_ sender: UIButton) {
        guard let labelText = sender.titleLabel?.text else {
            return
        }
        if inputNumberLabel.text == "0" {
            inputNumberLabel.text? = labelText
        } else {
            inputNumberLabel.text? += labelText
        }
    }
    
    @IBAction func tapOperator(_ sender: UIButton) {
        let operatorLabel: UILabel = makeUILabel(inputOperatorLabel.text)
        let operandLabel: UILabel = makeUILabel(inputNumberLabel.text)
        let inputLabelStackView = makeUIStackView()
    
        inputLabelStackView.addArrangedSubview(operatorLabel)
        inputLabelStackView.addArrangedSubview(operandLabel)
        allInputStackView.addArrangedSubview(inputLabelStackView)
        
        resetInputNumberLabel()
        
        guard let labelText = sender.titleLabel?.text else {
            return
        }
        
        inputOperatorLabel.text? = labelText
    }
    
    @IBAction func tapChangeSign(_ sender: UIButton) {
        let hyphenMinus = "-"
        
        if let numberLabelText = inputNumberLabel.text {
            if numberLabelText.hasPrefix(hyphenMinus) {
                inputNumberLabel.text = String(numberLabelText.dropFirst())
            } else {
                inputNumberLabel.text = hyphenMinus + numberLabelText
            }
        }
    }
    
    @IBAction func tapClearEntry(_ sender: UIButton) {
        resetInputNumberLabel()
    }
    
    @IBAction func tapAllClear(_ sender: UIButton) {
        resetInputNumberLabel()
        resetInputOperatorLabel()
        resetAllInputStackView()
    }
    
    private func resetInputNumberLabel() {
        inputNumberLabel.text = "0"
    }
    
    private func resetInputOperatorLabel() {
        inputOperatorLabel.text = ""
    }
    
    private func resetAllInputStackView() {
        allInputStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func makeUILabel(_ text: String?) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.textColor = .white
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func makeUIStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }
}

