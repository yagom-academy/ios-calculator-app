//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    private let numberFormatter = NumberFormatter()
    private var digitIsSelecting: Bool = false
    private var dotIsClicked: Bool = false
    private var calculatorContainer: String = NameSpace.whiteSpace
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuareUI()
    }
    
    private func configuareUI() {
        operandLabel.text = NameSpace.zero
        operatorLabel.text = NameSpace.whiteSpace
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
    }

    @IBAction func digitButtonTapped(_ sender: UIButton) {
        guard let lhs = operandLabel.text, let rhs = sender.currentTitle else { return }
        
        if dotIsClicked {
            operandLabel.text = lhs + rhs
        } else if digitIsSelecting {
            formatInDigitSelecting(lhs: lhs, rhs: rhs)
        } else {
            operandLabel.text = rhs
        }
        
        digitIsSelecting = true
    }
    
    private func formatInDigitSelecting(lhs: String, rhs: String) {
        guard let lhsInt = numberFormatter.number(from: lhs) as? Int, let rhsInt = Int(rhs) else { return }
        
        var digit: Int = .zero
        
        switch rhs {
        case NameSpace.zero:
            digit = lhsInt * 10
        case NameSpace.doubleZero:
            digit = lhsInt * 100
        default:
            digit = lhsInt * 10 + rhsInt
        }
        
        operandLabel.text = numberFormatter.string(for: digit)
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard let lhs = operandLabel.text, let rhs = sender.currentTitle else { return }
        
        guard !dotIsClicked else { return }
        
        operandLabel.text = lhs + rhs
        dotIsClicked = true
    }
    
    @IBAction func signChangedButton(_ sender: UIButton) {
        guard var digit = operandLabel.text, digit != NameSpace.zero else { return }
        
        if digit.first == Character(NameSpace.minus) {
            digit.removeFirst()
            operandLabel.text = digit
        } else {
            operandLabel.text = NameSpace.minus + digit
        }
    }
    
    @IBAction func operatorsButtonTapped(_ sender: UIButton) {
        addToCalculatorContainer()
        addEntry()
        
        operandLabel.text = NameSpace.zero
        operatorLabel.text = sender.currentTitle
        dotIsClicked = false
    }
    
    private func addEntry() {
        let index = stackView.arrangedSubviews.count - 1
        let addView = stackView.arrangedSubviews[index]
        let offset = CGPoint(x: scrollView.contentOffset.x,
                             y: scrollView.contentOffset.y + addView.frame.size.height)
        
        let newView = createEntry()
        stackView.insertArrangedSubview(newView, at: index)
        
        scrollView.contentOffset = offset
        scrollView.scrollRectToVisible(CGRect(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height , width: scrollView.bounds.size.width, height: scrollView.bounds.size.height), animated: false)
    }
    
    private func createEntry() -> UIView {
        let operand = numberFormatter.number(from: operandLabel.text ?? NameSpace.zero)
        let `operator` = operatorLabel.text
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        
        let operatorLabel = UILabel()
        operatorLabel.text = `operator`
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.textColor = .white
        operatorLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        operatorLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        let operandLabel = UILabel()
        operandLabel.text = numberFormatter.string(for: operand)
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operandLabel.textColor = .white
        
        stack.addArrangedSubview(operatorLabel)
        stack.addArrangedSubview(operandLabel)
        
        return stack
    }
    
    private func addToCalculatorContainer() {
        calculatorContainer += (operatorLabel.text ?? NameSpace.whiteSpace) + (operandLabel.text ?? NameSpace.whiteSpace)
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        operandLabel.text = NameSpace.zero
        digitIsSelecting = false
        dotIsClicked = false
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        addToCalculatorContainer()
        addEntry()
        
        let formula = ExpressionParser.parse(from: calculatorContainer)
        operandLabel.text = numberFormatter.string(for: formula.result())
        operatorLabel.text = NameSpace.whiteSpace
        calculatorContainer = NameSpace.whiteSpace
        digitIsSelecting = false
        dotIsClicked = false
    }
}
