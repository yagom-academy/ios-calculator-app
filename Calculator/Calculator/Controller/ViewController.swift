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
        
    }
    
    func setNumberFormatter() {
        self.numberFormatter.numberStyle = .decimal
        self.numberFormatter.roundingMode = .halfEven
    }
    
    @IBAction private func didTapButton(sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        switch buttonTitle {
        case "AC":
        case "CE":
        case "⁺⁄₋":
        case "÷", "×", "−", "+":
        case "0", "00":
        case ".":
        default:
        }
    }

}

extension ViewController {
    func addStackView(number: String?, operatorType: String?) {
        guard let operandValue = number,
              let operatorValue = operatorType else { return }
        
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
        
        let operandLabel = UILabel()
        operandLabel.font = .preferredFont(forTextStyle: .title3)
        operandLabel.text = operandValue
        
        enteredStackView.addArrangedSubview(operatorLabel)
        enteredStackView.addArrangedSubview(operandLabel)
        
        operandLabel.trailingAnchor.constraint(equalTo: enteredStackView.trailingAnchor, constant: 0).isActive = true
        operandLabel.topAnchor.constraint(equalTo: enteredStackView.topAnchor, constant: 0).isActive = true
        operandLabel.bottomAnchor.constraint(equalTo: enteredStackView.bottomAnchor, constant: 0).isActive = true
        
        operatorLabel.leadingAnchor.constraint(equalTo: enteredStackView.leadingAnchor, constant: 0).isActive = true
        operatorLabel.topAnchor.constraint(equalTo: enteredStackView.topAnchor, constant: 0).isActive = true
        operatorLabel.bottomAnchor.constraint(equalTo: enteredStackView.bottomAnchor, constant: 0).isActive = true
        
        self.stackViewInScrollView.addArrangedSubview(enteredStackView)
    }
    
    func removeAllStackView() {
        let allSubViewsInStackVIew = self.stackViewInScrollView.arrangedSubviews
        for stackView in allSubViewsInStackVIew {
            self.stackViewInScrollView.removeArrangedSubview(stackView)
        }
    }
    
    func scrollToBottom() {
        if self.scrollView.contentSize.height < self.scrollView.bounds.size.height { return }
        self.scrollView.layoutIfNeeded()
        self.stackViewInScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
        self.scrollView.setContentOffset(bottomOffset, animated: true)
    }
}
