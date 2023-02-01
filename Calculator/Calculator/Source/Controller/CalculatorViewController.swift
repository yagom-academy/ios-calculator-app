//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var displayOperatorLabel: UILabel!
    @IBOutlet private weak var displayNumbersLabel: UILabel!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    @IBOutlet private weak var historyStackView: UIStackView!
    
    private var numberFormatter: NumberFormatter = .init()
    private var currentNumbersLabelText: String = "0" {
        didSet {
            displayNumbersLabel.text = numberFormatter.string(for: Double(currentNumbersLabelText))
        }
    }
    private var currentOperatorLabelText = "" {
        didSet {
            displayOperatorLabel.text = currentOperatorLabelText
        }
    }
    private var expression = "" {
        didSet {
            if currentOperatorLabelText != "" {
                expression += " "
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.numberStyle = .decimal
    }
    
    @IBAction private func numericButtonTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        
        if currentNumbersLabelText == "0" {
            currentNumbersLabelText = number
        } else {
            currentNumbersLabelText += number
        }
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle,
              currentNumbersLabelText != "0" else { return }

        currentOperatorLabelText = `operator`
        expression += currentNumbersLabelText
        expression += currentOperatorLabelText
        currentNumbersLabelText = "0"
    }
    
    @IBAction private func signButtonTapped(_ sender: UIButton) {
        
    }
    
    func configureCurrentNumbersLabel(number: String) {
        
    }
}

