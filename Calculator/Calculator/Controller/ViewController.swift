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
    
    //MARK: - UILabel Outlet
    @IBOutlet weak var inputOperandsLabel: UILabel!
    @IBOutlet weak var inputOperatorsLabel: UILabel!
    
    let operrands = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let operators = ["+", "-", "/", "*"]
    var currentInputFormula: String = ""
    var formula: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allocateOperrandsTag()
        allocateOperatorsTag()
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
    
    @IBAction func operandsButtonDidTapped(_ sender: UIButton) {
        let number = operrands[sender.tag]
        currentInputFormula = currentInputFormula + "\(number)"
    }
    
    @IBAction func operatorsButtonDidTapped(_ sender: UIButton) {
        inputOperatorsLabel.text = operators[sender.tag]
        
        guard let currentSign = inputOperatorsLabel.text else { return }
        currentInputFormula = currentInputFormula + " " + currentSign + " "
    }
    
    @IBAction func calculationButtonDidTapped(_ sender: UIButton) {
        var parsedFormula = ExpressionParser.parse(from: currentInputFormula)
        let result = parsedFormula.result()
        inputOperandsLabel.text = String(result)
    }
    
    @IBAction func allClearButtonDidTapped(_ sender: UIButton) {
        currentInputFormula = ""
        inputOperandsLabel.text = currentInputFormula
    }
}
