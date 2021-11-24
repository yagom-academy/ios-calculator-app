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
    var isCalculationOver: Bool = false
    var isPreviousInputOperator: Bool = false
    var isNotPreviousInputOperator: Bool {
        !isPreviousInputOperator
    }
    
    var allProcess: String {
        return processStackView.subviews.compactMap {
            ($0 as? UILabel)?.text
        }.map {
            $0.replacingOccurrences(of: ",", with: "")
        }.reduce("") {
            "\($0) \($1)"
        }
    }
    
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
        
        clearProcessStack()
    }
    
    func resetOperand() {
        operandLabel.text = "0"
        currentOperand = ""
    }
    
    func convertToDecimalString(from number: Double) -> String? {
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: number))
    }
    
    func updateLabelsWithResult(of formula: String) {
        do {
            var formula: Formula = try ExpressionParser.parse(from: formula)
            let calculationResult: Double = try formula.result()
            guard let resultInString = convertToDecimalString(from: calculationResult) else { return }
            
            operandLabel.text = "\(resultInString)"
            operatorLabel.text = ""
        } catch CalculatorError.dividedByZero {
            operandLabel.text = "\(CalculatorError.dividedByZero.description)"
            operatorLabel.text = ""
        } catch {
            print(error)
        }
    }
    
    func pushProcessLabelToStack() {
        if currentOperand.first == "." {
            currentOperand = "0\(currentOperand)"
        }
        
        if currentOperand.last == "." {
            currentOperand.removeLast()
        }
        
        guard let operandInNumber = Double(currentOperand) else {
            return
        }
        
        currentOperand = convertToDecimalString(from: operandInNumber) ?? ""
        
        let processLabel = ProcessLabel(text: "\(currentOperator) \(currentOperand)")
        
        processStackView.addArrangedSubview(processLabel)
        
        scrollToBottom()
    }
    
    func scrollToBottom() {
        processScrollView.layoutIfNeeded()

        let bottomY = processScrollView.contentSize.height - processScrollView.bounds.size.height + processScrollView.contentInset.bottom
        let bottomPoint = CGPoint(x: 0, y: bottomY)
        
        processScrollView.setContentOffset(bottomPoint, animated: false)
    }
        
    func clearProcessStack() {
        processStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func didNotRepeatDotOperand(operand: String) -> Bool {
        if currentOperand.contains(".") && operand == "." {
            return false
        }
        return true
    }
    
    @IBAction func touchUpOperandBtn(_ sender: UIButton) {
        if isCalculationOver {
            resetCalculator()
        }
        
        guard let operand: String = sender.titleLabel?.text else { return }
        
        guard didNotRepeatDotOperand(operand: operand) else {
            return
        }
        
        if isNotPreviousInputOperator {
            currentOperand += operand
            print("입력된 숫자 : \(currentOperand)")
        } else if operand == "." {
            resetOperand()
            currentOperand = "0" + operand
            print("입력된 숫자 : \(currentOperand)")
        } else {
            resetOperand()
            currentOperand = operand
        }
        
        operandLabel.text = currentOperand
        isPreviousInputOperator = false
    }
    
    @IBAction func touchUpOperatorBtn(_ sender: UIButton) {
        guard isCalculationOver == false else { return }
        
        guard let operatorSymbol: String = sender.titleLabel?.text,
              let _ = Operator(rawValue: Character(operatorSymbol)) else {
            return
        }
        
        if isPreviousInputOperator {
            currentOperator = operatorSymbol
            operatorLabel.text = currentOperator
            return
        } else {
            pushProcessLabelToStack()
            
            currentOperator = operatorSymbol
            operatorLabel.text = currentOperator
            operandLabel.text = "0"
        }

        isPreviousInputOperator = true
    }

    @IBAction func touchUpResultBtn(_ sender: UIButton) {
        guard isCalculationOver == false else {
            return
        }
        
        if isNotPreviousInputOperator {
            pushProcessLabelToStack() 
        }
        
        updateLabelsWithResult(of: allProcess)
        isCalculationOver = true
    }
    
    @IBAction func touchUpAllClearBtn(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction func touchUpClearEntryBtn(_ sender: UIButton) {
        if isCalculationOver {
            resetCalculator()
            return
        }
        
        resetOperand()
    }
    
    @IBAction func touchUpSignChangeBtn(_ sender: UIButton) {
        if isCalculationOver {
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
