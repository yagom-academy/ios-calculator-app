//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberListStackView: UIStackView!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBasicStatus()
    }
    //MARK: - IBAction
    @IBAction func touchACButton(_ sender: UIButton) {
        setBasicStatus()
    }
    
    @IBAction func touchCEButton(_ sender: UIButton) {
        self.operandLabel.text = "0"
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let labelOperand = self.operandLabel.text else { return }
        guard let inputNumber = sender.titleLabel?.text else { return }
        self.operandLabel.text = self.changeNumberFormat(number: labelOperand + inputNumber)
    }
    @IBAction func touchDotButton(_ sender: UIButton) {
        guard let labelOperand = self.operandLabel.text else { return }
        if labelOperand.contains(".") { return }
        self.operandLabel.text = labelOperand + "."
    }
    //MARK: - Functions
    func setBasicStatus() {
        self.numberListStackView.subviews.forEach({$0.removeFromSuperview()})
        self.operandLabel.text = "0"
        self.operationLabel.text = ""
    }
    
    func changeNumberFormat(number: String) -> String {
        if number.contains(".") && number.last == "0" { return number}
        guard let number = Double(number.replacingOccurrences(of: ",", with: "")) else { return "" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = -2
        guard let changedNumber = numberFormatter.string(from: NSNumber(value: number)) else { return "" }
        return changedNumber
    }
}

