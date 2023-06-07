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
        guard currentOperandLabel.text != "\(initialNumber)" else { return }
        // TODO: Insert StackView
        
        calculationFormulaStackView.backgroundColor = .blue
        let stackView = UIStackView()
        stackView.backgroundColor = .red
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        let operandLabel = UILabel()
        let operatorLabel = UILabel()
        
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        operandLabel.text = currentOperandLabel.text
        operatorLabel.text = currentOperatorLabel.text
        
        [operatorLabel, operandLabel].forEach { stackView.addArrangedSubview($0) }
        calculationFormulaStackView.addArrangedSubview(stackView)
        
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
            // TODO : All Clear
            currentOperandLabel.text = ""
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
}
