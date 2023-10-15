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
}

