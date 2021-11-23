//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var processScrollView: UIScrollView!
    @IBOutlet weak var processVerticalStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var currentOperand: String = ""
    var currentOperator: String = ""
    var isCalculationOver: Bool = false
    var isLastOperator: Bool = false
    
    var allProcess: String {
        return processVerticalStackView.subviews.compactMap {
            ($0 as? UILabel)?.text
        }.reduce("") {
            "\($0) \($1)"
        }
    }
    
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
        isCalculationOver = false
        
        clearCalculationProcess()
    }
    
    func resetOperand() {
        operandLabel.text = "0"
        currentOperand = ""
    }
    
    func convertToString(from number: Double) -> String? {
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))
    }
    
    func refreshLabelsWithResult(of formula: String) {
        do {
            var formula: Formula = try ExpressionParser.parse(from: formula)
            let calculationResult: Double = try formula.result()
            guard let resultInString = convertToString(from: calculationResult) else { return }
            
            operandLabel.text = "\(resultInString)"
            operatorLabel.text = ""
        } catch CalculatorError.dividedByZero {
            operandLabel.text = "\(CalculatorError.dividedByZero.description)"
            operatorLabel.text = ""
        } catch {
            print(error)
        }
    }
      
    func addCalculationProcessWithHorizontalStackView() {
        
        if currentOperand.first == "." {
            currentOperand = "0\(currentOperand)"
        }
        
        let processLabel = ProcessLabel(text: "\(currentOperator) \(currentOperand)")
        
        processVerticalStackView.addArrangedSubview(processLabel)
        
        scrollToBottom()
    }
    
    func scrollToBottom() {
        processScrollView.layoutIfNeeded()

        let destinationY = processScrollView.contentSize.height - processScrollView.bounds.size.height + processScrollView.contentInset.bottom
        let destinationPoint = CGPoint(x: 0, y: destinationY)
        
        processScrollView.setContentOffset(destinationPoint, animated: false)
    }
        
    func clearCalculationProcess() {
        processVerticalStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction func touchUpOperandBtn(_ sender: UIButton) {
        if isCalculationOver {
            resetCalculator()
        }
        
        guard let operand: String = sender.titleLabel?.text else { return }
        
        if isLastOperator == false {
            currentOperand += operand
            print("입력된 숫자 : \(currentOperand)")
        } else if operand == "." {
            resetOperand()
            currentOperand += operand
            print("입력된 숫자 : \(currentOperand)")
        } else {
            resetOperand()
            currentOperand = operand
        }
        
        operandLabel.text = currentOperand
        isLastOperator = false
    }
    
    @IBAction func touchUpOperatorBtn(_ sender: UIButton) {
//        guard currentOperand != "0", currentOperand != "00" else { return } // 숫자 입력이 없거나 "0"인 상태에서는 연산자가 작동하지 않음 (주의-계산기 앱에서는 0도 작동함)
        
        guard isCalculationOver == false else { return }
        
        guard let operatorSymbol: String = sender.titleLabel?.text,
              let _ = Operator(rawValue: Character(operatorSymbol)) else {
            return
        }
        
        if isLastOperator {
            currentOperator = operatorSymbol
            operatorLabel.text = currentOperator
            return
        } else {
            addCalculationProcessWithHorizontalStackView()
            
            currentOperator = operatorSymbol
            operatorLabel.text = currentOperator
            operandLabel.text = "0"
        }

        isLastOperator = true
    }

    @IBAction func touchUpResultBtn(_ sender: UIButton) {
        guard isCalculationOver == false else {
            return
        }
        
        if isLastOperator == false { // =버튼 탭하기 직전이 연산자이면 ScrollView에 반영하지 않음
            addCalculationProcessWithHorizontalStackView() // StackView에 반영되지 못한 마지막 숫자/연산자를 추가 (개선 필요)
        }
        
        refreshLabelsWithResult(of: allProcess)
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
        
        resetOperand()
    }
    
    @IBAction func touchUpSignChangeBtn(_ sender: UIButton) {
        if isCalculationOver == true {
            resetCalculator()
        }
        
        guard let operandInNumber = Double(currentOperand), operandInNumber != 0 else {
            return
        }
        
        if currentOperand.first == Operator.subtract.rawValue {
            currentOperand.removeFirst()
        } else {
            currentOperand = "\(Operator.subtract.rawValue)\(currentOperand)"
        }
        
        operandLabel.text = currentOperand
    }
}
