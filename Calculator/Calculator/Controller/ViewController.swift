//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var processScrollView: UIScrollView!
    @IBOutlet weak var processStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var currentOperand: String = ""
    var currentOperator: String = ""
    var completeFormula: String = ""
    var isCalculationOver: Bool = false

    var isLastOperator: Bool = false // false = 마지막 숫자, true = 마지막 연산자
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetCalculator()
    }
    
    func resetCalculator() {
        resetOperand()
        operatorLabel.text = ""
        currentOperator = ""
        completeFormula = ""
        isCalculationOver = false
    }
    
    func resetOperand() {
        operandLabel.text = "0"
        currentOperand = ""
    }
    
    func refreshLabelsWithResult(of formula: String) {
        var formula: Formula = ExpressionParser.parse(from: formula)
        
        do {
            let result: Double = try formula.result()
            print("계산 결과 : \(result)")
            operandLabel.text = "\(result)"
            operatorLabel.text = ""
        } catch CalculatorError.dividedByZero {
            operandLabel.text = "\(CalculatorError.dividedByZero.description)"
            operatorLabel.text = ""
        } catch {
            print(error)
        }
    }
    
    // UILabel, 텍스트 사이즈 등 - 스토리보드 설정보고 작성
    
    func resetScrollView() {
//        processScrollView.
    }
    
    func addStackView() { // 연산자를 누를 때마다 stackView를 추가함
        
    }
    
    // scrollView의 Scroll 조정
    
    @IBAction func touchUpOperandBtn(_ sender: UIButton) {
        if isCalculationOver {
            resetCalculator()
        }
        
        guard let operand: String = sender.titleLabel?.text, Double(operand) != nil else { return }
        
        if isLastOperator == false {
            currentOperand += operand
            print("입력된 숫자 : \(currentOperand)")
        } else { // 로직 변경 - 숫자1-연산자1-숫자2를 누르는 시점에서 숫자1-연산자1을 formula에 업데이트
            completeFormula += "\(currentOperand)\(currentOperator)"
            print("현재 formula : \(completeFormula)")
            resetOperand()
            
            currentOperand = operand
        }
        
        operandLabel.text = currentOperand
        isLastOperator = false
    }
    
    @IBAction func touchUpOperatorBtn(_ sender: UIButton) {
//        guard currentOperand != "0" else { return } // 숫자 입력이 없거나 "0"인 상태에서는 연산자가 작동하지 않음 (주의-계산기 앱에서는 0도 작동함)
        
        guard isCalculationOver == false else { return } // =버튼을 탭한 직후 연산자를 탭하면 작동하지 않음
        
        let operatorSymbols: [Character] = Operator.allCases.map { $0.rawValue }
        
        guard let operatorSymbol: String = sender.titleLabel?.text, // 버튼의 연산기호를 확인
        operatorSymbols.contains(Character(operatorSymbol)) else {
            return
        }
        
        currentOperator = operatorSymbol
        operatorLabel.text = currentOperator // formula에 반영하지 않고 레이블만 변경
        operandLabel.text = "0"

        isLastOperator = true
    }

    @IBAction func touchUpResultBtn(_ sender: UIButton) {
        guard isCalculationOver == false else {
            return // = 버튼을 탭하여 연산이 완료된 경우, 다시 탭할 때 재연산하지 않음
        }
        
        completeFormula += currentOperand // formula에 반영되지 못한 마지막 숫자를 추가 (개선 필요)
        
        refreshLabelsWithResult(of: completeFormula)
        isCalculationOver = true
    }
    
    @IBAction func touchUpAllClearBtn(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction func touchUpClearEntryBtn(_ sender: UIButton) {
        if isCalculationOver == true {
            resetCalculator()
            return
        }
        
        operandLabel.text = "0" // currentOperator는 그대로 있어야 함
    }
    
    @IBAction func touchUpSignChangeBtn(_ sender: UIButton) {
        guard let operandInNumber = Double(currentOperand), operandInNumber != 0 else {
            return
        }
        
        if currentOperand.first == "-" {
            currentOperand.removeFirst()
        } else {
            currentOperand = "-\(currentOperand)"
        }
        
        operandLabel.text = currentOperand
    }
}
