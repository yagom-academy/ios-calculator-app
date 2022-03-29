//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let stringZero = "0"
    private let stringDot = "."
    
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
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text else {
            return
        }
        guard let operandsText = self.operandLabel.text, operandsText.count < 20 else {
            return
        }
        self.operandLabel.text = operandsText + inputNumber
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
}

