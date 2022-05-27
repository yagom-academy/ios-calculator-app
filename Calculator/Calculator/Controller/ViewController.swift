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
    private var calculateStackCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        removeAllIn(stack: historyStackView!)
    }
    //MARK: - buttons
    
    @IBAction private func operandButtonDidTapped(_ sender: UIButton) {
        
        if screenLabel?.text == zero {
            screenLabel?.text = ""
        }
        screenLabel?.text = (screenLabel?.text ?? "") + (sender.currentTitle ?? "")
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
        
        if currentOperatorLabel?.text == "" {
            return
        }
        add(generateStackView(), to: historyStackView)
        currentOperatorLabel?.text = ""
        
        guard let historyStackView = historyStackView else { return }
        formula = ExpressionParser.parse(from: generateTextData(from: historyStackView, start: calculateStackCount))
        
        guard let existFormula = formula else { return }
        calculateStackCount += existFormula.operands.count
        
        do {
            let result = try formula?.result()
            screenLabel?.text = numberFormatter.string(for: result)
        } catch {
            if ((error as? FormulaError) != nil) {
                print("입력값을 추가하세요.")
            } else if ((error as? OperatorError) != nil) {
                screenLabel?.text = "NaN"
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
            currentOperatorLabel?.text = ""
            removeAllIn(stack: historyStackView)
        case "⁺⁄₋":
            guard let operand = screenLabel?.text else { return }
            guard screenLabel?.text != zero else { return }
            var operandText = operand
            operandText = operandText.removeEntire(character: ",")
            screenLabel?.text = numberFormatter.string(for: (Double(operandText) ?? 0) * -1)
        case "CE":
            screenLabel?.text = zero
        default:
            return
        }
    }
    //MARK: - methods
    
        stack.arrangedSubviews.forEach { stack.removeArrangedSubview($0) ; $0.isHidden = true }
    private func removeAllIn(stack: UIStackView) {
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
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.textColor = UIColor(white: 1, alpha: 1)
        stackViewElement.addArrangedSubview(operatorLabel)
        
        let operandLabel = UILabel()
        operandLabel.text = screenLabel?.text
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operandLabel.textColor = UIColor(white: 1, alpha: 1)
        stackViewElement.addArrangedSubview(operandLabel)
        
        return stackViewElement
    }
    
        guard let scrollView = scrollView else { return }
    private func setAttribute(to label: UILabel) {
    private func goToBottomOfScrollView() {
        scrollView.scrollRectToVisible(CGRect(x: 0,
                                              y: scrollView.contentSize.height - scrollView.bounds.height,
                                              width: scrollView.bounds.size.width,
                                              height: scrollView.bounds.size.height),
                                       animated: true)
    }
    
        var textData: String = ""
    private func generateTextData(from stackView: UIStackView, start: Int) -> String {
        for subStackView in stackView.arrangedSubviews[start...] {
            subStackView.subviews.forEach {
                if let label = $0 as? UILabel {
                    textData += " " + (label.text ?? "")
                    textData = textData.removeEntire(character: ",")
                }
            }
        }
        return textData
    }
}
