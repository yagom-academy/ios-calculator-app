//
//  Calculator - ViewController.swift
//  Created by Harry, Goat.
//  Copyright © yagom. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    
    private var calculateComponents: String = ""
    private var inputNumbers: String = ""
    
    @IBOutlet weak var numberOnField: UILabel!
    @IBOutlet weak var operatorOnField: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var historyStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func setUpScrollViewToBottom(){
        let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
        if(bottomOffset.y >= 0) {
            self.scrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        self.numberOnField.text = "0"
        self.calculateComponents = ""
        self.inputNumbers = ""
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        guard let currentNumber = self.numberOnField.text else {
            return
        }
        if currentNumber != "0" {
            self.numberOnField.text = "0"
        }
    }
    
    @IBAction func converToNegativeButtonTapped(_ sender: UIButton) {
        guard let currentNumber = self.numberOnField.text,
              currentNumber != "0" else { return }
        if currentNumber.contains("−") == true {
            numberOnField.text = currentNumber.trimmingCharacters(in: ["−"])
        } else {
            numberOnField.text = "−" + currentNumber
        }
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
        
        guard var currentNumberOnField = numberOnField.text else { return }
        guard let currentTitle = sender.currentTitle else { return }
        
        
        if currentNumberOnField != "0" {
            currentNumberOnField += currentTitle
            numberOnField.text = currentNumberOnField
        } else {
            numberOnField.text = currentTitle
        }
   
    }
        
        @IBAction func onehundredButtonTapped(_ sender: UIButton) {
            print("")
        }
        
        
        @IBAction func dotButtonTapped(_ sender: UIButton) {
            print("")
        }
        
        @IBAction func operatorButtonTapped(_ sender: UIButton) {
            
            guard let currentNumber = numberOnField.text else { return }
            guard let inputtedOperator = sender.titleLabel?.text else { return }
            guard let currentOper = operatorOnField.text else { return }
            
            operatorOnField.text = inputtedOperator
            if currentNumber == "0", currentNumber.last == "." {
                return
            } else if calculateComponents == "" {
                calculateComponents += currentNumber
                addHistoryEntry(left: "", right: currentNumber)
            } else {
                calculateComponents += currentOper + currentNumber
                addHistoryEntry(left: currentOper, right: currentNumber)
                self.numberOnField.text = ""
                
            }
            inputNumbers = ""
            numberOnField.text = "0"
            setUpScrollViewToBottom()
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

