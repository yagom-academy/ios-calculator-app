//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollViewContents: UIStackView!
    @IBOutlet weak var currendOperand: UILabel!
    @IBOutlet weak var currentOperator: UILabel!
    private var operationQueue: String = ""
    private let ZERO = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        clearScrollviewContent()
        clearCurrentOperand()
        clearCurrentOperator()
        // Do any additional setup after loading the view.
    }
    // MARK: - IBAction
    @IBAction func pressOperandButton(_ sender: UIButton) {
        if currendOperand.text == "0" {
            currendOperand.text = ""
        }
        currendOperand?.text = (currendOperand?.text ?? "") + (sender.currentTitle ?? "")
    }
    
    @IBAction func pressOperatorButton(_ sender: UIButton) {
        guard currendOperand.text != ZERO else {
            return
        }
        currentOperator.text = sender.currentTitle
        operationQueue += "\(currendOperand?.text) \(sender.currentTitle) "
        //create Scrollview Content
        print(operationQueue)
        clearCurrentOperand()
    }
    
    @IBAction func pressAllClearButton(_ sender: UIButton) {
        clearScrollviewContent()
        clearCurrentOperand()
        clearCurrentOperator()
    }
    @IBAction func pressClearEntryButton(_ sender: UIButton) {
        clearCurrentOperand()
    }
    //MARK: - ViewController Method
    private func clearCurrentOperand() {
        currendOperand.text = ZERO
    }
    private func clearCurrentOperator() {
        currentOperator.text = ""
    }
    private func clearScrollviewContent() {
        scrollViewContents.subviews.forEach { UIView in
            UIView.removeFromSuperview()
        }
    }
}

