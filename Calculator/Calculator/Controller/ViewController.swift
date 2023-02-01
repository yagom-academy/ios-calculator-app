//  Calculator - ViewController.swift
//  Created by 레옹아범.


import UIKit

class ViewController: UIViewController {
    
    private let numberFormatter = NumberFormatter()
    private var inputs: String = ""
    private var currentNumber: String = ""
    
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
        self.numberFormatter.roundingMode = .halfEven
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
        enteredStackView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        enteredStackView.axis = .horizontal
        enteredStackView.translatesAutoresizingMaskIntoConstraints = false
        enteredStackView.alignment = .fill
        enteredStackView.distribution = .fill
        enteredStackView.spacing = 8
        
        let operatorLabel = UILabel()
        operatorLabel.font = .preferredFont(forTextStyle: .title3)
        operatorLabel.text = operatorValue
        
        let numberLabel = UILabel()
        numberLabel.font = .preferredFont(forTextStyle: .title3)
        numberLabel.text = number
        
        enteredStackView.addArrangedSubview(operatorLabel)
        enteredStackView.addArrangedSubview(numberLabel)
        
        operatorLabel.trailingAnchor.constraint(equalTo: numberLabel.leadingAnchor).isActive = true
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
    
    func scrollToBottom() {
        if self.scrollView.contentSize.height < self.scrollView.bounds.size.height { return }
        self.scrollView.layoutIfNeeded()
        self.stackViewInScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
        self.scrollView.setContentOffset(bottomOffset, animated: true)
    }

    @IBAction private func didTapNumberButton(sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        self.currentNumber += buttonTitle
        self.currentNumberLabel.text = self.currentNumber
    }
    
    @IBAction private func didTapOperatorButton(sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        addStackView(number: self.currentNumber, operatorType: self.currentOperatorLabel.text)
        addInputs()
        
        self.currentOperatorLabel.text = buttonTitle
        resetCurrentNumberLabel()
        scrollToBottom()
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

