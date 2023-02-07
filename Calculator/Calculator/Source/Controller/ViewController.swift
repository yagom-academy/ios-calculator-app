//
//  Calculator - ViewController.swift
//  Created by Harry, Goat.


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
        allClear()
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        guard let Inputtedtitle = sender.titleLabel?.text else { return }
        
        switch Inputtedtitle {
        case "=":
            calculateResult()
        case "AC":
            allClear()
        case "CE":
            clearEntryButtonTapped()
        case "⁺⁄₋":
            convertToNegativeNumberButton()
        case "÷", "×", "−", "+":
            operatorButtonTapped(sender: sender)
        case "0","1","2","3","4","5","6","7","8","9","00",".":
            numberButtonTapped(sender: sender)
        default:
            return
        }
    }
    
    private func setUpScrollViewToBottom(){
        let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
        if(bottomOffset.y >= 0) {
            self.scrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    private func allClear() {
        self.numberOnField.text = "0"
        self.calculateComponents = ""
        self.inputNumbers = ""
        resetAllStackView()
    }
    
    private func clearEntryButtonTapped(){
        guard let currentNumber = self.numberOnField.text else {
            return
        }
        if currentNumber != "0" {
            self.numberOnField.text = "0"
        }
    }
    
    private func convertToNegativeNumberButton(){
        guard let currentNumber = self.numberOnField.text,
              currentNumber != "0" else { return }
        if currentNumber.contains("−") == true {
            numberOnField.text = currentNumber.trimmingCharacters(in: ["−"])
        } else {
            numberOnField.text = "−" + currentNumber
        }
    }
    
    private func calculateResult(){
        if inputNumbers == "" { return }
  
        guard let currentOperOnField = operatorOnField.text else { return }
        guard let currentNumberOnField = numberOnField.text else { return }
        
        calculateComponents += currentOperOnField + currentNumberOnField
        
        var resultByParse = ExpressionParser.parse(from: calculateComponents)

        allClear()
        let calculateResult = String(resultByParse.result())
        
        numberOnField.text = addCommaToThreeDigit(number: calculateResult)
    }
    
    private func numberButtonTapped(sender: UIButton) {
        
        switch sender.tag {
        case 1: inputNumbers += "1"
        case 2: inputNumbers += "2"
        case 3: inputNumbers += "3"
        case 4: inputNumbers += "4"
        case 5: inputNumbers += "5"
        case 6: inputNumbers += "6"
        case 7: inputNumbers += "7"
        case 8: inputNumbers += "8"
        case 9: inputNumbers += "9"
        case 0: inputNumbers += "0"
        case 100: inputNumbers += "00"
        case 101:
            if inputNumbers.contains(".") == false {
                inputNumbers += "."
            }
        default:
            return
        }
        numberOnField.text = inputNumbers
        
    }
    
    private func operatorButtonTapped(sender: UIButton) {
        
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

