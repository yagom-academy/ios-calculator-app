//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UIButton Outlet
    @IBOutlet var operandsButton: [UIButton]!
    @IBOutlet var operatorsButton: [UIButton]!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearEntryButton: UIButton!
    @IBOutlet weak var changSignButton: UIButton!
    @IBOutlet weak var calculationButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    //MARK: - UILabel Outlet
    @IBOutlet weak var inputOperandsLabel: UILabel!
    @IBOutlet weak var inputOperatorsLabel: UILabel!
    @IBOutlet var stackView: UIStackView!
    
    let operrands = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let operators = ["+", "−", "÷", "×"]
    var currentInputFormula: String = "0"
    var oldInputFormula: String = ""
    var formula: [String] = []
    var currentTappedNumber: String = ""
    
    enum Sign {
        static let dot = "."
        static let doubleZero = "00"
        static let black = " "
        static let nothing = ""
        static let minus = "-"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allocateOperrandsTag()
        allocateOperatorsTag()
        updateCurrentInputScreen()
    }
    
    func makeStackView(_ operatorSign: String, _ operand: String) -> UIStackView {
        let view = UIStackView()
        let operandLabel = UILabel()
        let operatorLabel = UILabel()
        
        operatorLabel.text = operatorSign
        operatorLabel.textColor = .white
        operandLabel.text = operand
        operandLabel.textColor = .white
        
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 8

        view.addArrangedSubview(operatorLabel)
        view.addArrangedSubview(operandLabel)
        //[operatorLabel, operandLabel].forEach(view.addArrangedSubview(_:))

        return view
    }
    
    func printex(){
        print("current: \(currentInputFormula)")
        print("old: \(oldInputFormula)")
    }
    
    func allocateOperrandsTag() {
        for index in 0..<operandsButton.count {
            operandsButton[index].tag = index
        }
    }
    
    func allocateOperatorsTag() {
        for index in 0..<operatorsButton.count {
            operatorsButton[index].tag = index
        }
    }
    
    func updateCurrentInputScreen() {
        inputOperandsLabel.text = currentInputFormula
    }
    
    @IBAction func operandsButtonDidTapped(_ sender: UIButton) {
        let number = operrands[sender.tag]
        currentTappedNumber = "\(number)"
        
        if currentInputFormula == "0" {
            currentInputFormula = "\(number)"
            updateCurrentInputScreen()
            printex()
        } else {
            currentInputFormula = currentInputFormula + "\(number)"
            printex()
        }
    }
    
    @IBAction func operatorsButtonDidTapped(_ sender: UIButton) {
        inputOperatorsLabel.text = operators[sender.tag]
        
        guard let currentSign = inputOperatorsLabel.text else { return }
        
        if oldInputFormula != "" {
            currentInputFormula = oldInputFormula + " " + currentSign + " "
            printex()
        } else {
            currentInputFormula = currentInputFormula + " " + currentSign + " "
            printex()
            let newStackView = makeStackView(currentSign, currentTappedNumber)
        }
        
        let newStackView = makeStackView(currentSign, currentTappedNumber)
        print("스택뷰 연산자: \(currentSign)")
        print("스택뷰 피연산자: \(currentInputFormula)")
      
        stackView.addArrangedSubview(newStackView)
    }
    
    @IBAction func dotButtonDidTapped(_ sender: UIButton) {
        if currentInputFormula.last == "." {
            updateCurrentInputScreen()
            printex()
        } else {
            currentInputFormula += "."
            updateCurrentInputScreen()
            printex()
        }
    }
    
    @IBAction func calculationButtonDidTapped(_ sender: UIButton) {
        var parsedFormula = ExpressionParser.parse(from: currentInputFormula)
        let result = parsedFormula.result()
        inputOperandsLabel.text = String(result)
        oldInputFormula = String(result)
        printex()
    }
    
    @IBAction func allClearButtonDidTapped(_ sender: UIButton) {
        currentInputFormula = "0"
        oldInputFormula = ""
        //stackView.removeArrangedSubview(newStackView)
        printex()
    }
    
    @IBAction func changeSignButtonDidTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearEntryButtonDidTapped(_ sender: UIButton) {
        inputOperandsLabel.text = "0"
        printex()
    }
}
