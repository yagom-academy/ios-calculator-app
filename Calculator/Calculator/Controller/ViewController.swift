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
    var isLastDot: Bool = false
    
    let numberFormatter = NumberFormatter()
    
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
    
    func changeNumberFormat(of number: Double) -> String? {
        numberFormatter.maximumFractionDigits = 20 // 소수점 아래 20자리까지 표시하도록 제한
        numberFormatter.numberStyle = .decimal // 1000 단위로 , 표시
        
        guard let resultInString = numberFormatter.string(from: NSNumber(value: number)) else { return nil }
        
        return resultInString
    }
    
    func refreshLabelsWithResult(of formula: String) {
        var formula: Formula = ExpressionParser.parse(from: formula)
        
        do {
            let calculationResult: Double = try formula.result()
            print("계산 결과 : \(calculationResult)")
            
            guard let resultInString = changeNumberFormat(of: calculationResult) else { return }
            
            operandLabel.text = "\(resultInString)"
            operatorLabel.text = ""
        } catch CalculatorError.dividedByZero {
            operandLabel.text = "\(CalculatorError.dividedByZero.description)"
            operatorLabel.text = ""
        } catch {
            print(error)
        }
    }
    
    // UILabel, 텍스트 사이즈 등 - 스토리보드 설정보고 작성
    func addStackViewWithTwoLabels() {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.spacing = 12
        horizontalStackView.distribution = .fillProportionally // 수정 필요
        horizontalStackView.alignment = .trailing
        
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        operatorLabel.adjustsFontForContentSizeCategory = true
        operatorLabel.adjustsFontSizeToFitWidth = true
        operatorLabel.textColor = .white
        operatorLabel.textAlignment = .right
        operatorLabel.text = currentOperator
//        operatorLabel.largeContentTitle = .largeTitle3????
        
        operandLabel.adjustsFontForContentSizeCategory = true
        operandLabel.adjustsFontSizeToFitWidth = true
        operandLabel.textColor = .white
        operandLabel.textAlignment = .right
        operandLabel.text = currentOperand
//        operandLabel.largeContentTitle = .largeTitle3????
        
        horizontalStackView.addArrangedSubview(operatorLabel)
        horizontalStackView.addArrangedSubview(operandLabel)
        
        processScrollView.addSubview(horizontalStackView) // StackView 테스트
    }
    
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
//        addStackViewWithTwoLabels() // StackView 테스트
        
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
        if isCalculationOver == true {
            resetCalculator()
        }
        
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
    
    @IBAction func touchUpDotBtn(_ sender: UIButton) {
        if isCalculationOver == true {
            resetCalculator()
        }
        
        guard let operandLabelText = operandLabel.text else { return }
        
        if operandLabelText.contains(".") { // 입력한 숫자에 .이 있으면 추가적인 .입력 불가
            return
        } else if operandLabelText == "0" { // 연산자를 누르면 이렇게 설정되는데 왜 여기에 안걸리지?
            // 문제 발생 - 숫자1-연산자1-".3"을 입력하면 0.3 대신 3으로 인식하고, 연산 메서드 비정상 작동
            // 원인-전에 입력한 숫자1이 currentOperand에 들어있어서 생기는 오류
            print("I'm here")
            currentOperand = "0."
            operandLabel.text! = "0."
            isLastDot = true
        } else {
            currentOperand += "."
            operandLabel.text! += "." // 왜 다른 라인과 다르게 옵셔널이 되지?
        }
    }
}
