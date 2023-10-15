//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    private var numberFormatter: NumberFormatter  = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter
    }()
    
    private var formulas: String = StringName.empty
    private var digitIsSelecting: Bool = false
    private var dotIsClicked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuareUI()
    }
    
    private func configuareUI() {
        operandLabel.text = StringName.zero
        operatorLabel.text = StringName.empty
    }

    @IBAction func digitButtonTapped(_ sender: UIButton) {
        guard let lhs = operandLabel.text, let rhs = sender.currentTitle, lhs.filter({ $0 != "," && $0 != "." }).count < 20 else { return }
        
        if dotIsClicked {
            operandLabel.text = lhs + rhs
        } else if digitIsSelecting {
            formatInDigitSelecting(lhs: lhs, rhs: rhs)
        } else {
            operandLabel.text = rhs
        }
        
        digitIsSelecting = true
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard let lhs = operandLabel.text, let rhs = sender.currentTitle else { return }
        
        guard !dotIsClicked else { return }
        
        operandLabel.text = lhs + rhs
        dotIsClicked = true
    }
    
    @IBAction func signChangedButton(_ sender: UIButton) {
        guard var digit = operandLabel.text, digit != StringName.zero else { return }
        
        if digit.hasPrefix(StringName.minus) {
            digit.removeFirst()
            operandLabel.text = digit
        } else {
            digit.appendFirst(StringName.minus)
            operandLabel.text = digit
        }
    }
    
    @IBAction func operatorsButtonTapped(_ sender: UIButton) {
        if !digitIsSelecting, operandLabel.text == StringName.zero {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        addToCalculatorContainer()
        addFomulaStackView()
        
        operandLabel.text = StringName.zero
        operatorLabel.text = sender.currentTitle
        
        resetState()
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        formulaStackView.arrangedSubviews.filter { !$0.isHidden }
                                        .forEach { $0.removeFromSuperview() }
        
        configuareUI()
        resetState()
        
        formulas = StringName.empty
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        operandLabel.text = StringName.zero
        
        resetState()
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard digitIsSelecting else { return }
        
        addToCalculatorContainer()
        addFomulaStackView()
        calculate()
        resetState()
    }
    
    private func calculate() {
        let formula = ExpressionParser.parse(from: formulas)
        
        operandLabel.text = formatToString(formula.result())
        operatorLabel.text = StringName.empty
        formulas = StringName.empty
    }
    
    private func formatInDigitSelecting(lhs: String, rhs: String) {
        guard let lhsDouble = formatToDouble(lhs), let rhsDouble = Double(rhs) else { return }
        
        var digit: Double = .zero
        
        switch rhs {
        case StringName.zero:
            digit = lhsDouble * 10
        case StringName.doubleZero:
            digit = lhsDouble * 100
        default:
            digit = lhsDouble * 10 + rhsDouble
        }
        
        operandLabel.text = formatToString(digit)
    }
    
    private func addFomulaStackView() {
        let index = formulaStackView.arrangedSubviews.count - 1
        let newView = createFomulaStackView()
        
        formulaStackView.insertArrangedSubview(newView, at: index)
        formulaScrollView.scrollDown()
    }
    
    private func createFomulaStackView() -> UIView {
        let operand = formatToDouble(operandLabel.text)
        let `operator` = operatorLabel.text
        
        let stackView = createStackView()
        let operatorLabel = createLabel(`operator`)
        let operandLabel = createLabel(numberFormatter.string(for: operand))
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        return stackView
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }
    
    private func createLabel(_ text: String?) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        
        return label
    }
    
    private func addToCalculatorContainer() {
        guard let operand = formatToDouble(operandLabel.text), let `operator` = operatorLabel.text else { return }
        
        if `operator` != StringName.empty, formulas == StringName.empty {
            formulas.append(StringName.zero)
        }
        
        formulas.append(`operator`)
        formulas.append(String(operand))
    }
    
    private func resetState() {
        digitIsSelecting = false
        dotIsClicked = false
    }
    
    private func formatToDouble(_ text: String?) -> Double? {
        guard let text = text else { return nil }
        
        return numberFormatter.number(from: text) as? Double
    }
    
    private func formatToString(_ number: Double?) -> String? {
        numberFormatter.string(for: number)
    }
}
