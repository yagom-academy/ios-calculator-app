//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let stringZero = "0"
    private let stringDot = "."
    private let minusSign = "-"
    
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var fomulaListStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCaculator()
    }
    
    @IBAction private func touchACButton(_ sender: UIButton) {
        removeFomulaList()
        resetCaculator()
    }
    
    @IBAction func touchCEButton(_ sender: UIButton) {
        self.operandLabel.text = stringZero
    }
    
    @IBAction func touchChangeSignButton(_ sender: UIButton) {
        guard let operandsText = self.operandLabel.text else {
            return
        }
        if operandsText == stringZero {
            return
        }
        if operandsText.contains(minusSign) {
            self.operandLabel.text = operandsText.replacingOccurrences(of: minusSign, with: "")
        } else {
            self.operandLabel.text = minusSign + operandsText
        }
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text else {
            return
        }
        guard let operandsText = self.operandLabel.text, operandsText.count < 20 else {
            return
        }
        self.operandLabel.text = checkZeroAfterDot(number: operandsText + inputNumber)
    }
    
    @IBAction func touchDotButton(_ sender: UIButton) {
        guard let operandsText = self.operandLabel.text else {
            return
        }
        if operandsText.contains(stringDot) {
            return
        }
        self.operandLabel.text = operandsText + stringDot
    }
    
    private func resetCaculator() {
        self.operatorLabel.text = ""
        self.operandLabel.text = stringZero
    }
    
    private func removeFomulaList() {
        self.fomulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func checkZeroAfterDot(number: String) -> String {
        if number.contains(stringDot) && number.last == Character(stringZero) {
            return number
        }
        return changeNumberFormat(number: number)
    }
    
    private func changeNumberFormat(number: String) -> String {
        let number = Double(number.replacingOccurrences(of: ",", with: "")) ?? 0
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = -2
        guard let changedNumber = numberFormatter.string(from: number as NSNumber) else {
            return ""
        }
        return changedNumber
    }
}

