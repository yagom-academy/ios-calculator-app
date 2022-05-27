//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var screenLabel: UILabel?
    @IBOutlet private weak var currentOperatorLabel: UILabel?
    @IBOutlet private weak var historyStackView: UIStackView?
    @IBOutlet private weak var historyScrollView: UIScrollView?
    
    private var formula: Formula?
    private let numberFormatter = NumberFormatter()
    private let zero = "0"
    private let emptyText = ""
    private var calculateStackCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.maximumIntegerDigits = 20
        removeAllIn(stack: historyStackView!)
    }
    //MARK: - buttons
    
    @IBAction private func operandButtonDidTapped(_ sender: UIButton) {
        
        if screenLabel?.text == zero {
            screenLabel?.text = emptyText
        }
        screenLabel?.text = (screenLabel?.text ?? emptyText) + (sender.currentTitle ?? emptyText)
    }
    
    @IBAction private func operatorButtonDidTapped(_ sender: UIButton) {
        
        if screenLabel?.text != zero {
            add(generateStackView(), to: historyStackView)
        }
        currentOperatorLabel?.text = sender.currentTitle
        screenLabel?.text = zero
        goToBottomOfScrollView()
    }
    
    @IBAction private func equalButtonDidTapped(_ sender: UIButton) {
        
        guard currentOperatorLabel?.text != emptyText else { return }
        add(generateStackView(), to: historyStackView)
        currentOperatorLabel?.text = emptyText
        
        guard let historyStackView = historyStackView else { return }
        formula = ExpressionParser.parse(from: generateTextData(from: historyStackView, start: calculateStackCount))
        
        guard let existFormula = formula else { return }
        calculateStackCount += existFormula.operands.count
        
        do {
            let result = try formula?.result()
            screenLabel?.text = numberFormatter.string(for: result)
        } catch {
            switch error as? CalculatorError {
            case .dividedByZero:
                screenLabel?.text = "NaN"
            case .notEnoughInput:
                print("입력값을 추가하세요.")
            case .emptyStack:
                print("Stack이 비었습니다")
            default:
                return
            }
        }
        goToBottomOfScrollView()
    }
    
    @IBAction private func functionButtonDidTapped(_ sender: UIButton) {
        
        guard let historyStackView = historyStackView else { return }
        
        switch sender.currentTitle {
        case "AC":
            calculateStackCount = 0
            screenLabel?.text = zero
            currentOperatorLabel?.text = emptyText
            removeAllIn(stack: historyStackView)
        case "⁺⁄₋":
            guard let operand = screenLabel?.text else { return }
            guard screenLabel?.text != zero else { return }
            var operandText = operand
            operandText.removeEntire(character: ",")
            screenLabel?.text = numberFormatter.string(for: (Double(operandText) ?? 0) * -1)
        case "CE":
            screenLabel?.text = zero
        default:
            return
        }
    }
    //MARK: - methods
    
    private func removeAllIn(stack: UIStackView) {
        stack.arrangedSubviews.forEach {
            stack.removeArrangedSubview($0)
            $0.isHidden = true
        }
    }
    
    private func add(_ subStack: UIStackView, to parentStack: UIStackView?) {
        parentStack?.addArrangedSubview(subStack)
        UIView.animate(withDuration: 0.2) {
            subStack.isHidden = false
        }
    }
    
    private func generateStackView() -> UIStackView {
        let stackViewElement = UIStackView()
        stackViewElement.axis = .horizontal
        stackViewElement.isHidden = true
        stackViewElement.spacing = 8
        
        let operatorLabel = UILabel()
        operatorLabel.text = currentOperatorLabel?.text
        setAttribute(to: operatorLabel)
        stackViewElement.addArrangedSubview(operatorLabel)
        
        let operandLabel = UILabel()
        operandLabel.text = screenLabel?.text
        setAttribute(to: operandLabel)
        stackViewElement.addArrangedSubview(operandLabel)
        
        return stackViewElement
    }
    
    private func setAttribute(to label: UILabel) {
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = UIColor(white: 1, alpha: 1)
    }
    
    private func goToBottomOfScrollView() {
        guard let scrollView = historyScrollView else { return }
        scrollView.scrollRectToVisible(CGRect(x: 0,
                                              y: scrollView.contentSize.height - scrollView.bounds.height,
                                              width: scrollView.bounds.size.width,
                                              height: scrollView.bounds.size.height),
                                       animated: true)
    }
    
    private func generateTextData(from stackView: UIStackView, start: Int) -> String {
        var textData = emptyText
        for subStackView in stackView.arrangedSubviews[start...] {
            subStackView.subviews.forEach {
                if let label = $0 as? UILabel {
                    textData += " " + (label.text ?? emptyText)
                    textData.removeEntire(character: ",")
                }
            }
        }
        return textData
    }
}
