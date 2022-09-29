//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var historyScrollView: UIScrollView!
    @IBOutlet weak var historyStackView: UIStackView!
    @IBOutlet weak var lastOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    var formula: [String] = []
    
    private var numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
    }
    
    private func resetlastOperatorLabel() {
        lastOperatorLabel.text = ""
    }
    
    private func resetCurrentNumberLabel() {
        currentNumberLabel.text = "0"
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        updateCurrentNumberLabel(String(sender.tag))
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        guard let currentNumberLabelText = currentNumberLabel.text else { return }
        
        if currentNumberLabelText == "0" { return }
        updateCurrentNumberLabel("00")
    }
    
    func updateCurrentNumberLabel(_ int: String) {
        guard var curNumStr = currentNumberLabel.text else { return }
        
        if curNumStr == "0" {
            curNumStr = int
        } else {
            curNumStr += int
        }
        
        currentNumberLabel.text = curNumStr
    }
    
    @IBAction func touchUpPlusButton(_ sender: UIButton) {
        
        updateOperatorLabel("+")
    }
    
    @IBAction func touchUpMinusButton(_ sender: UIButton) {
        
        updateOperatorLabel("-")
    }
    
    @IBAction func touchUpMultiplyButton(_ sender: UIButton) {
        
        updateOperatorLabel("×")
    }
    
    @IBAction func touchUpDivideButton(_ sender: UIButton) {
        
        updateOperatorLabel("÷")
    }
    
    // 기호 버튼을 눌렀을 때 해야 할 것
    // 1. 기존 기호레이블 & 숫자레이블의 내용을 스택뷰로 만들어서 스택뷰에 보내버림
    // 2. 터치한 기호를 기호 레이블에 넣는다
    // 3. 숫자 레이블은 0으로 세팅한다
    // 4. 올라간 스택의 텍스트를 표시해준다
    
    private func updateOperatorLabel(_ operatorSign: String) {
        addToStackView()
        lastOperatorLabel.text = operatorSign
        resetCurrentNumberLabel()
    }
    
    private func addToStackView() {
        guard let lastOperatorLabelText = lastOperatorLabel.text,
              let currentNumberLabelText = currentNumberLabel.text else { return }
        
        let stack = LineStackView(operatorStr: lastOperatorLabelText, operandStr: currentNumberLabelText)
        
        historyStackView.addArrangedSubview(stack)
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        clearAll()
    }
    
    // AC버튼을 눌렀을 때 동작할 녀석
    private func clearAll() {
        // formula에 수식 다 넣기
        
        
        // 입력되어있던 기호창 비우기
        resetlastOperatorLabel()
        
        // 입력하던 숫자창 비우기
        resetCurrentNumberLabel()


        // stackView 안의 전체 stack item 날리는 것
        // -> 익스텐션 메서드로 따로 구현해놓고 호출해서 쓰기?
        
        //
    }
    
    private func pushFormula() {
        
        
        
        lastOperatorLabel.text = ""
        
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        
        // 스택 다 긁어와서 formula에 집어넣기
    }
    
}

