//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var acButton: UIButton!
    @IBOutlet private weak var ceButton: UIButton!
    @IBOutlet private weak var negativeButton: UIButton!
    @IBOutlet private weak var divideButton: UIButton!
    @IBOutlet private weak var multiplyButton: UIButton!
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private weak var currentNumberLabel: UILabel!
    
    @IBOutlet private weak var formulaListScrollView: UIScrollView!
    @IBOutlet private weak var formulaListStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCurrentStatus()
    }
    
    @IBAction private func touchUpButton(_ sender: UIButton) {
        switch sender {
        case acButton:
            deleteAllFormulaListStackView()
            setUpCurrentStatus()
        case ceButton:
            currentNumberLabel.text = "0"
        case negativeButton:
            return
        case divideButton:
            return
        case multiplyButton:
            return
        case subtractButton:
            return
        case addButton:
            return
        case equalButton:
            return
        default:
            guard let currentNumber = currentNumberLabel.text,
                  let senderTitle = sender.title(for:.normal) else { return }
            
            currentNumberLabel.text = currentNumber + senderTitle
        }
    }
    
    private func setUpCurrentStatus() {
        currentNumberLabel.text = "0"
        currentOperatorLabel.text = ""
    }
    
    private func deleteAllFormulaListStackView() {
        formulaListStackView.arrangedSubviews.forEach { stack in
            formulaListStackView.removeArrangedSubview(stack)
        }
    }

    func formatNumber(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        guard let numberFormatted = numberFormatter.string(for: number) else { return "" }
        
        return numberFormatted
    }
}

