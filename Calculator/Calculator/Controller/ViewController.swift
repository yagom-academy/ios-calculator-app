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
    var isRealZero: Bool = false
    var isFirst : Bool = true
    
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
        self.isRealZero = false
        self.isFirst = true
    }
    
    @IBAction func touchChangeSignButton(_ sender: UIButton) {
        guard let operandText = self.operandLabel.text else { return }
        if operandText == "0" { return }
        if operandText.contains("-") {
            self.operandLabel.text = operandText.replacingOccurrences(of: "-", with: "")
        } else {
            self.operandLabel.text = "-" + operandText
        }
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let operandText = self.operandLabel.text else { return }
        guard let inputNumber = sender.titleLabel?.text else { return }
        self.operandLabel.text = self.showZeroAfterDot(number: operandText + inputNumber)
        self.isRealZero = true
        self.isFirst = false
    }
    @IBAction func touchDotButton(_ sender: UIButton) {
        guard let operandText = self.operandLabel.text else { return }
        if operandText.contains(".") { return }
        self.operandLabel.text = operandText + "."
    }
    
    @IBAction func touchOperationButton(_ sender: UIButton) {
        guard let inputOperation = sender.titleLabel?.text else { return }
        guard let operandText = self.operandLabel.text else { return }
        guard let operationText = self.operationLabel.text else { return }
        if isFirst == true { return }
        self.operationLabel.text = inputOperation
        guard isRealZero == true else { return }
        let numberStackView = setStackView(operationText: operationText , operandText: changeNumberFormat(number: operandText))
        self.numberListStackView.addArrangedSubview(numberStackView)
        self.operandLabel.text = "0"
        self.isRealZero = false
    }
    //MARK: - Functions
    func setBasicStatus() {
        self.numberListStackView.subviews.forEach({$0.removeFromSuperview()})
        self.operandLabel.text = "0"
        self.operationLabel.text = ""
        self.isRealZero = false
        self.isFirst = true
    }
    
    func showZeroAfterDot(number: String) -> String {
        if number.contains(".") && number.last == "0" { return number }
        return changeNumberFormat(number: number)
    }
    
    func changeNumberFormat(number: String) -> String {
        guard let number = Double(number.replacingOccurrences(of: ",", with: "")) else { return "" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = -2
        guard let changedNumber = numberFormatter.string(from: NSNumber(value: number)) else { return "" }
        return changedNumber
    }
    
    func setStackView(operationText: String, operandText: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.addArrangedSubview(setLabel(element: operationText))
        stackView.addArrangedSubview(setLabel(element: operandText))
        return stackView
    }
    
    func setLabel(element: String) -> UILabel {
        let label = UILabel()
        label.text = element
        label.textColor = .white
        return label
    }
}

