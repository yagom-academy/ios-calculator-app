//
//  ViewController.swift
//  Created by Wonbi
//

import UIKit

class ViewController: UIViewController {
    private var isCalculated: Bool = false
    private var operandManager: OperandManager = OperandManager()
    private let componentMaker: ComponentMaker = ComponentMaker()
    
    @IBOutlet weak var mainOperandLabel: UILabel!
    @IBOutlet weak var mainOperatorLabel: UILabel!
    @IBOutlet weak var expressionQueue: UIStackView!
    @IBOutlet weak var expressionScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearOperandLabel()
        mainOperatorLabel.text = ""
        expressionQueue.arrangedSubviews.first?.removeFromSuperview()
        expressionScrollView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func tapOperandButton(_ sender: UIButton) {
        guard let tappedOperand = sender.currentTitle, mainOperandLabel.text?.count ?? 0 <= 18 else { return }
        if isCalculated { clearOperandLabel() }
        
        switch tappedOperand {
        case ".":
            operandManager.handleDotButton()
        case "0", "00":
            operandManager.handleZeroButtons(from: tappedOperand)
        default:
            operandManager.appendOperands(from: tappedOperand)
        }
        
        operandManager.displayOperand(to: mainOperandLabel)
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard operandManager.expression.isEmpty, isOnlyZeroAtMainFormulaView() else {
            guard isOnlyZeroAtMainFormulaView() else {
                updateFormulaType()
                addStackViewInFormulaHistoryView()
                resetMainFormulaView(sender)
                scrollToBottom()
                return
            }
            mainOperatorLabel.text = sender.currentTitle ?? ""
            return
        }
    }
    
    func isOnlyZeroAtMainFormulaView() -> Bool {
        guard let operandText = mainOperandLabel.text,
              operandText != "0" else { return true }
        return false
    }
    
    func updateFormulaType() {
        let operatorValue: String = mainOperatorLabel.text ?? ""
        let operandValue: String = mainOperandLabel.text?.components(separatedBy: ",").joined() ?? ""
        
        operandManager.appendToExpression(" " + operatorValue + " " + operandValue)
    }
    
    func addStackViewInFormulaHistoryView() {
        let stackView: UIStackView = UIStackView()
        stackView.spacing = 8
        
        let operandLabel: UILabel = UILabel()
        operandLabel.text = mainOperandLabel.text?.applyNumberFormatterAtFormulaHistoryView()
        
        let operatorLabel: UILabel = UILabel()
        operatorLabel.text = mainOperatorLabel.text
        
        [operatorLabel, operandLabel].forEach {
            $0.textColor = .white
            $0.font = UIFont.preferredFont(forTextStyle: .title3)
            stackView.addArrangedSubview($0)
        }
        
        expressionQueue.addArrangedSubview(stackView)
    }
    
    func scrollToBottom() {
        expressionScrollView.setContentOffset(
            CGPoint(
                x: 0,
                y: expressionScrollView.contentSize.height - expressionScrollView.bounds.height
            ), animated: false)
    }
    
    func resetMainFormulaView(_ sender: UIButton) {
        mainOperandLabel.text = "0"
        operandManager.setCurrentOperand("0")
        mainOperatorLabel.text = sender.currentTitle ?? ""
    }
    
    @IBAction func tapEqualsButton(_ sender: UIButton) {
        guard !operandManager.expression.isEmpty else { return }
        appendExpressionQueue()
        
        var components = ExpressionParser.parse(from: operandManager.expression)
        let result = components.result()
        
        if result.isNaN {
            mainOperandLabel.text = "NaN"
        } else {
            mainOperandLabel.text = String(result).addComma()
        }
        
        mainOperatorLabel.text = ""
        isCalculated = true
        operandManager.setCurrentOperand("\(result)")
        operandManager.clearExpression()
    }
    
    @IBAction func tapSignButton(_ sender: UIButton) {
        operandManager.handleSignButton()
        isCalculated = false
        mainOperandLabel.text = operandManager.currentOperand.addComma()
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
        clearOperandLabel()
    }

    @IBAction func tapACButton(_ sender: UIButton) {
        expressionQueue.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        clearOperandLabel()
        operandManager.clearExpression()
        mainOperatorLabel.text = ""
    }
}

// handling view
extension ViewController {
    private func clearOperandLabel() {
        isCalculated = false
        operandManager.setCurrentOperand("0")
        mainOperandLabel.text = "0"
    }

    private func appendExpressionQueue() {
        guard let currentOperator = mainOperatorLabel.text else { return }
        let stackView: UIStackView = componentMaker.makeStackView()
        
        if !expressionQueue.arrangedSubviews.isEmpty {
            let operatorLabel: UILabel = componentMaker.makeLabel(currentOperator)
            stackView.addArrangedSubview(operatorLabel)
            operandManager.appendToExpression(" \(currentOperator)")
        }
        let operandLabel: UILabel = componentMaker.makeLabel(operandManager.currentOperand.addComma())
        stackView.addArrangedSubview(operandLabel)
        operandManager.appendToExpression(" \(operandManager.currentOperand)")
        
        expressionQueue.addArrangedSubview(stackView)
        updateScroll()
    }
    
    func updateScroll() {
        expressionScrollView.layoutIfNeeded()
        expressionScrollView.setContentOffset(CGPoint(x: 0,
                                                      y: expressionScrollView.contentSize.height - expressionScrollView.bounds.height),
                                              animated: false)
    }
}
