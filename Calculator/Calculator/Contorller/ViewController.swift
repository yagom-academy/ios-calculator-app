//
//  Calculator - ViewController.swift
//  Created by Harry, Goat.
//  Copyright © yagom. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    
    private var calculateComponents: String = ""
    private var inputNumbers: String = "0"
    private let inputManager: InputManager = InputManager()
    
    @IBOutlet weak var numberOnField: UILabel!
    @IBOutlet weak var operatorOnField: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var historyStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allClear()
    }
    
    
    private func setUpScrollViewToBottom(){
        let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
        if(bottomOffset.y >= 0) {
            self.scrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        allClear()
    }
    
    private func allClear() {
        self.numberOnField.text = "0"
        self.operatorOnField.text = ""
        self.calculateComponents = ""
        inputManager.currentNumber = "0"
        resetAllStackView()
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        self.numberOnField.text = "0"
        self.inputNumbers = "0"
    }
    
    @IBAction func converToNegativeButtonTapped(_ sender: UIButton) {
        numberOnField.text = inputManager.handleConvertSign()
    }
    
    @IBAction func calculateResultButtonTapped(_ sender: UIButton) {
        if inputNumbers == "" { return }
        
        guard let currentOperOnField = operatorOnField.text else { return }
        guard let currentNumberOnField = numberOnField.text else { return }
        
        calculateComponents += currentOperOnField + currentNumberOnField
        
        var resultByParse = ExpressionParser.parse(from: calculateComponents)
        
        let calculateResult = String(resultByParse.result())
        
        numberOnField.text = addCommaToThreeDigit(number: calculateResult)
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle else { return }

        numberOnField.text = inputManager.handleNumbers(input: currentTitle)
    }
    
    @IBAction func onehundredButtonTapped(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle else { return }
        
        numberOnField.text = inputManager.handleHundredNumber(input: currentTitle)
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard let dot = sender.currentTitle else { return }

        numberOnField.text = inputManager.handleDotSign(input: dot)
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let newOperator = sender.currentTitle else { return }
        
        guard inputManager.currentNumber != "0"  else {
            inputManager.currentOperator = newOperator
            operatorOnField.text = newOperator
            return
        }
        
        guard inputManager.currentNumber != "0",
              inputManager.currentNumber.last != "." else { return }
                
        operatorOnField.text = newOperator
        
        let result = inputManager.handleOperator()
        addHistoryEntry(left: result.operatorText, right: result.operandText)
        
        inputManager.currentNumber = "0"
        numberOnField.text = "0"
        inputManager.currentOperator = newOperator
    }
    
    private func addHistoryEntry(left: String, right: String) {
        let historyEntryStackView = HistoryEntryStackView(operatorText: left, operandText: right)
        
        historyEntryStackView.isHidden = true
        
        historyStackView.addArrangedSubview(historyEntryStackView)
        
        UIView.animate(withDuration: 0.3) {
            historyEntryStackView.isHidden = false
        }
        
        setUpScrollViewToBottom()
    }
    
    private func resetAllStackView() {
        historyStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func addCommaToThreeDigit(number: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let numberMappedToDouble = Double(number) else { return "" }
        guard let result = numberFormatter.string(from: NSNumber( value:numberMappedToDouble )) else { return "" }
        
        return result
    }
    
}

