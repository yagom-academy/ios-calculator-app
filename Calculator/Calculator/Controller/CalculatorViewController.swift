//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var inputNumLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    private var entireStringFormula: String = ""
    private let negativeSign = "-"
    private let initialNumLabel = "0"
    private let initialStringValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initailizeLabel()
        initializeFormulaStackView()

    }
    
    func initailizeLabel() {
        inputNumLabel.text = initialNumLabel
        inputOperatorLabel.text = initialStringValue
    }
    
    func initializeFormulaStackView() {
        formulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    // MARK: - 숫자 버튼 입력
    @IBAction func tapNumberPad(_ sender: UIButton) {
        guard let currentNumLabel = inputNumLabel.text,
             let inputNum = sender.currentTitle else { return }
        
        if currentNumLabel == initialNumLabel {
            inputNumLabel.text = inputNum
        } else {
            updateInputNumLabel(currentNumLabel, with: inputNum)
        }
    }
    
    @IBAction func tapDotBtn(_ sender: UIButton) {
        if let currentNumLabel = inputNumLabel.text,
          let inputSign = sender.currentTitle,
         !currentNumLabel.contains(".") {
            updateInputNumLabel(currentNumLabel, with: inputSign)
        }
    }
    @IBAction func tapDoubleZeroBtn(_ sender: UIButton) {
        if let currentNumLabel = inputNumLabel.text,
          let inputNum = sender.currentTitle,
         currentNumLabel != initialNumLabel {
            updateInputNumLabel(currentNumLabel, with: inputNum)
        }
    }
    
    func updateInputNumLabel(_ currentNum: String, with input: String) {
        inputNumLabel.text = currentNum + input
    }
    
    // MARK: - 연산자 버튼 입력

}

