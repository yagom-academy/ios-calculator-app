//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayNumber: UILabel!
    @IBOutlet weak var displayOperator: UILabel!
    @IBOutlet weak var recentInputStackView: UIStackView!
    @IBOutlet weak var historyScrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    private let zeroString = "0"
    private let emptyString = ""
    var calculateItems = ""
    
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
    
    func removeAllStackView(_ stack: UIStackView) {
        stack.arrangedSubviews.forEach {
            stack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    @IBAction func operandButtonDidTapped(_ sender: UIButton) {
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
    
    @IBAction func operatorButtonDidTapped(_ sender: UIButton) {
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

