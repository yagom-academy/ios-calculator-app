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
    
    private var formula: Formula?
    private var inputNumber: String?
    private var inputOperator: String?
    private var isCalculated: Bool?
   

    private var formulaStackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }
    
    private var operandLabel: UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
//        label.text = inputNumberLabel.text
        label.text = "123"
        label.textAlignment = .right
        
        return label
    }
    
    private var operatorLabel: UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "+"
//        label.text = inputOperatorLabel.text
        label.textAlignment = .right
        return label
    }
    
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
    
    func addScrollSubView(){
        print("asd")
        formulaStackView.addSubview(operandLabel)
        formulaStackView.addSubview(operatorLabel)
        print(formulaStackView.subviews)
        print(operandLabel)
        print(operatorLabel)
        
        
        formulaScrollView.addSubview(formulaStackView)
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
        addScrollSubView()
//
//        // 연산 후에 한번 더 "="를 누르면 아무 반응 없도록 = 플래그 변수?
//        // 분리?
//        if value == "=" {
//            // inputNumber 가 0이고,
//            // 연산 과정
//
//            return
//        }
//        // 연산 버튼이 눌릴 때 마다,, 스택 뷰 만들어서,, 레이블 두개 넣고,, 오토레이아웃 잡아주고 ,, 헝헝,,,헝헝,,,
//
//
//        resetInputNumber()
//
//        inputOperator = value
//        inputOperatorLabel.text = inputOperator
    }
    
}

