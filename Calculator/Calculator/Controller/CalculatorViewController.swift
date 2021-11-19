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
    
    func initailizeLabel() {
        inputNumLabel.text = initialNumLabel
        inputOperatorLabel.text = initialStringValue
    }
    
    func initializeFormulaStackView() {
        formulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func initializeNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
    }

    // MARK: - 숫자 버튼 입력
    @IBAction func tapNumberPad(_ sender: UIButton) {
        guard let currentNumLabel = inputNumLabel.text,
             let inputNum = sender.currentTitle else { return }
        
        if currentNumLabel == initialNumLabel {
            inputNumLabel.text = inputNum
        } else {
            updateInputNumLabel(currentNumLabel, with: inputNum)
        }
    }
    
    @IBAction func tapDotBtn(_ sender: UIButton) {
        if let currentNumLabel = inputNumLabel.text,
          let inputSign = sender.currentTitle,
         !currentNumLabel.contains(".") {
            updateInputNumLabel(currentNumLabel, with: inputSign)
        }
    }
    @IBAction func tapDoubleZeroBtn(_ sender: UIButton) {
        if let currentNumLabel = inputNumLabel.text,
          let inputNum = sender.currentTitle,
         currentNumLabel != initialNumLabel {
            updateInputNumLabel(currentNumLabel, with: inputNum)
        }
    }
    
    func updateInputNumLabel(_ currentNum: String, with input: String) {
        let numWithoutComma = currentNum.replacingOccurrences(of: ",", with: "")
        let updatedNum = numWithoutComma + input
        if let convertedNum = numberFormatter.string(for: Double(updatedNum)) {
            inputNumLabel.text = convertedNum
        }
    }
    
    // MARK: - 연산자 버튼 입력
    @IBAction func tapOperatorBtn(_ sender: UIButton) {
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
    
    func changeOperatorLabel(with input: String) {
        inputOperatorLabel.text = input
    }
    
    func addFormulaStackView() {
        let newFormulaStack = createFormulaStack()
        formulaStackView.addArrangedSubview(newFormulaStack)
        addStringFormula()
    }
    
    func addStringFormula() {
        guard let inputNum = inputNumLabel.text,
             let inputOperator = inputOperatorLabel.text else { return }
        
        let inputNumWithoutComma = inputNum.replacingOccurrences(of: ",", with: "")
        entireStringFormula += (inputOperator + inputNumWithoutComma)
    }
    
    // MARK: - 특수 버튼 입력
    @IBAction func tapACBtn(_ sender: UIButton) {
        initailizeLabel()
        entireStringFormula = initialStringValue
        initializeFormulaStackView()
    }
    
    @IBAction func tapCEBtn(_ sender: UIButton) {
        initailizeLabel()
    }
    
    @IBAction func tapPositiveNegativeBtn(_ sender: UIButton) {
        guard let currentNum = inputNumLabel.text,
             currentNum != initialNumLabel else { return }
        
        if currentNum.hasPrefix(negativeSign) {
            inputNumLabel.text = String(currentNum.dropFirst())
        } else {
            inputNumLabel.text = negativeSign + currentNum
        }
    }
    
    @IBAction func tapResultBtn(_ sender: UIButton) {
        guard entireStringFormula != initialStringValue else { return }
        
        addFormulaStackView()
        var formula = ExpressionParser.parse(from: entireStringFormula)
        do {
            let result = try formula.result()
            checkResultIsNaN(from: result)
            inputOperatorLabel.text = initialStringValue
            entireStringFormula = initialStringValue
        } catch CalculatorError.emptyQueue {
            return
        } catch {
            print(error)
        }
    }
    
    func checkResultIsNaN(from result: Double) {
        if result.isNaN {
            inputNumLabel.text = "NaN"
        } else {
            inputNumLabel.text = String(result)
        }
    }
    
}

