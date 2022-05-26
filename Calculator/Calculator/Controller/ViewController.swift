//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberInput: UILabel!
    @IBOutlet weak var operatorInput: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lastInput: UIStackView!
    
    private var totalInput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetNumberInput()
        resetOperatorInput()
        resetTotalInput()
        clearLastInput()
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard lastInput.arrangedSubviews.count <= 0 || operatorInput.text != "" else {
            clearLastInput()
            
            numberInput.text = sender.currentTitle
            return
        }
        
        let digit = sender.currentTitle
        
        guard var text = numberInput.text else {
            return
        }
        
        guard digit != "." || text.filter({ $0 == "." }).count < 1 else {
            return
        }
        
        guard let unwrappedDigit: String = digit else {
            return
        }
            
        text += unwrappedDigit
        numberInput.text = text

        
        guard text.contains(".") == false else {
            return
        }
        
        guard let convertedNumberInput = convertNumberInput() else {
            return
        }
        
        formatCalculatorItems(number: convertedNumberInput)
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard numberInput.text != "0" || lastInput.arrangedSubviews.count > 0 else {
            return
        }
        
        guard let text = numberInput.text else {
            return
        }
        
        guard Double(text) != 0.0 else {
            return
        }
        
        if operatorInput.text == "" && lastInput.arrangedSubviews.count > 0 {
            clearLastInput()
        }
        
        operatorInput.text = sender.currentTitle
        resetNumberInput()
    }
    
    @IBAction func touchResultButton(_ sender: UIButton) {
    }
    
    @IBAction func touchAllClearButton(_ sender: UIButton) {
    }
    
    @IBAction func touchClearEntryButton(_ sender: UIButton) {
    }
    
    @IBAction func touchSignChangerButton(_ sender: UIButton) {
    }
    
    func resetNumberInput() {
        numberInput.text = "0"
    }
    
    func resetOperatorInput() {
        operatorInput.text = ""
    }
    
    func resetTotalInput() {
        totalInput = ""
    }
    
    func clearLastInput() {
        while lastInput.arrangedSubviews.count > 0 {
            guard let lastView = lastInput.arrangedSubviews.last else {
                return
            }

            lastInput.removeArrangedSubview(lastView)
            lastView.removeFromSuperview()
        }
    }
    
    func convertNumberInput() -> Double? {
        guard let text = numberInput.text else {
            return nil
        }
        
        let trimmedNumberInput = text.replacingOccurrences(of: ",", with: "")
        
        guard let trimmedNumberInputToDouble = Double(trimmedNumberInput) else {
            return nil
        }
        
        return trimmedNumberInputToDouble
    }
    
    func formatCalculatorItems(number: Double) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.maximumIntegerDigits = 20
        
        guard let formattedResult = numberFormatter.string(from: number as NSNumber) else {
            return
        }
        
        numberInput.text = formattedResult
    }
}
