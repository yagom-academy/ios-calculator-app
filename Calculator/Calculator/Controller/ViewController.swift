//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberInput: UILabel!
    @IBOutlet weak var operatorInput: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lastInput: UIStackView!
    
    private var totalInput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetNumberInput()
        resetOperatorInput()
        resetTotalInput()
        clearLastInput()
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard lastInput.arrangedSubviews.count <= 0 || operatorInput.text != "" else {
            clearLastInput()
            
            numberInput.text = sender.currentTitle
            return
        }
        
        let digit = sender.currentTitle
        
        guard var text = numberInput.text else {
            return
        }
        
        guard digit != "." || text.filter({ $0 == "." }).count < 1 else {
            return
        }
        
        guard let unwrappedDigit: String = digit else {
            return
        }
            
        text += unwrappedDigit
        numberInput.text = text

        
//        guard text.contains(".") == false else {
//            return
//        }
        
        let trimmedResultLabel = text.replacingOccurrences(of: ",", with: "")
        
        guard let trimmedResultLabelToDouble = Double(trimmedResultLabel) else {
            return
        }
        
        numberInput.text = String(trimmedResultLabelToDouble)
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
    }
    
    @IBAction func touchResultButton(_ sender: UIButton) {
    }
    
    @IBAction func touchAllClearButton(_ sender: UIButton) {
    }
    
    @IBAction func touchClearEntryButton(_ sender: UIButton) {
    }
    
    @IBAction func touchSignChangerButton(_ sender: UIButton) {
    }
    
    func resetNumberInput() {
        numberInput.text = "0"
    }
    
    func resetOperatorInput() {
        operatorInput.text = ""
    }
    
    func resetTotalInput() {
        totalInput = ""
    }
    
    func clearLastInput() {
        while lastInput.arrangedSubviews.count > 0 {
            guard let lastView = lastInput.arrangedSubviews.last else {
                return
            }

            lastInput.removeArrangedSubview(lastView)
            lastView.removeFromSuperview()
        }
    }
}
