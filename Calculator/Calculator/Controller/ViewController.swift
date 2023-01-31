//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet weak var contentStack: UIStackView!
    
    private var workingSpace: String = ""
    private var operand = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        clearAllContentStack()
    }
    
    private func clearAllContentStack() {
        contentStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func setUp() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction private func numberButtonTapped(_ sender: UIButton) {
        if let number = sender.currentTitle {
            operand += number
        }
        
        operandLabel.text! = operand
    }
    
    @IBAction private func zeroAndCommaButtonTapped(_ sender: UIButton) {
        if operandLabel.text! == "0" {
            return
        }
        
        if let input = sender.currentTitle {
            operand += input
        }
        
        operandLabel.text! = operand
    }
    
    
    @IBAction private func chageSignButtonTapped(_ sender: UIButton) {
        if var operand = Int(operandLabel.text!) {
            operand = -operand
            operandLabel.text! = String(operand)
        } else if var operand = Double(operandLabel.text!) {
            operand = -operand
            operandLabel.text! = String(operand)
        }
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        operand = ""
        operandLabel.text! = "0"
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        if operatorLabel.text == "" && operandLabel.text! != "0" {
            let stackView = generateStackView(operandLabel.text, "")
            addContentStack(stackView)
            workingSpace += operandLabel.text!
            
            guard let `operator` = sender.currentTitle else { return }
            operatorLabel.text! = `operator`
            
            operand = ""
            operandLabel.text! = "0"
        } else if operatorLabel.text!.isEmpty && operandLabel.text! == "0" {
            return
        } else {
            if !operandLabel.text!.isEmpty && operandLabel.text! != "0" {
                let stackView = generateStackView(operandLabel.text, operatorLabel.text)
                addContentStack(stackView)
                workingSpace += operatorLabel.text! + operandLabel.text!
            }
            
            guard let `operator` = sender.currentTitle else { return }
            operatorLabel.text! = `operator`
            
            operand = ""
            operandLabel.text! = "0"
        }
    }
    
    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        let stackView = generateStackView(operandLabel.text, operatorLabel.text)
        addContentStack(stackView)
        workingSpace += operatorLabel.text! + operandLabel.text!
        print(workingSpace)
        var formula = ExpressionParser.parse(from: workingSpace)
        let result = formula.result()
        
        if result.isNaN {
            operandLabel.text! = "NaN"
            operatorLabel.text! = ""
            operand = ""
            workingSpace = ""
        } else {
            print(result)
            operandLabel.text! = useNumberFormatter(result)
            operatorLabel.text! = ""
            operand = ""
            workingSpace = ""
        }
    }
    
    @IBAction private func clearAllButtonTapped(_ sender: UIButton) {
        workingSpace = ""
        operand = ""
        setUp()
        clearAllContentStack()
    }
    
    private func useNumberFormatter(_ input: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        var result = numberFormatter.string(for: input) ?? "0"
        
        if result.count >= 20 {
            let index = result.index(result.startIndex, offsetBy: 19)
            result = String(result[...index])
        }
        
        return result
    }
    
    private func addContentStack(_ subview: UIStackView) {
        contentStack.addArrangedSubview(subview)
    }
    
    private func generateStackView(_ operandText: String?, _ operatorText: String?) -> UIStackView {
        let operandLabel = UILabel()
        operandLabel.text = operandText
        operandLabel.textColor = UIColor.white
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let operatorLabel = UILabel()
        operatorLabel.text = operatorText
        operatorLabel.textColor = UIColor.white
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        return stackView
    }
}
