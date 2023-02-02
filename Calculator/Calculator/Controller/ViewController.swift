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
    
    let operrands = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let operators = ["+", "-", "/", "*"]
    var currentInputFormula: String = "0"
    var oldInputFormula: String = ""
    var formula: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allocateOperrandsTag()
        allocateOperatorsTag()
        updateCurrentInputScreen()
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
        if currentInputFormula == "0" {
            currentInputFormula = "\(number)"
            updateCurrentInputScreen()
        } else {
            currentInputFormula = currentInputFormula + "\(number)"
        }

    }
    
    @IBAction func operatorsButtonDidTapped(_ sender: UIButton) {
        inputOperatorsLabel.text = operators[sender.tag]
        
        guard let currentSign = inputOperatorsLabel.text else { return }
        
        if oldInputFormula != "" {
            currentInputFormula = oldInputFormula + " " + currentSign + " "

        } else {
            currentInputFormula = currentInputFormula + " " + currentSign + " "
        }
    }
    
    @IBAction func dotButtonDidTapped(_ sender: UIButton) {
        if currentInputFormula.last == "." {
            updateCurrentInputScreen()
        } else {
            currentInputFormula += "."
            updateCurrentInputScreen()
        }
    }
    
    @IBAction func calculationButtonDidTapped(_ sender: UIButton) {
        var parsedFormula = ExpressionParser.parse(from: currentInputFormula)
        let result = parsedFormula.result()
        inputOperandsLabel.text = String(result)
        oldInputFormula = String(result)
    }
    
    @IBAction func allClearButtonDidTapped(_ sender: UIButton) {
        currentInputFormula = "0"
        oldInputFormula = ""
    }
    
    @IBAction func changeSignButtonDidTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func clearEntryButtonDidTapped(_ sender: UIButton) {
        inputOperandsLabel.text = "0"
    }
}
