//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var screenLabel: UILabel?
    @IBOutlet weak var currentOperatorLabel: UILabel?
    @IBOutlet weak var historyStackView: UIStackView?
    @IBOutlet weak var scrollView: UIScrollView?
    
    private var formula: Formula?
    private let numberFormatter = NumberFormatter()
    private let zero = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
    }
}

extension ViewController {
    
    @IBAction func operandButtonDidTapped(_ sender: UIButton) {

        if screenLabel?.text == zero {
            screenLabel?.text = ""
        }
        screenLabel?.text = (screenLabel?.text ?? "") + (sender.currentTitle ?? "")
    }
    
    @IBAction func operatorButtonDidTapped(_ sender: UIButton) {
        
        if screenLabel?.text != zero {
            add(generateStackView(), to: historyStackView)
        }
        currentOperatorLabel?.text = sender.currentTitle
        screenLabel?.text = zero
        goToBottomOfScrollView()
    }
    
    @IBAction func equalButtonDidTapped(_ sender: UIButton) {
        
        }
        add(generateStackView(), to: historyStackView)
        currentOperatorLabel?.text = ""
        do {
            let result = try formula?.result()
            screenLabel?.text = numberFormatter.string(for: result)
        } catch {
            if let error = error as? FormulaError {
                print("입력값을 추가하세요.")
            } else if let error = error as? OperatorError {
                screenLabel?.text = "NaN"
            }
        }
        goToBottomOfScrollView()
    }
    
    @IBAction func functionButtonDidTapped(_ sender: UIButton) {
        
        if sender.currentTitle == "AC" {
            screenLabel?.text = zero
            currentOperatorLabel?.text = ""
            removeAllInStackView(stack: historyStackView!)
        } else if sender.currentTitle == "⁺⁄₋" {
            guard screenLabel?.text != zero else { return }
            screenLabel?.text = numberFormatter.string(for: Double((screenLabel?.text!)!)! * -1)
        } else if sender.currentTitle == "CE" {
            screenLabel?.text = zero
        }
    }
}

private extension ViewController {
    
    func removeAllInStackView(stack: UIStackView) {
        stack.arrangedSubviews.forEach { stack.removeArrangedSubview($0) ; $0.isHidden = true}
    func add(_ subStack: UIStackView, to parentStack: UIStackView?) {
        parentStack?.addArrangedSubview(subStack)
        UIView.animate(withDuration: 0.2) {
            subStack.isHidden = false
        }
    }
    
    func generateStackView() -> UIStackView {
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
    
    func goToBottomOfScrollView() {
        scrollView?.scrollRectToVisible(CGRect(x: 0,
                                               y: (scrollView?.contentSize.height)! - (scrollView?.bounds.height)!,
                                               width: (scrollView?.bounds.size.width)!,
                                               height: (scrollView?.bounds.size.height)!),
                                        animated: true)
    }
}
