//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    private var numbers = ""
    private var totalFormula = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapKeypadButton(_ sender: UIButton) {
        guard let number = numberButtons.firstIndex(of: sender) else { return }
        let newInputNumbers = Keypad.convertNumber(number)
        checkInputNumbers(text: newInputNumbers)
        inputNumberLabel.text = numbers.filter {$0.isNumber}
    }
    
    @IBAction func tapOperatorsButton(_ sender: UIButton) {
        updateStackView()
        
        var currentoOperator:Character = " "
        switch sender {
        case additionButton:
            currentoOperator = Operator.add.symbol
        case subtractionButton:
            currentoOperator = Operator.subtract.symbol
        case multiplicationButton:
            currentoOperator = Operator.multiply.symbol
        case divisionButton:
            currentoOperator = Operator.divide.symbol
        default:
            return
        }
        operatorLabel.text = String(currentoOperator)
        
        numbers += String(currentoOperator)

    }
    
    @IBAction func tapResultButton() {
        updateStackView()

        let formula = ExpressionParser.parse(from: totalFormula)
        var result = 0.0
        do {
            result = try formula.result()
            numbers = String(result)
            inputNumberLabel.text = numbers
            numbers = ""
            totalFormula = ""
        } catch CalculatorError.dividedByZero {
            inputNumberLabel.text = CalculatorError.dividedByZero.errorMessage
        } catch {
            inputNumberLabel.text = CalculatorError.unknownError.errorMessage
        }
    }
    
    func updateLable(text: String) {
        inputNumberLabel.text = numbers
    }
    
    func updateStackView() {
        let label = UILabel()
        label.text = numbers
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        stackView.addArrangedSubview(label)
        totalFormula += numbers
        numbers = ""
        // label.adjustsFontForContentSizeCategory = true
        print(totalFormula)
    }
    
    func checkInputNumbers(text: String) {
        if numbers.contains(".") && text == "." {
            return
        }
        
        if (numbers == "" || numbers == "0") && (text == "0" || text == "00") {
            numbers = "0"
        } else if numbers == "" && text == "." {
            numbers = "0."
        } else if numbers == "0" && text != "."{
            numbers = text
        } else {
            numbers += text
        }
    }
}
