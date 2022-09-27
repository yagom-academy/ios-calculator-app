//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    
    var formula: Formula?
    
    var inputNumber: String?
    var inputOperator: String?
    var isCalculate: Bool?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupFomula()
    }
    
    func setup() {
        resetInputNumber()
        resetInputOperator()
        isCalculate = false
    }
    
    func setupFomula() {
        formula = Formula()
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
        // +/- 버튼 클릭시
        // - 부호 일 경우 삭제
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
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
        // inputNumber의 값이 0이면 연산자만 교체
        // 연산이 이루어진 후 = inputNumber 값이 0이 아니라면
        // inputNumber, inputNumberLabel 초기화
        // inputOperator, inputOperatorLabel 초기화
        inputNumber = "0"
        inputNumberLabel.text = inputNumber
        
        inputOperator = value
        inputOperatorLabel.text = inputOperator
    }
    
}

