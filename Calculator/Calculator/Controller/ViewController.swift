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
    
    @IBAction func touchUpAllClearBtn(_ sender: UIButton) {
        resetCalculator()
    }
    @IBAction func touchUpClearEntryBtn(_ sender: UIButton) {
        if isCalculationOver == false {
            resetCalculator()
            return
        }
        
        resetOperand()
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
    
    // 연산자를 누를 때 앞에서 입력한 숫자를 업데이트
    @IBAction func touchUpOperatorBtn(_ sender: UIButton) {
        guard currentOperand != "0" else { return } // 숫자 입력이 없거나 "0"인 상태에서는 연산자가 작동하지 않음 (주의-계산기 앱에서는 0도 작동함)
        
        guard isCalculationOver == false else { return } // =버튼을 탭한 직후 연산자를 탭하면 작동하지 않음
        
        let operatorSymbols: [Character] = Operator.allCases.map { $0.rawValue }
        
        guard let operatorSymbol: String = sender.titleLabel?.text, // 버튼의 연산기호를 확인
        operatorSymbols.contains(Character(operatorSymbol)) else {
            return
        }
        currentOperator = operatorSymbol
        operatorLabel.text = operatorSymbol
        
        // 개선 - 숫자가 formula에 추가되지 않은 상태라면 lastCharacter 언래핑이 안되고 else문 실행
        if let lastCharacter = completeFormula.last, operatorSymbols.contains(lastCharacter) { // formula 마지막이 연산자라면 (연산자를 연속 탭)
            completeFormula.removeLast() // 마지막 연산자를 삭제
            completeFormula += "\(currentOperator)" // 숫자는 다시 더해주지 않음
            print(completeFormula)
        } else {
            completeFormula += "\(currentOperand)\(currentOperator)"
            print(completeFormula)
        }

        resetOperand()
    }

    @IBAction func touchUpResultBtn(_ sender: UIButton) {
        guard isCalculationOver == false else {
            return // = 버튼을 탭하여 연산이 완료된 경우, 다시 탭할 때 재연산하지 않음
        }
        
        refreshLabelsWithResult(of: completeFormula)
        isCalculationOver = true
    }
    
    @IBAction func touchUpOperandBtn(_ sender: UIButton) {
        if isCalculationOver {
            resetCalculator()
        }
        
        guard let operand: String = sender.titleLabel?.text else {
            return
        }
        
        currentOperand += operand
        
        guard let operandInNumber = Double(currentOperand) else {
            return
        }
        
        operandLabel.text = "\(operandInNumber)"
    }
    

}

