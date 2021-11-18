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
    var completeFormula: [String] = []
    var isCalculationAdded: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetCalculator()
    }
    
    func resetCalculator() {
        operandLabel.text = ""
        operatorLabel.text = ""
        
        currentOperand = ""
        currentOperator = ""
        completeFormula = []
        isCalculationAdded = false
    }
    
    // UILabel, 텍스트 사이즈 등 - 스토리보드 설정보고 작성
    
    func resetScrollView() {
//        processScrollView.
    }
    
    func addStackView() { // 연산자를 누를 때마다 stackView를 추가함
        
    }
    
    // scrollView의 Scroll 조정
    
    @IBAction func touchUpAllClearBtn(_ sender: UIButton) {
    }
    @IBAction func touchUpClearEntryBtn(_ sender: UIButton) {
    }
    @IBAction func touchUpSignChangeBtn(_ sender: UIButton) {
    }
    
    @IBAction func touchUpDivideOperator(_ sender: UIButton) {
    }
    @IBAction func touchUpMultiplyOperator(_ sender: UIButton) {
    }
    @IBAction func touchUpSubtractOperator(_ sender: UIButton) {
    }
    @IBAction func touchUpAddOperator(_ sender: UIButton) {
        
    }
    @IBAction func touchUpResultBtn(_ sender: UIButton) {
        var formula: Formula = ExpressionParser.parse(from: completeFormula.joined())
        do {
            let result: Double = try formula.result()
            operandLabel.text = "\(result)"
        } catch CalculatorError.dividedByZero {
            operandLabel.text = "\(CalculatorError.dividedByZero.description)"
        } catch {
            print(error)
        }
    }
    
    @IBAction func touchUpOperandBtn(_ sender: UIButton) {
    }
    

}

