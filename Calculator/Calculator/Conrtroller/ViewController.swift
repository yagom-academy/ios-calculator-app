//
//  Calculator - ViewController.swift
//  Created by 써니쿠키.
//  Copyright © 써니쿠키. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var modifiableOperandLabel: UILabel!
    @IBOutlet weak var modifiableOperatorLabel: UILabel!
    @IBOutlet weak var overallOperationLabelStackView: UIStackView!
    
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
        overallOperationLabelStackView.subviews.forEach { $0.removeFromSuperview() }
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
            modifiableOperandLabel.text = String(result)
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
        let operationStackView = makeOperationStackVie()
        operationStackView.addArrangedSubview(makeOperatorLabel())
        operationStackView.addArrangedSubview(makeOperandLabel())

        overallOperationLabelStackView.insertArrangedSubview(operationStackView,at: overallOperationLabelStackView.arrangedSubviews.count)
    }
    
    func makeOperationStackVie() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        
        return stackView
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
    
}

