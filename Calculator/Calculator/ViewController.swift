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
        if currendOperand.text == "0" || currendOperand.text == "NaN" {
            currendOperand.text = ""
        }
        if currendOperand.text?.contains(".") == true,
           sender.currentTitle == "." {
            return
        }
        currendOperand?.text = (currendOperand?.text ?? "") + (sender.currentTitle ?? "")
    }
    
    @IBAction func pressOperatorButton(_ sender: UIButton) {
        guard currendOperand.text != ZERO else {
            currentOperator.text = (sender.currentTitle ?? "")
            return
        }
        currentOperator.text = sender.currentTitle
        operationQueue += "\(currendOperand?.text ?? ZERO) \(sender.currentTitle ?? "") "
        //create Scrollview Content
        print(operationQueue)
        clearCurrentOperand()
    }
    
    @IBAction func pressAllClearButton(_ sender: UIButton) {
        operationQueue = ""
        clearScrollviewContent()
        clearCurrentOperand()
        clearCurrentOperator()
    }
    @IBAction func pressClearEntryButton(_ sender: UIButton) {
        clearCurrentOperand()
    }
    @IBAction func pressReverseSignButton(_ sender: UIButton) {
        guard currendOperand.text != ZERO else {
            return
        }
        if currendOperand.text?.first == "-" {
            currendOperand.text?.removeFirst()
        } else {
            currendOperand.text = "-" + (currendOperand.text ?? "")
        }
    }
    @IBAction func pressEqualButton(_ sender: UIButton) {
        operationQueue += currendOperand.text ?? "0"
        print("EQUAL BUTTON, CURRENT OPERATIONQUEUE : \(operationQueue)")
        var formula = ExpressionParser.parse(from: operationQueue)
        do {
            let operationResult = try formula.result()
            print("OperationResult : \(operationResult)")
            currendOperand.text = String(operationResult)
        } catch CalculatorError.divideByZero {
            currendOperand.text = "NaN"
        } catch {
            debugPrint("UNKNOWN ERROR")
        }
        clearCurrentOperator()
        operationQueue = ""
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

