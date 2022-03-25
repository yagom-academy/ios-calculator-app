//
//  Calculator - ViewController.swift
//  Created by 우롱차.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var numberZeroButton: UIButton!
    @IBOutlet weak var numberDoubleZeroButton: UIButton!
    @IBOutlet weak var numberDotButton: UIButton!
    @IBOutlet weak var numberOneButton: UIButton!
    @IBOutlet weak var numberTwoButton: UIButton!
    @IBOutlet weak var numberThreeButton: UIButton!
    @IBOutlet weak var numberFourButton: UIButton!
    @IBOutlet weak var numberFiveButton: UIButton!
    @IBOutlet weak var numberSixButton: UIButton!
    @IBOutlet weak var numberSevenButton: UIButton!
    @IBOutlet weak var numberEightButton: UIButton!
    @IBOutlet weak var numberNineButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    @IBOutlet weak var currentNumberLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!

    @IBOutlet weak var processStackView: UIStackView!
    
    private var currentDisplayNumber: String = ""
    private var totalCalculate = ""
    private var dotStatus = DotStatus.none
    private var negativeStatus = NegativeStatus.positive
    
    enum NegativeStatus {
        case positive
        case negative
    }
    
    enum DotStatus {
        case none
        case havingDot
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeStackView()
    }
    
    private func getDot() -> String {
        switch dotStatus {
        case .none:
            dotStatus = .havingDot
            return "."
        case .havingDot:
            return ""
        }
    }
    
    private func setCurrentDisplayNumber(_: DotStatus) {
        if currentDisplayNumber.isEmpty {
            currentDisplayNumber = "0"
        }
        currentDisplayNumber = currentDisplayNumber + getDot()
    }
    
    private func setCurrentDisplayNumber(_: NegativeStatus) {
        switch negativeStatus {
        case .positive:
            currentDisplayNumber = "-\(currentDisplayNumber)"
            setDisplayNumberLabel()
            negativeStatus = .negative
        case .negative:
            currentDisplayNumber.remove(at: currentDisplayNumber.startIndex)
            setDisplayNumberLabel()
            negativeStatus = .positive
        }
    }
    
    private func setCurrentDisplayNumber(_ num: String) {
        currentDisplayNumber = currentDisplayNumber + num
    }
    
    @IBAction func clickDot(sender: UIButton) {
        setCurrentDisplayNumber(dotStatus)
        setDisplayNumberLabel()
    }
    
    @IBAction func clickNumber(sender: UIButton) {
        let clickValue = sender.currentTitle ?? ""
        
        setCurrentDisplayNumber(clickValue)
        setDisplayNumberLabel()
    }
    
    private func setDisplayNumberLabel() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        //너무 자리수가 길어지면 0으로 표현되는 버그 있음
        let displayNSNumber = NSNumber(value: Double(currentDisplayNumber) ?? 0)
        currentNumberLabel.text = numberFormatter.string(from: displayNSNumber)
        if dotStatus == .havingDot {
            currentNumberLabel.text =  currentDisplayNumber
        }
    }
    
    @IBAction func clickOperand(sender: UIButton) {
        if currentDisplayNumber.isEmpty {
            return
        }
        addTotalCalculate()
        addStackView()
        resetCurrentDisplayNumber()
        let operand = sender.currentTitle ?? ""
        setDisplayOperandLabel(operand: operand)
    }
    
    private func setDisplayOperandLabel(operand: String) {
        currentOperandLabel.text = operand
    }
    
    private func resetDisplayOperandLabel() {
        currentOperandLabel.text = ""
    }
    
    private func addStackView() {
        let verticalStackView = createStackView()
        
        let numberLabel = createLabel(text: currentDisplayNumber)
        let operandLabel = createLabel(text: currentOperandLabel.text ?? "")
        verticalStackView.addArrangedSubview(operandLabel)
        verticalStackView.addArrangedSubview(numberLabel)
        processStackView.addArrangedSubview(verticalStackView)
    }
    
    private func createLabel(text: String) -> UILabel {
        let uiLabel = UILabel()
        uiLabel.textColor = .white
        uiLabel.text = text
        
        return uiLabel
    }
    
    private func createStackView() -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return horizontalStackView
    }
    
    private func addTotalCalculate() {
        totalCalculate = "\(totalCalculate) \(currentOperandLabel.text ?? "") \(currentDisplayNumber)"
    }
    
    @IBAction func getResult(sender: UIButton) {
        guard currentDisplayNumber.isEmpty == false || totalCalculate.isEmpty == false else {
            return
        }
        addStackView()
        resetCurrentDisplayNumber()
        
        let fomula = ExpressionParser.parse(from: totalCalculate)
        totalCalculate = ""
        currentDisplayNumber = "\(fomula.result() ?? 0)"
        setDisplayNumberLabel()
        currentDisplayNumber = ""
        resetDisplayOperandLabel()
    }
    
    @IBAction func clickCEButton(sender: UIButton) {
        resetCurrentDisplayNumber()
    }
    
    @IBAction func clickACButton(sender: UIButton) {
        resetCurrentDisplayNumber()
        totalCalculate = ""
        removeStackView()
        resetDisplayOperandLabel()
    }
    
    @IBAction func clickMinusPlusButton(sender: UIButton) {
        setCurrentDisplayNumber(negativeStatus)
    }
    
    private func removeStackView() {
        processStackView.arrangedSubviews.forEach({ child in
            processStackView.removeArrangedSubview(child)
            child.removeFromSuperview()
        })
    }
    
    private func resetCurrentDisplayNumber() {
        dotStatus = .none
        negativeStatus = .positive
        currentDisplayNumber = ""
        setDisplayNumberLabel()
    }
}

