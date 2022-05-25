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
        screenLabel?.text! += sender.currentTitle!
    }
    
    @IBAction func operatorButtonDidTapped(_ sender: UIButton) {
        let stackViewElement = generateStackView()
        
        if screenLabel?.text != zero {
            historyStackView?.addArrangedSubview(stackViewElement)
            UIView.animate(withDuration: 0.2) {
                stackViewElement.isHidden = false
            }
        }
        currentOperatorLabel?.text = sender.currentTitle
        screenLabel?.text = zero
    }
    
    @IBAction func equalButtonDidTapped(_ sender: UIButton) {
    }
    
    @IBAction func functionButtonDidTapped(_ sender: UIButton) {
    }
}

private extension ViewController {
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
}
