//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operators: UILabel!
    @IBOutlet weak var operands: UILabel!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    private var saveFormula = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operands.text = "0"
        operators.text = ""
    }
    
    func formattingNumbers(_ input: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        numberFormatter.alwaysShowsDecimalSeparator = false
        
        return numberFormatter.string(from: input as NSNumber) ?? "NaN"
    }
    
    func addSubView(_ `operator`: String, _ operand: String) -> UIStackView {
        let operatorLabel: UILabel = {
            let label = UILabel()
            
            label.text = `operator`
            label.textColor = .white
            
            return label
        }()
        
        let operandLabel: UILabel = {
            let label = UILabel()
            
            label.text = operand
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .white
            
            return label
        }()
        
        let subStackView: UIStackView = {
            let stackView = UIStackView()
            
            stackView.axis = .horizontal
            stackView.spacing = 8
            stackView.addArrangedSubview(operatorLabel)
            stackView.addArrangedSubview(operandLabel)
            
            return stackView
        }()
        
        return subStackView
    }
    
    func addView(_ `operator`: String, _ operand: String) {
        stackView.axis = .vertical
        stackView.addArrangedSubview(addSubView(`operator`, operand))
    }
    
    //MARK: - Button Action
    @IBAction func tappedOperandsButton(_ sender: UIButton) {
        guard let operand = sender.currentTitle else {
            return
        }
        guard let operandString = operands.text, operandString != "0" else {
            operands.text = operand
            return
        }
        
        operands.text = operandString + operand
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else {
            return
        }
        
        if operands.text != "0" {
            guard let operatorString = operators.text else { return }
            guard let operandString = operands.text else { return }
            
            saveFormula.append("\(operatorString) ")
            saveFormula.append("\(operandString) ")
            addView(operatorString, operandString)
        }
        operators.text = `operator`
        operands.text = "0"
    }
    
    @IBAction func tappedResultButton(_ sender: Any) {
        guard let operatorString = operators.text else { return }
        guard let operandString = operands.text else { return }
        
        saveFormula.append("\(operatorString) ")
        saveFormula.append("\(operandString) ")
        addView(operatorString, operandString)
        
        var formula = ExpressionParser.parse(from: saveFormula.joined())
        
        let result = formula.result()
        operands.text = formattingNumbers(result)
        saveFormula = []
        operators.text = ""
        
    }
    
    @IBAction func tappedChangeMinusSignButton(_ sender: Any) {
        guard let operand = operands.text else { return
        }
        guard let operandsNumber = Double(operand) else {
            return
        }
        
        operands.text = formattingNumbers(operandsNumber * -1)
    }
    
    @IBAction func tappedCEButton(_ sender: Any) {
        operands.text = "0"
    }
    
    @IBAction func tappedACButton(_ sender: Any) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        operands.text = "0"
        operators.text = ""
    }
}

