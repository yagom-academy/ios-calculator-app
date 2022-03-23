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
        guard let labelOperand = operandLabel.text else { return }
        guard let inputNumber = sender.titleLabel?.text else { return }
        operandLabel.text = changeNumberFormat(number: labelOperand + inputNumber)
    }
    //MARK: - Functions
    func setBasicStatus() {
        self.numberListStackView.subviews.forEach({$0.removeFromSuperview()})
        self.operandLabel.text = "0"
        self.operationLabel.text = ""
    }
    
    func changeNumberFormat(number: String) -> String {
        guard let number = Double(number.replacingOccurrences(of: ",", with: "")) else { return "" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = -2
        guard let changedNumber = numberFormatter.string(from: NSNumber(value: number)) else { return "" }
        return changedNumber
    }
}

