//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputedOperatorLabel: UILabel!
    @IBOutlet weak var inputedOperandLabel: UILabel!
    @IBOutlet weak var toBeCalculateFormulaStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var inputDotButton: UIButton!
    @IBOutlet weak var inputZeroZeroButton: UIButton!
    @IBOutlet weak var inputZeroButton: UIButton!
    @IBOutlet weak var inputOneButton: UIButton!
    @IBOutlet weak var inputTwoButton: UIButton!
    @IBOutlet weak var inputThreeButton: UIButton!
    @IBOutlet weak var inputFourButton: UIButton!
    @IBOutlet weak var inputFiveButton: UIButton!
    @IBOutlet weak var inputSixButton: UIButton!
    @IBOutlet weak var inputSevenButton: UIButton!
    @IBOutlet weak var inputEightButton: UIButton!
    @IBOutlet weak var inputNineButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var cleanEntry: UIButton!
    @IBOutlet weak var convertPositiveOrNegativeNumber: UIButton!
    
    var fomula: String = ""
    var operand: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputedOperandLabel.text = "0"
    }
    
    @IBAction private func numberDidTap(_ sender: UIButton) {
        operand += operands(for: sender)
        inputedOperandLabel.text = numberFormatterFor(inputOperand: operand)
    }
    
    @IBAction private func operatorDidTap(_ sender: UIButton) {
        guard let operatorLabelText = inputedOperatorLabel.text else {
            return
        }
        let operandLabelText = numberFormatterFor(numberForCalculate: operand)
        let stackView = makeStackView(operatorLabelText: operatorLabelText, operandLabelText: operandLabelText)
        
        fomula += operand
        fomula += " \(operatorLabelText) "
        operand = ""
        inputedOperandLabel.text = "0"
        
        toBeCalculateFormulaStackView.addArrangedSubview(stackView)
        inputedOperatorLabel.text = operators(for: sender)
        
        scrollToBottom()
    }
    
    func scrollToBottom() {
        scrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height)
        
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    @IBAction func convertPositiveOrNegative(_ sender: UIButton) {
        if let doubleOperand = Double(operand), doubleOperand != 0 {
            operand = String(doubleOperand * -1)
        }
        inputedOperandLabel.text = operand
    }
    
    @IBAction func equalButtonDidTap(_ sender: UIButton) {
        guard let operatorLabelText = inputedOperatorLabel.text else {
            return
        }
        let operandLabelText = numberFormatterFor(numberForCalculate: operand)
        let stackView = makeStackView(operatorLabelText: operatorLabelText, operandLabelText: operandLabelText)
        
        fomula += " \(operatorLabelText) "
        fomula += operand
        operand = ""
        inputedOperatorLabel.text = ""
        
        toBeCalculateFormulaStackView.addArrangedSubview(stackView)
        showCalculateResult()
    }
    
    func showCalculateResult() {
        var parser = ExpressionParser.parse(from: fomula)
        
        do{
            inputedOperandLabel.text = numberFormatterFor(numberForCalculate: try String(parser.result()))
        } catch CalculateError.NotANumber {
            inputedOperandLabel.text = "NaN"
        } catch let error {
            print(error)
        }
    }
    
    func makeStackView(operatorLabelText: String?, operandLabelText: String?) -> UIStackView {
        let stackView = UIStackView()
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        stackView.spacing = 8
        
        operandLabel.text = operandLabelText
        operatorLabel.text = operatorLabelText
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        return stackView
    }
    
    func removeSubView(from stackView: UIStackView) {
        for view in stackView.subviews {
            view.removeFromSuperview()
        }
    }
    
    @IBAction func allClearDidTap(_ sender: UIButton) {
        fomula = ""
        operand = ""
        inputedOperatorLabel.text = ""
        inputedOperandLabel.text = "0"
        removeSubView(from: toBeCalculateFormulaStackView
        )
    }
    
    @IBAction func cleanEntryDidTap(_ sender: UIButton) {
        operand = ""
        inputedOperandLabel.text = "0"
    }
    
    private func numberFormatterFor(numberForCalculate: String) -> String? {
        guard let numberForCalculate = Double(numberForCalculate) else {
            return ""
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 15
        
        return numberFormatter.string(for: numberForCalculate)
    }
    
    private func numberFormatterFor(inputOperand: String) -> String? {
        guard let operand = Double(inputOperand) else {
            return ""
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 15
        
        if inputOperand.contains(".") {
            let dotFront = inputOperand.split(with: ".")[0]
            
            if inputOperand.split(with: ".").count == 1 {
                return dotFront + "."
            }
            
            guard let formattedDotFront = numberFormatter.string(for: Double(dotFront)) else {
                return nil
            }
            let dotBack = inputOperand.split(with: ".")[1]
            
            return formattedDotFront + "." + dotBack
        }

        return numberFormatter.string(for: operand)
    }
    
    private func operators(for buttton: UIButton) -> String {
        switch buttton {
        case addButton:
            return "+"
        case subtractButton:
            return "-"
        case divideButton:
            return "÷"
        case multiplyButton:
            return "×"
        default:
            return ""
        }
    }
    
    private func operands(for button: UIButton) -> String {
        switch button {
        case inputDotButton:
            return "."
        case inputZeroButton:
            return "0"
        case inputZeroZeroButton:
            return "00"
        case inputOneButton:
            return "1"
        case inputTwoButton:
            return "2"
        case inputThreeButton:
            return "3"
        case inputFourButton:
            return "4"
        case inputFiveButton:
            return "5"
        case inputSixButton:
            return "6"
        case inputSevenButton:
            return "7"
        case inputEightButton:
            return "8"
        case inputNineButton:
            return "9"
        default:
            return ""
        }
    }
}

