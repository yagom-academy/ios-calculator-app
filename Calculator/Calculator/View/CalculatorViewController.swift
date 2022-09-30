//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    // TODO: - 스크롤뷰 맨밑으로 자동으로 내려가게 하기
    @IBOutlet weak var historyScrollView: UIScrollView!
    @IBOutlet weak var historyStackView: UIStackView!
    @IBOutlet weak var lastOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    
    private var isInputZero: Bool = false
    private var formula: String = ""
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesSignificantDigits = true
        formatter.maximumSignificantDigits = 20
        
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func resetlastOperatorLabel() {
        lastOperatorLabel.text = ""
    }
    
    private func resetCurrentNumberLabel() {
        currentNumberLabel.text = "0"
        isInputZero = false
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        updateCurrentNumberLabel(with: String(sender.tag))
        isInputZero = true
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        guard !isInputZero else  { return }
        updateCurrentNumberLabel(with: "00")
    }
    
    @IBAction func touchUpDecimalButton(_ sender: UIButton) {
        updateCurrentNumberLabel(with: ".")
    }
    
    // TODO: -플/마 기호
    @IBAction func touchUpSymbolChangeButton(_ sender: UIButton) {
        
    }
    
    
    func updateCurrentNumberLabel(with input: String) {
        guard var curNumStr = currentNumberLabel.text else { return }
        
        // TODO: - 0만 있을 때 00 입력하는 경우 처리해줘~~
        if curNumStr == "0" {
            curNumStr = input
        } else {
            curNumStr += input
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
    // 5. 0으로 설정된 숫자 레이블과 입력값이 0인 경우를 구분..시떼..ㅎㅎ -> 완료
    // 6. 올라간 스택을 formula 문자열에 append
    // 만약 기호랑 숫자가 둘다 있었다면? 둘다 올라감 ㅇㅇ
    // 둘 중 하나만 있었다면? 숫자만 올라감. 아 근데 그냥 빈 스트링 어펜드 하는거니까 노상관 ㅇㅋ
    
    private func updateOperatorLabel(_ operatorSign: String) {
        // 입력한 숫자가 아직 없을 경우 부호만 바꿔주고 종료한다.
        guard isInputZero else {
            lastOperatorLabel.text = operatorSign
            return
        }
        
        addToStackView()
        
        guard let operatorToAdd = lastOperatorLabel.text,
              let numberToAdd = currentNumberLabel.text else { return }
        formula += operatorToAdd
        formula += numberToAdd
        
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
        // 입력되어있던 기호창 비우기
        resetlastOperatorLabel()
        
        // 입력하던 숫자창 비우기
        resetCurrentNumberLabel()

        // stackView 안의 전체 stack item 날리는 것
        historyStackView.removeAllSubviews(of: historyStackView)
    }

    // = 을 눌렀을 때 해야할 것
    // 1. 스택의 모든 숫자, 연산자를 순서대로 가져와서 formula에 집어넣기
    // 2. formula -> expressionParser
    // 3. 결과값 가져오기 (+ 예외처리)
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        // TODO: -operator에 기호가 없으면 작동하지 않게 걸어주기
        
        completeFormula()
        let calculatedResult: Double = fetchResult()
        showResult(calculatedResult)
    }
    
    private func completeFormula() {
        guard let operatorToAdd = lastOperatorLabel.text,
              let numberToAdd = currentNumberLabel.text else { return }
        
        formula += operatorToAdd
        formula += numberToAdd
        
        addToStackView()
    }
    
    private func fetchResult() -> Double {
        var formulaToCalculate: Formula = ExpressionParser.parse(from: formula)
        
        return formulaToCalculate.result()
    }
    
    private func showResult(_ result: Double) {
        resetlastOperatorLabel()
        currentNumberLabel.text = String(result)
    }

}

