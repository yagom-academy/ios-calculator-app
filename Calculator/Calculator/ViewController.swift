//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetOperatorLabel()
        resetOperandLabel()
        removeAllsubviewsInHistoryStackView()
    }
    
    func resetOperatorLabel() {
        operatorLabel.text = ""
    }
    
    func resetOperandLabel() {
        operandLabel.text = "0"
    }

    func removeAllsubviewsInHistoryStackView() {
        historyStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func addOperandToOperandLabel(_ operand: String) {
        let currentLabelText: String = operandLabel.text ?? ""
        let isPointDuplication: Bool = operand == "." && currentLabelText.contains(".")
        let isZeroDuplication: Bool = currentLabelText == "0" && ["0", "00"].contains(operand)
        if isZeroDuplication || isPointDuplication {
            return
        }
        let isInitialState: Bool = currentLabelText == "0" && operand != "."
        if isInitialState {
            operandLabel.text = operand
        } else {
            operandLabel.text = "\(currentLabelText)\(operand)"
        }
    }
    
    func switchPositiveNegativeOfOperandLabelText() {
        var labelText: String = operandLabel.text ?? ""
        if labelText == "0" {
            return
        }
        let isNegative: Bool = labelText.hasPrefix("-")
        if isNegative {
            labelText.removeFirst()
            operandLabel.text = labelText
        } else {
            operandLabel.text = "-\(labelText)"
        }
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        resetOperandLabel()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        resetOperatorLabel()
        resetOperandLabel()
        removeAllsubviewsInHistoryStackView()
    }
    
    @IBAction func touchUpNumberPadButton(_ sender: UIButton) {
        if let labelText = sender.titleLabel?.text {
            addOperandToOperandLabel(labelText)
        }
    }
    @IBAction func touchUpPositiveNegativeButton(_ sender: UIButton) {
        switchPositiveNegativeOfOperandLabelText()
    }
}

