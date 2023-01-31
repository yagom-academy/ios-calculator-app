//  Calculator - ViewController.swift
//  Created by 레옹아범.


import UIKit

class ViewController: UIViewController {
    
    private let numberFormatter = NumberFormatter()
    private var currentNumber: String = "" {
        willSet {
            guard let value = Double(newValue),
                  let labelText = self.numberFormatter.string(from: NSNumber(floatLiteral: value)) else { return }
            
            self.currentNumberLabel.text = labelText
        }
    }
    private var inputs: String = ""
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var stackViewInScrollView: UIStackView!
    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNumberFormatter()
        
        resetCurrentNumberLabel()
        resetCurrentOperatorLabel()
    }
    
    func setNumberFormatter() {
        self.numberFormatter.numberStyle = .decimal
    }
    
    func resetCurrentNumberLabel() {
        self.currentNumber = ""
        self.currentNumberLabel.text = "0"
    }
    
    func resetCurrentOperatorLabel() {
        self.currentOperatorLabel.text = ""
    }
    
    func addStackView(number: String, operatorType: String?) {
        guard let operatorValue = operatorType else { return }
        
        let enteredStackView = UIStackView()
        enteredStackView.axis = .horizontal
        enteredStackView.translatesAutoresizingMaskIntoConstraints = false
        enteredStackView.alignment = .fill
        enteredStackView.distribution = .fill
        enteredStackView.spacing = 8
        
        let operatorLabel = UILabel()
        operatorLabel.text = operatorValue
        
        let numberLabel = UILabel()
        numberLabel.text = number
        
        enteredStackView.addArrangedSubview(operatorLabel)
        enteredStackView.addArrangedSubview(numberLabel)
        
        numberLabel.trailingAnchor.constraint(equalTo: enteredStackView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        
        self.stackViewInScrollView.addArrangedSubview(enteredStackView)
    }
    
    func removeAllStackView() {
        for stackView in self.stackViewInScrollView.arrangedSubviews {
            self.stackViewInScrollView.removeArrangedSubview(stackView)
        }
    }
    
    func addInputs() {
        guard let nowOperand = self.currentNumberLabel.text,
              let nowOperator = self.currentOperatorLabel.text else { return }
        
        self.inputs += "\(nowOperator) \(nowOperand) "
    }

    @IBAction private func didTapNumberButton(sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        self.currentNumber += buttonTitle
    }
    
    @IBAction private func didTapOperatorButton(sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        addStackView(number: self.currentNumber, operatorType: self.currentOperatorLabel.text)
        addInputs()
        
        self.currentOperatorLabel.text = buttonTitle
        resetCurrentNumberLabel()
    }
    
    @IBAction private func didTapClearButton(sender: UIButton) {
        resetCurrentNumberLabel()
    }
    
    @IBAction private func didTapAllClearButton(sender: UIButton) {
        removeAllStackView()
        resetCurrentNumberLabel()
        resetCurrentOperatorLabel()
        self.inputs = ""
    }
    
    @IBAction private func didTapCalculateButton(sender: UIButton) {
        addInputs()
        var formula: Formula = ExpressionParser.parse(from: self.inputs)
        let resultValue = formula.result()
        
        removeAllStackView()
        resetCurrentNumberLabel()
        resetCurrentOperatorLabel()
        self.inputs = ""
        self.currentNumberLabel.text = "\(resultValue)"
    }
}
