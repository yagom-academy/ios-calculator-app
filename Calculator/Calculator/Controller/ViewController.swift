//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var enterdFormulaStackView: UIStackView!
    
    var formula: Formula?
    var inputNumber: String?
    var inputOperator: String?
    var isCalculated: Bool?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupFomula()
    }
    
    func setup() {
        resetInputNumber()
        resetInputOperator()
        resetStackViewAll()
        isCalculated = false
    }
    
    func setupFomula() {
        formula = Formula()
    }
    
    func resetStackViewAll() {
        enterdFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func resetInputNumber() {
        inputNumber = "0"
        inputNumberLabel.text = inputNumber
    }
    
    func resetInputOperator() {
        inputOperator = ""
        inputOperatorLabel.text = inputOperator
    }
    
    @IBAction func signChangeButtonTapped(_ sender: UIButton) {
        if inputNumber?.contains("-") == true {
            inputNumber?.removeFirst()
            inputNumberLabel.text = inputNumber
        } else if let value = inputNumber,
               value != "0" {
            inputNumber = "-" + value
            inputNumberLabel.text = inputNumber
        }
        
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        resetStackViewAll()
        setup()
        setupFomula()
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        resetInputNumber()
        resetInputOperator()
    }
    
    @IBAction func operandsInputButtonTapped(_ sender: UIButton) {
        guard let value = sender.currentTitle else { return }
        // 가독성 너무 문제인데..
        if inputNumber == "0", value == "0" {
            return
        } else if inputNumber == "0", value == "00" {
            return
        } else if inputNumber == "0", value == "." {
            inputNumber?.append(value)
        } else if inputNumber == "0" {
            inputNumber = value
        } else if inputNumber?.contains(".") == true, value == "."{
            return
        } else {
            inputNumber?.append(value)
        }
        
        inputNumberLabel.text = inputNumber
        
    }
    
    @IBAction func operatorsInputButtonTapped(_ sender: UIButton) {
        guard let value = sender.currentTitle else { return }
        
        // 연산 후에 한번 더 "="를 누르면 아무 반응 없도록 = 플래그 변수?
        if value == "=" {
            // inputNumber 가 0이고,
            // 연산 과정
            
            return
        }
        resetInputNumber()
        
        inputOperator = value
        inputOperatorLabel.text = inputOperator
    }
    
}

