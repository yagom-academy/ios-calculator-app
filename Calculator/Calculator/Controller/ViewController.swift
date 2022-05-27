//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var displayNumber: UILabel!
    @IBOutlet private weak var displayOperator: UILabel!
    @IBOutlet private weak var recentInputStackView: UIStackView!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    private let zeroString = "0"
    private let emptyString = ""
    private var calculateItems = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeAllStackView(recentInputStackView)
        displayNumber.text = zeroString
        displayOperator.text = emptyString
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
    }
    
    private func removeAllStackView(_ stack: UIStackView) {
        stack.arrangedSubviews.forEach {
            stack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    @IBAction private func operandButtonDidTapped(_ sender: UIButton) {
        guard displayNumber.text != zeroString else {
            displayNumber.text = emptyString
            displayNumber.text = sender.currentTitle ?? emptyString
            return
        }
        
        guard displayOperator.text != emptyString || recentInputStackView.arrangedSubviews.count == 0
        else {
            return
        }
        
        let currentDisplay = displayNumber.text
        displayNumber.text = currentDisplay! + sender.currentTitle!
    }

    private func addSubView() {
        let lastInputStackView = generateStackView()
        recentInputStackView.addArrangedSubview(lastInputStackView)
        lastInputStackView.isHidden = false
    }
    
    @IBAction private func operatorButtonDidTapped(_ sender: UIButton) {
        guard displayNumber.text != zeroString else {
            return
        }
        
        if displayOperator.text == emptyString {
            addSubView()

            calculateItems +=  displayNumber.text!
            displayOperator.text = sender.currentTitle!
            displayNumber.text = zeroString
            return
        }
        
        addSubView()
        scrollToBottom()
    
        calculateItems += " " + displayOperator.text!
        calculateItems += " " + displayNumber.text!
        displayOperator.text = sender.currentTitle!
        displayNumber.text = zeroString
    }
    
    @IBAction private func equalButtonDidTapped(_ sender: UIButton) {
        guard displayOperator.text != emptyString else {
            return
        }
        
        addSubView()
        
        calculateItems += " " + displayOperator.text!
        calculateItems += " " + displayNumber.text!
        
        var separatedInput = ExpressionParser.parse(from: calculateItems)
        do {
            let calculateResult = try separatedInput.result()
            displayNumber.text = numberFormatter.string(from: NSNumber(value: calculateResult))
            displayOperator.text = emptyString
            calculateItems = emptyString
        } catch {
            displayNumber.text = OperatorError.divide.print
        }
    }

    @IBAction private func ACButtonDidTapped(_ sender: UIButton) {
        calculateItems = emptyString
        recentInputStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
        displayOperator.text = emptyString
        displayNumber.text = zeroString
    }

    
    @IBAction private func CEButtonDidTapped(_ sender: UIButton) {
        displayNumber.text = zeroString
    }
    
    @IBAction private func changeOperatorSignButtonDidTapped(_ sender: UIButton) {
        guard displayNumber.text != "0" else {
            return
        }
        
        guard var text = displayNumber?.text else {
            return
        }
        
        if displayNumber.text!.prefix(1) == "-" {
            text.remove(at: text.startIndex)
            displayNumber.text = text
        } else {
            text.insert("-", at: text.startIndex)
            displayNumber.text = text
        }
    }

    private func generateStackView() -> UIStackView {
        let stackView = UIStackView()
        let operandLabel = UILabel()
        let operatorLabel = UILabel()

        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.isHidden = true
        stackView.spacing = 8
        
        operandLabel.text = displayNumber.text
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operandLabel.textColor = .white
        operatorLabel.textAlignment = .center

        operatorLabel.text = displayOperator.text
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.textColor = .white
        operatorLabel.textAlignment = .center
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        return stackView
    }
    
    private func scrollToBottom() {
        historyScrollView.setContentOffset(CGPoint(x: 0,
                                                   y: historyScrollView.contentSize.height - historyScrollView.bounds.height),
                                           animated: true)
    }
}
