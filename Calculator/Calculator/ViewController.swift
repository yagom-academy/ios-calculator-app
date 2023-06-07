//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var calculationFormulaStackView: UIStackView!
    
    private let initialNumber = 0
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 빼기 : −
        // 음수 : -
        
        var formula = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parse(from: "-16*7+99+4")
    }
}

// MARK: - Button Action
extension ViewController {
    @IBAction func didTappedOperators(_ sender: UIButton) {
        if currentOperandLabel.text == "\(initialNumber)" {
            currentOperatorLabel.text = isFirstArithmeticFormula() ? "" : sender.currentTitle
            return
        }
        
        let arithmeticView = makeArithmeticView()
        
        calculationFormulaStackView.addArrangedSubview(arithmeticView)
        currentOperatorLabel.text = sender.currentTitle
        currentOperandLabel.text = "\(initialNumber)"
    }
    
    @IBAction func didTappedCalculate(_ sender: UIButton) {
        
    }
    
    @IBAction func didTappedNumbers(_ sender: UIButton) {
        guard let insertedNumber = sender.currentTitle else { return }
        let currentOperand = currentOperandLabel.text ?? "\(initialNumber)"
        
        currentOperandLabel.text = Int(currentOperand) == initialNumber ? insertedNumber : currentOperand + insertedNumber
    }
    
    @IBAction func didTappedMenus(_ sender: UIButton) {
        guard let insertedMenu = sender.currentTitle,
                let menu = Menus(rawValue: insertedMenu) else { return }
        
        switch menu {
        case .allCelar:
            clearCalculationFormulaStackView()
            currentOperatorLabel.text = ""
            fallthrough
        case .clearElement:
            currentOperandLabel.text = "\(initialNumber)"
        case .changeSign:
            changeOperandSign()
        }
    }
}

// MARK: - Calculate Method
extension ViewController {
    private func changeOperandSign() {
        guard let currentOperandString = currentOperandLabel.text,
              Int(currentOperandString) != initialNumber else { return }
        guard var currentOperand = Double(currentOperandString) else { return }

        currentOperand = -currentOperand
        currentOperandLabel.text = "\(currentOperand)"
    }
    
    private func makeArithmeticView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        let operandLabel = UILabel()
        let operatorLabel = UILabel()
        
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        operandLabel.textColor = .white
        operatorLabel.textColor = .white
        
        operandLabel.text = currentOperandLabel.text
        operatorLabel.text = currentOperatorLabel.text
        
        [operatorLabel, operandLabel].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }
    
    private func clearCalculationFormulaStackView() {
        calculationFormulaStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func isFirstArithmeticFormula() -> Bool {
        return calculationFormulaStackView.subviews.count == 0
    }
}
