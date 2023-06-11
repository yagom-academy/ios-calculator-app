//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var numberInputLabel: UILabel!
    @IBOutlet weak var operatorsLabel: UILabel!
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var firstOperatorLabel: UILabel!
    @IBOutlet weak var operatorStackView: UIStackView!
    
    private var isReset: Bool = false
    
    let operandQueue = CalculatorItemQueue<Double>()
    let operatorQueue = CalculatorItemQueue<Operator>()
    var defaultNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        if !isReset {
            isReset = true
            numberInputLabel.text = ""
        }
        
        guard let numberValue = sender.title(for: .normal) else { return }
        guard defaultNumber.count < 20 else { return }
        
        defaultNumber += numberValue
        numberInputLabel.text = defaultNumber
    }
    
    @IBAction func tapToggleSingButton(_ sender: UIButton) {
        toggleSign()
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        defaultNumber = ""
        operatorsLabel.text = ""
        numberInputLabel.text = "0"
        firstNumberLabel?.text = ""
        firstOperatorLabel?.text = ""
        operandQueue.removeAll()
        operatorQueue.removeAll()
        operatorStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        guard defaultNumber.count < 20,
              !defaultNumber.contains(".") else { return }
        
        defaultNumber += defaultNumber.isEmpty ? "0." : "."
        numberInputLabel.text = defaultNumber
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        if isReset {
            if let number = Double(defaultNumber) {
                operandQueue.enqueue(item: number)
                defaultNumber = ""
            }
            isReset = false
        }
        
        guard let operatorString = sender.titleLabel?.text,
              let selectedOperator = Operator(rawValue: Character(operatorString)) else {
            return
        }
        
        operatorsLabel.text = operatorString
        
        if operatorString == "÷" {
            if let lastOperand = operandQueue.lastItem, lastOperand == 0.0 {
                numberInputLabel.text = "NaN"
                return
            }
        }
        
        if let number = Double(defaultNumber) {
            operandQueue.enqueue(item: number)
            defaultNumber = ""
        }
        
        operatorQueue.enqueue(item: selectedOperator)
        
        let newOperatorLabel = UILabel()
        newOperatorLabel.text = operatorsLabel.text
        newOperatorLabel.textColor = .white
        newOperatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let newNumberLabel = UILabel()
        newNumberLabel.text = numberInputLabel.text
        newNumberLabel.textColor = .white
        newNumberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        if numberInputLabel.text?.isEmpty == true {
            firstOperatorLabel?.text = newOperatorLabel.text
            firstNumberLabel?.text = newNumberLabel.text
        }
        
        let containerView = UIView()
        containerView.addSubview(newOperatorLabel)
        containerView.addSubview(newNumberLabel)
        
        operatorStackView.addArrangedSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        newOperatorLabel.translatesAutoresizingMaskIntoConstraints = false
        newNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newOperatorLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            newOperatorLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            newOperatorLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            newNumberLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            newNumberLabel.leadingAnchor.constraint(equalTo: newOperatorLabel.trailingAnchor),
            newNumberLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            newNumberLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        operatorStackView.spacing = 0
        operatorStackView.layoutIfNeeded()
        scrollView.contentSize = operatorStackView.bounds.size
        
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height), animated: true)
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        if let number = Double(defaultNumber) {
            operandQueue.enqueue(item: number)
            defaultNumber = ""
        }
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        do {
            let result = try formula.result()
            updateNumberLabel(result)
        } catch {
            numberInputLabel.text = "Error"
            print(error)
        }
        
        operandQueue.removeAll()
        operatorQueue.removeAll()
    }
}


extension ViewController {
    func toggleSign() {
        guard let currentNumberString = numberInputLabel.text,
              var currentNumber = Double(currentNumberString) else {
            return
        }
        
        currentNumber *= -1
        numberInputLabel.text = "\(currentNumber)"
    }
    
    func updateNumberLabel(_ number: Double) {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) {
            numberInputLabel.text = formattedNumber
        }
    }
}
