//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {

    @IBOutlet weak var calculatorStackView: UIStackView!
    
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    
    private func addInputStack() {
        guard let stack = generateStack() else {
            return
        }
        
        calculatorStackView.addArrangedSubview(stack)
        setScrollViewLayout()
    }
    
    private func generateStack() -> UIStackView? {
        guard let (operatorStackLabel, numberStackLabel) = generateStackLabels() else {
            return nil
        }
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .fill
        
        stack.addArrangedSubview(operatorStackLabel)
        stack.addArrangedSubview(numberStackLabel)
        
        return stack
    }
    
    private func generateStackLabels() -> (UILabel, UILabel)? {
        guard let `operator` = currentOperatorLabel.text,
              let number = currentNumberLabel.text else {
            return nil
        }
        let operatorStackLabel = UILabel()
        let numberStackLabel = UILabel()
        
        operatorStackLabel.textColor = .white
        operatorStackLabel.text = `operator`
        
        numberStackLabel.textColor = .white
        numberStackLabel.text = number
        
        return (operatorStackLabel, numberStackLabel)
    }
    
    private func setScrollViewLayout() {
        guard let scrollView = calculatorStackView.superview as? UIScrollView else {
            return
        }
        
        scrollView
            .setContentOffset(
                CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
                animated: true
            )
    }
    
    
}

