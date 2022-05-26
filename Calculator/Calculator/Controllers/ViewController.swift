//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatingScrollView: UIScrollView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var formula: Formula = Formula()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabels()
    }
    
    func configureLabels() {
        operatorLabel.text = " "
        operandLabel.text = "0"
    }
    
//    func makeStackView(of )
    
    // 숫자 버튼이 눌리면?
    // 1. 연산자 버튼이 눌리기 전까지 쌓아놔야 함.
    // 2. 누른 숫자들로 레이블을 변경
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        // 눌린 버튼의 글자를 inputString에 추가하기
        guard let tappedNumberText = sender.titleLabel?.text else { return }
        if operandLabel.text == "0" { operandLabel.text = "" }
        operandLabel.text?.append(tappedNumberText)
    }
    
    @IBAction func demicalPointButtonTapped(_ sender: UIButton) {
        guard operandLabel.text?.contains(".") == false else { return }
        guard let tappedDemicalPointText = sender.titleLabel?.text else { return }
        operandLabel.text?.append(tappedDemicalPointText)
    }
    
    @IBAction func doubleZeroButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        guard let tappedDoubleZeroText = sender.titleLabel?.text else { return }
        operandLabel.text?.append(tappedDoubleZeroText)
    }
    
    // 부호 버튼이 눌리면?
    // 1. 현재 숫자 큐에 있는 값을 반대의 부호로 바꿔주어야 함.
    // 2. 숫자 레이블을 업데이트 해야함.
    @IBAction func signButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        if operandLabel.text?.first == "-" {
            operandLabel.text?.removeFirst()
        } else {
            operandLabel.text?.insert("-", at: operandLabel.text!.startIndex)
        }
    }
    
    
    // 연산자 버튼이 눌리면?
    // 1. 숫자 레이블을 0으로 바꿔야 함.
    // 2. parse를 실행해서 큐에 넣어야 함.
    // 2-2. 숫자가 없으면 parse를 실행하지 말아야 함.
    // 3. 스크롤뷰에 스택으로 쌓아야 함.
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let tappedOperatorText = sender.titleLabel?.text,
              let operandLabelText = operandLabel.text else { return }
        operatorLabel.text = tappedOperatorText
        
        guard operandLabel.text != "0" else { return }
        operandLabel.text = "0"
        
        let inputString = tappedOperatorText + " " + operandLabelText
        formula += ExpressionParser.parse(from: inputString)
    }
    
    // 계산 버튼이 눌리면?
    // 1. 마지막으로 받은 숫자 하나를 큐에 넣어야 함.
    // 2. 큐에 있는 값들을 result() 결과를 돌려줘야 함.
    // 3. 숫자 레이블 업데이트
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else { return }
        formula += ExpressionParser.parse(from: operandLabelText)
        formula.result()
    }
    
    // CE 버튼이 눌리면?
    // 1. 마지막으로 입력했었던 숫자를 없애야 함
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    // AC 버튼이 눌리면?
    // 1. 큐를 다 없애고, 0으로 초기화해야 함.
    // 2. 부호 레이블 및 숫자 레이블 업데이트
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        
    }
}

 
