//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var inputNumLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var formulaStackView: UIStackView!
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    
    private var entireStringFormula: String = ""
    private let negativeSign = "-"
    private let initialNumLabel = "0"
    private let initialStringValue = ""
    
    private let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initailizeLabel()
        initializeFormulaStackView()
        initializeNumberFormatter()

    }
    
    private func initailizeLabel() {
        inputNumLabel.text = initialNumLabel
        inputOperatorLabel.text = initialStringValue
    }
    
    private func initializeFormulaStackView() {
        formulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func initializeNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
    }

    // MARK: - 숫자 버튼 입력
    
    @IBAction private func tapNumberPad(_ sender: UIButton) {
        guard let currentNumLabel = inputNumLabel.text,
             let inputNum = sender.currentTitle else { return }
        
        if currentNumLabel == initialNumLabel {
            inputNumLabel.text = inputNum
        } else {
            updateInputNumLabel(currentNumLabel, with: inputNum)
        }
    }
    
    @IBAction private func tapDotBtn(_ sender: UIButton) {
        if let currentNumLabel = inputNumLabel.text,
          let inputSign = sender.currentTitle,
         !currentNumLabel.contains(".") {
            inputNumLabel.text = currentNumLabel + inputSign
        }
    }
    
    @IBAction private func tapDoubleZeroBtn(_ sender: UIButton) {
        if let currentNumLabel = inputNumLabel.text,
          let inputNum = sender.currentTitle,
         currentNumLabel != initialNumLabel {
            updateInputNumLabel(currentNumLabel, with: inputNum)
        }
    }
    
    private func updateInputNumLabel(_ currentNum: String, with input: String) {
        let numWithoutComma = currentNum.replacingOccurrences(of: ",", with: "")
        let updatedNum = numWithoutComma + input
        if let convertedNum = numberFormatter.string(for: Double(updatedNum)) {
            inputNumLabel.text = convertedNum
        }
    }
    
    // MARK: - 연산자 버튼 입력
    
    @IBAction private func tapOperatorBtn(_ sender: UIButton) {
        guard let currentNumLabel = inputNumLabel.text,
             let inputOperator = sender.currentTitle else { return }

        if formulaStackView.arrangedSubviews.count == 0,
          currentNumLabel == initialNumLabel {
            inputOperatorLabel.text = initialStringValue
        } else if currentNumLabel == initialNumLabel {
            changeOperatorLabel(with: inputOperator)
        } else {
            addFormulaStackView()
            changeOperatorLabel(with: inputOperator)
            inputNumLabel.text = initialNumLabel
        }
    }
    
    private func changeOperatorLabel(with input: String) {
        inputOperatorLabel.text = input
    }
    
    private func addFormulaStackView() {
        let newFormulaStack = createFormulaStack()
        formulaStackView.addArrangedSubview(newFormulaStack)
        addStringFormula()
        scrollToBottom(calculatorScrollView)
    }
    
    private func addStringFormula() {
        guard let inputNum = inputNumLabel.text,
             let inputOperator = inputOperatorLabel.text else { return }
        
        let inputNumWithoutComma = inputNum.replacingOccurrences(of: ",", with: "")
        entireStringFormula += (inputOperator + inputNumWithoutComma)
    }
    
    // MARK: - 특수 버튼 입력
    
    @IBAction private func tapACBtn(_ sender: UIButton) {
        initailizeLabel()
        entireStringFormula = initialStringValue
        initializeFormulaStackView()
    }
    
    @IBAction private func tapCEBtn(_ sender: UIButton) {
        initailizeLabel()
    }
    
    @IBAction private func tapPositiveNegativeBtn(_ sender: UIButton) {
        guard let currentNum = inputNumLabel.text,
             currentNum != initialNumLabel else { return }
        
        if currentNum.hasPrefix(negativeSign) {
            inputNumLabel.text = String(currentNum.dropFirst())
        } else {
            inputNumLabel.text = negativeSign + currentNum
        }
    }
    
    @IBAction private func tapResultBtn(_ sender: UIButton) {
        guard entireStringFormula != initialStringValue else { return }
        
        addFormulaStackView()
        var formula = ExpressionParser.parse(from: entireStringFormula)
        do {
            let result = try formula.result()
            updateNumLabel(with: result)
            inputOperatorLabel.text = initialStringValue
            entireStringFormula = initialStringValue
        } catch CalculatorError.emptyQueue {
            return
        } catch {
            print(error)
        }
    }
    
    private func updateNumLabel(with result: Double) {
        if let convertedNum = numberFormatter.string(for: result) {
            inputNumLabel.text = convertedNum
        }
    }
    
    // MARK: - 자동 스크롤
    
    private func scrollToBottom(_ scrollView: UIScrollView) {
            scrollView.layoutIfNeeded()
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.frame.height), animated: false)
        }
    
}

