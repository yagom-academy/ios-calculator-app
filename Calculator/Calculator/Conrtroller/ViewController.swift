//
//  Calculator - ViewController.swift
//  Created by 써니쿠키.
//  Copyright © 써니쿠키. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var modifiableOperandLabel: UILabel!
    @IBOutlet weak var modifiableOperatorLabel: UILabel!
    @IBOutlet weak var operationsStackView: UIStackView!    
    @IBOutlet weak var operationsScrollView: UIScrollView!
    
    var overallOperation: String = ""
    var result: Double = 0.0
    var operand: String = "" {
        willSet {
            guard newValue != "" else {
                modifiableOperandLabel.text = "0"
                return
            }
        
            modifiableOperandLabel.text = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        
        switch number {
        case "0", "00":
            guard operand != "0" else { return }
        default:
            if operand == "0" {
                operand.removeFirst()
            }
        }
        
        operand += number
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard operand != "" else {
            modifiableOperatorLabel.text = sender.titleLabel?.text
            return
        }
        collecOperation()
        MakeOperationStackView()
        scrollTobottom()
        operand = ""
        modifiableOperatorLabel.text = sender.titleLabel?.text
    }
    
    @IBAction func touchUpPositiveNegativeNumberButton() {
        if operand.prefix(1) == "-" {
            operand.removeFirst()
        } else {
            operand.insert("-", at: operand.startIndex)
        }
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        operand = ""
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        operationsStackView.subviews.forEach { $0.removeFromSuperview() }
        overallOperation = ""
        operand = ""
        modifiableOperatorLabel.text = " "
    }
    
    @IBAction func touchUpEqualSignButton(_ sender: UIButton) {
        guard modifiableOperandLabel.text != String(result) else { return }
        
        collecOperation()
        MakeOperationStackView()
        operand = ""
        
        do {
            var formula = ExpressionParser.parse(from: overallOperation)
            result = try formula.result()
            modifiableOperandLabel.text = String(changeStyle(result))
        } catch CalculatorError.divideByZeroError {
            modifiableOperandLabel.text = "NaN"
        } catch {
            modifiableOperandLabel.text = "Error: Please retry"
        }
    }
    
    func collecOperation() {
        guard let`operator` = modifiableOperatorLabel.text,
              let operand = modifiableOperandLabel.text else {
            return
        }
        if `operator` == " " {
            overallOperation += ("+" + operand)
        } else {
            overallOperation += (`operator` + operand)
        }
    }
    
    func MakeOperationStackView() {
        let operationStackView = UIStackView()
        operationStackView.axis = .horizontal
        operationStackView.translatesAutoresizingMaskIntoConstraints = false
        operationStackView.distribution = .fill
        operationStackView.alignment = .fill
        operationStackView.spacing = 8
        
        let operatorLabel = makeOperatorLabel()
        
        operationStackView.addArrangedSubview(operatorLabel)
        operationStackView.addArrangedSubview(makeOperandLabel())
        
        operationsStackView.insertArrangedSubview(operationStackView,at: operationsStackView.arrangedSubviews.count)
    }
    
    func scrollTobottom() {
        operationsScrollView.layoutIfNeeded()
        operationsScrollView.setContentOffset(CGPoint(x: 0, y: operationsScrollView.contentSize.height - operationsScrollView.bounds.height), animated: false)
    }
    
    func makeOperandLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = modifiableOperandLabel.text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh , for: .horizontal)
        
        return label
    }
    
    func makeOperatorLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = modifiableOperatorLabel.text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }
    
    func changeStyle(_ operationResult: Double) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .up
        
        let result = numberFormatter.string(from: operationResult as NSNumber) ?? "0"
        
        return result
    }
}

