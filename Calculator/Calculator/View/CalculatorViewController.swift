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
    
    // TODO: -.이 두 번 이상 나올 수 없는 것 처리해야함
    @IBAction func touchUpDecimalButton(_ sender: UIButton) {
        guard let currentNumber = currentNumberLabel.text,
              !currentNumber.contains(".") else { return }
        updateCurrentNumberLabel(with: ".")
    }
    
    @IBAction func touchUpSymbolChangeButton(_ sender: UIButton) {
        changeSymbol()
    }
    
    private func changeSymbol() {
        guard isInputZero else { return }
        
        guard var currentNumber = currentNumberLabel.text else { return }
        
        if currentNumber.first == "-" {
            currentNumber.removeFirst()
            currentNumberLabel.text = currentNumber
        } else {
            currentNumber = "-" + currentNumber
            currentNumberLabel.text = currentNumber
        }
    }
    
    private func formatToNumber(_ number: String) -> String {
        guard let formattedNumber =
                Formatter.formattedNumber.string(
                    for: Formatter.formattedNumber.number(from: number)
                ) else {
            return ""
        }
        
        return formattedNumber
    }
    
    func updateCurrentNumberLabel(with input: String) {
        guard var curNumStr = currentNumberLabel.text else { return }
        
        if curNumStr == "0", input == "00" {
            curNumStr = input
        } else if curNumStr == "0", input != "00" {
            curNumStr = input
        } else {
            curNumStr += input
        }
        
        currentNumberLabel.text = formatToNumber(curNumStr)
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
        currentNumberLabel.text = formatToNumber(String(result))
    }

}

