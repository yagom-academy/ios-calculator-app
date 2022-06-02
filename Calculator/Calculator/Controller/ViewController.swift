//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var displayNumberLabel: UILabel!
    @IBOutlet private weak var displayOperatorLabel: UILabel!
    @IBOutlet private weak var recentInputStackView: UIStackView!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    private let zero = "0"
    private let empty = ""
    private var calculateItems = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingInitialView()
        applyNumberFormatter()
    }
    
    func settingInitialView() {
        removeAllSubViews()
        displayNumberLabel.text = zero
        displayOperatorLabel.text = empty
    }
    
    private func applyNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
    }
    
    private func removeAllSubViews() {
        recentInputStackView.arrangedSubviews.forEach {
            recentInputStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    @IBAction private func operandButtonDidTap(_ sender: UIButton) {
        guard displayNumberLabel.text != zero else {
            displayNumberLabel.text = empty
            displayNumberLabel.text = sender.currentTitle ?? empty
            return
        }
        
        guard displayOperatorLabel.text != empty || recentInputStackView.arrangedSubviews.count == 0
        else {
            return
        }
        
        guard sender.currentTitle != "." || displayNumberLabel.text?.contains(".") == false
        else {
            return
        }
        
        let currentDisplay = displayNumberLabel.text ?? empty
        displayNumberLabel.text = currentDisplay + (sender.currentTitle ?? empty)
    }

    private func addSubView() {
        let inputStackView = generateStackView()
        recentInputStackView.addArrangedSubview(inputStackView)
        inputStackView.isHidden = false
    }
    
    @IBAction private func operatorButtonDidTap(_ sender: UIButton) {
        guard displayNumberLabel.text != zero else {
            return
        }
        
        if displayOperatorLabel.text == empty {
            addSubView()

            calculateItems +=  displayNumberLabel.text ?? empty
            displayOperatorLabel.text = sender.currentTitle ?? empty
            displayNumberLabel.text = zero
            return
        }
        
        addSubView()
        scrollToBottom()
    
        calculateItems += " " + (displayOperatorLabel.text ?? empty)
        calculateItems += " " + (displayNumberLabel.text ?? empty)
        displayOperatorLabel.text = sender.currentTitle ?? empty
        displayNumberLabel.text = zero
    }
    
    @IBAction private func equalButtonDidTap(_ sender: UIButton) {
        guard displayOperatorLabel.text != empty else {
            return
        }
        
        addSubView()
        
        calculateItems += " " + (displayOperatorLabel.text ?? empty)
        calculateItems += " " + (displayNumberLabel.text ?? empty)
        
        var separatedInput = ExpressionParser.parse(from: calculateItems)
        do {
            let calculateResult = try separatedInput.result()
            displayNumberLabel.text = numberFormatter.string(from: NSNumber(value: calculateResult))
            displayOperatorLabel.text = empty
            calculateItems = empty
        } catch {
            displayNumberLabel.text = OperatorError.divide.print
        }
    }

    @IBAction private func ACButtonDidTap(_ sender: UIButton) {
        calculateItems = empty
        removeAllSubViews()
        displayOperatorLabel.text = empty
        displayNumberLabel.text = zero
    }

    
    @IBAction private func CEButtonDidTap(_ sender: UIButton) {
        displayNumberLabel.text = zero
    }
    
    @IBAction private func changeOperatorSignButtonDidTap(_ sender: UIButton) {
        guard displayNumberLabel.text != zero else {
            return
        }
        
        guard var text = displayNumberLabel.text else {
            return
        }
        
        if text.prefix(1) == "-" {
            text.remove(at: text.startIndex)
            displayNumberLabel.text = text
        } else {
            text.insert("-", at: text.startIndex)
            displayNumberLabel.text = text
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
        
        operandLabel.text = displayNumberLabel.text
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operandLabel.textColor = .white
        operatorLabel.textAlignment = .center

        operatorLabel.text = displayOperatorLabel.text
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
