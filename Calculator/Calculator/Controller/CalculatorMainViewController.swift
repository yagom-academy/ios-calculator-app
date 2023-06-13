//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorMainViewController: UIViewController {
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpPointButton(_ sender: UIButton) {
        let currentNumberText = operandLabel.text ?? "0"
        let newPointText = sender.titleLabel?.text ?? "."
        let isPoint = currentNumberText.contains(".")
        
        if isPoint == false {
            operandLabel.text = currentNumberText + newPointText
        }
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        let currentNumberText = operandLabel.text ?? "0"
        let newNumberText = sender.titleLabel?.text ?? "0"
        
        guard currentNumberText == "0" else {
            operandLabel.text = currentNumberText + newNumberText
            return
        }
        
        guard newNumberText == "00" else {
            operandLabel.text = newNumberText
            return
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        
        guard let number = operandLabel.text, Double(number) == 0 else {
            return //스크롤뷰에 옮기기 operandLabel 초기화 작업
        }
        
        operatorLabel.text = sender.titleLabel?.text
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpChangeSignButton(_ sender: UIButton) {
        var currentNumberText = operandLabel.text ?? "0"
        let isCurrentSign = currentNumberText.contains("-")
        
        if isCurrentSign == true {
            currentNumberText.removeFirst()
            operandLabel.text = currentNumberText
        } else {
            operandLabel.text = "-" + currentNumberText
        }
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        
    }
    
    @IBAction func touchUpEqualsButton(_ sender: UIButton) {
        
    }
}

