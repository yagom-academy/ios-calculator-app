//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UIButton Outlet
    @IBOutlet var operandsButton: [UIButton]!
    @IBOutlet var operatorsButton: [UIButton]!
    @IBOutlet var zeroButton: [UIButton]!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearEntryButton: UIButton!
    @IBOutlet weak var changSignButton: UIButton!
    @IBOutlet weak var calculationButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    //MARK: - UILabel Outlet
    @IBOutlet weak var inputOperandsLabel: UILabel!
    @IBOutlet weak var inputOperatorsLabel: UILabel!
    @IBOutlet var stackView: UIStackView!
    
    enum Sign {
        static let dot = "."
        static let blank = " "
        static let nothing = ""
        static let minus = "-"
        static let zero = "0"
    }
    
    var currentOperand: String {
        return inputOperandsLabel.text ?? Sign.zero
    }
    var currentOperator: String {
        return inputOperatorsLabel.text ?? Sign.nothing
    }
    var currentInputFormula: [String] = []
    var oldInputFormula: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    func reset() {
        inputOperandsLabel.text = Sign.zero
        inputOperatorsLabel.text = Sign.nothing
    }
    
    func makeStackView(_ operatorSign: String, _ operand: String) -> UIStackView {
        let view = UIStackView()
        let operandLabel = UILabel()
        let operatorLabel = UILabel()
        
        operatorLabel.text = operatorSign
        operatorLabel.textColor = .white
        operandLabel.text = operand
        operandLabel.textColor = .white
        
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 8
        
        view.addArrangedSubview(operatorLabel)
        view.addArrangedSubview(operandLabel)
        //[operatorLabel, operandLabel].forEach(view.addArrangedSubview(_:))
        
        return view
    }
    
    @IBAction func operandsButtonDidTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        
        if currentOperand == Sign.zero {
            inputOperandsLabel.text = number
        } else {
            inputOperandsLabel.text = currentOperand + number
        }
    }
    
    @IBAction func operatorsButtonDidTapped(_ sender: UIButton) {
        var newStackView: UIStackView = UIStackView()
        
        guard let currentSign = sender.currentTitle else { return }

        if inputOperandsLabel.text == Sign.zero {
            inputOperatorsLabel.text = currentSign
        } else {
            newStackView = makeStackView(currentOperator, currentOperand)
            stackView.addArrangedSubview(newStackView)
            
            if currentOperator == "" {
                currentInputFormula.append(currentOperand)
            } else {
                currentInputFormula.append(currentOperator)
                currentInputFormula.append(currentOperand)
            }
            
            inputOperatorsLabel.text = currentSign
            inputOperandsLabel.text = Sign.zero
        }
        
        print("스택뷰 연산자: \(currentSign)")
        print("스택뷰 피연산자: \(currentInputFormula)")
    }
    
    @IBAction func dotButtonDidTapped(_ sender: UIButton) {
        if let lastElement = currentInputFormula.last {
            if lastElement.hasSuffix(".") {
                print("lastElement: \(lastElement)")
            } else {
                currentInputFormula[currentInputFormula.count-1] += Sign.dot
            }
        } else if currentInputFormula.isEmpty {
            currentInputFormula.append(Sign.zero + Sign.dot)
            print(currentInputFormula)
        }
    }
    
    @IBAction func calculationButtonDidTapped(_ sender: UIButton) {
        let newStackView = makeStackView(currentOperator, currentOperand)
        
        stackView.addArrangedSubview(newStackView)
        currentInputFormula.append(currentOperator)
        currentInputFormula.append(currentOperand)
        
        let stringFormula = currentInputFormula.joined(separator: " ")
        var parsedFormula = ExpressionParser.parse(from: stringFormula)
        let result = parsedFormula.result()

        inputOperandsLabel.text = String(result)
        oldInputFormula.append(String(result))
    }
    
    @IBAction func allClearButtonDidTapped(_ sender: UIButton) {
        reset()
        currentInputFormula = []
        oldInputFormula = []
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction func changeSignButtonDidTapped(_ sender: UIButton) {
        guard currentOperand != "0" else { return }
        
        if currentOperand.hasPrefix("-") {
            inputOperandsLabel.text = currentOperand.trimmingCharacters(in: ["-"])
        } else {
            inputOperandsLabel.text = Sign.minus + currentOperand
        }
    }
    
    @IBAction func clearEntryButtonDidTapped(_ sender: UIButton) {
        inputOperandsLabel.text = Sign.zero
    }
}
