//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    // MARK: - IBOutlet
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var calculateItemsStack: UIStackView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    // MARK: - Property
    
    // MARK: - View State Method

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func tapACButton(_ sender: Any) {
        
    }

    @IBAction func tapCEButton(_ sender: Any) {
        
    }

    @IBAction func tapNEGButton(_ sender: Any) {
        
    }

    @IBAction func tapOperatorButton(_ sender: UIButton) {
    
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        let operandLabelText = operandLabel.text?
            .components(separatedBy: ",")
            .joined()
        
        guard var operandLabelText, operandLabelText.count < 20 else {
            return
        }
        
        operandLabelText.append(sender.titleLabel?.text ?? "")
        let number = Decimal(string: operandLabelText)
        
        operandLabel.text = formatNumber(of: number)
    }

    @IBAction func tapZeroButton(_ sender: UIButton) {

    }

    @IBAction func tapDotButton(_ sender: UIButton) {

    }

    @IBAction func tapEqualsButton(_ sender: Any) {

    }

    // MARK: - Method
    
    func formatNumber(of number: Any?) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 15
        
        return numberFormatter.string(for: number)
    }
}

