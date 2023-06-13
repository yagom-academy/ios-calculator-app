//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var formulaListStackView: UIStackView!
    @IBOutlet weak var formulaListScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private var formulaString: String = ""
    private var isComputable: Bool = true

    private var calculatorNumberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 5
        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter
    }()
    
    @IBAction func tapNumbersButton(_ sender: UIButton) {
        if isComputable {
            guard let inputNumberText = sender.titleLabel?.text,
                  let numberLabelText = inputNumberLabel.text,
                  let operatorLabelText = inputOperatorLabel.text else { return }
            
            if numberLabelText.count < 20 {
                inputOperatorLabel.text = (formulaListStackView.subviews.isEmpty) ? ("") : operatorLabelText
                if numberLabelText == "0" {
                    inputNumberLabel.text = inputNumberText
                } else {
                    let formattedNumberText = numberLabelText.replacingOccurrences(of: ",", with: "") + inputNumberText
                    inputNumberLabel.text = calculatorNumberFormatter.string(for: Double(formattedNumberText))
                }
            }
        }
    }
    
    @IBAction func tapSerialZeroButton(_ sender: UIButton) {
        guard let inputNumberText = sender.titleLabel?.text,
              let numberLabelText = inputNumberLabel.text else { return }
        
        inputNumberLabel.text = (numberLabelText == "0") ? ("0") : (numberLabelText + inputNumberText)
    }
    
    @IBAction func tapPeriodButton(_ sender: UIButton) {
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
    }
    
    @IBAction func tapChangeSignButton(_ sender: UIButton) {
    }
    
    @IBAction func tapEqualMarkButton(_ sender: UIButton) {
    }
    
    @IBAction func tapAllClearButton(_ sender: UIButton) {
    }
    
    @IBAction func tapClearEntryButton(_ sender: UIButton) {
    }
}

