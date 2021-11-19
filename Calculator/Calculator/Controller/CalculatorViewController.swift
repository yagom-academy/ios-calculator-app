//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var calculationHistoryStackView: UIStackView!
    @IBOutlet weak var calculationHistoryScrollView: UIScrollView!
    
    private var rawOperand = "0"
    private var checkNumberOfInputs: Bool {
        if rawOperand.components(separatedBy: [",", "-"]).joined().count <= 14 {
            return true
        } else {
            return false
        }
    }
    private let calculatorController = CalculatorController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalcurator()
    }
    
    @IBAction func touchUpNumberPadButton(_ sender: UIButton) {
        guard checkNumberOfInputs else {
            return
        }
        
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        rawOperand = rawOperand + number
        operandLabel.text = changeNumberFormatter(insertedNumber: number)
    }
    
    @IBAction func touchUpDecimalPointButton(_ sender: UIButton) {
        guard !rawOperand.contains(".") else {
            return
        }
        
        rawOperand = rawOperand + "."
        operandLabel.text = rawOperand
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        rawOperand = "0"
        
        guard operandLabel.text != "0" else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        
        if calculationHistoryStackView.subviews.isEmpty {
            operatorLabel.text = ""
        }
        
        addFormula()
        operatorLabel.text = sender.titleLabel?.text
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpTogglePlusMinusButton(_ sender: UIButton) {
        guard rawOperand != "0" else {
            return
        }
        
        if rawOperand.contains("-") {
            rawOperand.remove(at: rawOperand.startIndex)
        } else {
            rawOperand.insert("-", at: rawOperand.startIndex)
        }
        
        operandLabel.text = rawOperand
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        resetCalcurator()
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        clearEntry()
    }
    
    @IBAction func touchUPEqualButton(_ sender: UIButton) {
        if operatorLabel.text == "" {
            return
        }
        addFormula()
        operatorLabel.text = ""
        operandLabel.text = calculatorController.calculate()
    }
    
    func resetCalcurator() {
        rawOperand = "0"
        operandLabel.text = rawOperand
        operatorLabel.text = ""
        allClear()
    }
    
    func addFormula() {
        let stackView = UIStackView()
        
        guard let `operator` = operatorLabel.text,
                let operand = operandLabel.text  else {
            return
        }
        
        labelFormat(textValue: `operator`)
        labelFormat(textValue: operand)
        
        func labelFormat(textValue: String) {
            let label = calculatorHistoryUILbel(text: textValue)
            stackView.addArrangedSubview(label)
        }
        
        calculationHistoryStackView.addArrangedSubview(stackView)
        
        calculatorController.insertFormula(operator: `operator`,
                                           operand: operand.components(separatedBy: [","]).joined())
        
        autoScrollDown()
    }
    
    func allClear() {
        for subview in calculationHistoryStackView.subviews {
            subview.removeFromSuperview()
        }
        calculatorController.resetFormula()
    }
    
    func clearEntry() {
        rawOperand = "0"
        operandLabel.text = rawOperand
    }
    
    func autoScrollDown() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1 ) {
            self.calculationHistoryScrollView
                .scrollRectToVisible(CGRect(x: 0,
                                            y: self.calculationHistoryScrollView.contentSize.height
                                                - self.calculationHistoryScrollView.bounds.height,
                                            width: self.calculationHistoryScrollView.bounds.size.width,
                                            height: self.calculationHistoryScrollView.bounds.size.height),
                                     animated: true)
        }
    }
    
    func changeNumberFormatter(insertedNumber: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 15

        guard let number = Double(rawOperand),
              let result = numberFormatter.string(from: NSNumber(value: number)) else {
            return ""
        }
        
        if rawOperand.contains(".") {
            if insertedNumber == "0" || insertedNumber == "00" {
                return rawOperand
            }
        }
        return result
    }
}
