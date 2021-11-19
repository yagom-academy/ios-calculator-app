//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: property
    
    @IBOutlet weak var numberCompositionLabel: UILabel!
    @IBOutlet weak var operatorSettingLabel: UILabel!
    
    @IBOutlet weak var expressionView: UIStackView!
    
    private var expression: String = ""
    
    @IBAction func clickAC(_ sender: UIButton) {
        expression = ""
    }
    
    @IBAction func clickCalculate(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let operatorOfButton = operatorSettingLabel.text else {
            return
        }
        expression += operatorOfButton + numberOfLabel
        
        var formula: Formula = ExpressionParser.parse(from: expression)
        let calculatedValue: Double = formula.result()
        
        expression = ""
        operatorSettingLabel.text = ""
        numberCompositionLabel.text = String(calculatedValue)
    }
    
    @IBAction func initializationInputField(_ sender: UIButton) {
        numberCompositionLabel.text = "0"
    }
    
    @IBAction func clickOperator(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let operatorOfButton = sender.titleLabel?.text else {
            return
        }
        
        if isZeroValue(data: numberOfLabel) {
            operatorSettingLabel.text = operatorOfButton
            return
        }
        
        if let operatorOfLabel = operatorSettingLabel.text {
            addExpression(signValue: operatorOfLabel, numberValue: numberOfLabel)
        } else {
            addExpression(signValue: nil, numberValue: numberOfLabel)
        }
        
        operatorSettingLabel.text = operatorOfButton
        numberCompositionLabel.text = "0"
    }
    
    @IBAction func clickNumberSign(_ sender: UIButton) {
        guard var numberOfLabel = numberCompositionLabel.text else {
            return
        }
        
        if isZeroValue(data: numberOfLabel) {
            return
        }
        
        if numberOfLabel.hasPrefix("-") {
            numberOfLabel.removeFirst()
        } else {
            numberOfLabel = "-" + numberOfLabel
        }
        
        numberCompositionLabel.text = numberOfLabel
    }
    
    @IBAction func clickDoubleZero(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let point = sender.titleLabel?.text else {
            return
        }
               
        if isZeroValue(data: numberOfLabel) == false {
            numberCompositionLabel.text = numberOfLabel + point
        }
    }
    
    @IBAction func clickNumber(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let numberOfButton = sender.titleLabel?.text else {
            return
        }
    
        if isZeroValue(data: numberOfLabel) {
            numberCompositionLabel.text = numberOfButton
        } else {
            numberCompositionLabel.text = numberOfLabel + numberOfButton
        }
    }
    
    @IBAction func clickPoint(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let point = sender.titleLabel?.text else {
            return
        }
               
        if numberOfLabel.contains(point) == false {
            numberCompositionLabel.text = numberOfLabel + point
        }
    }
}

// MARK: private method

extension ViewController {
    private func isZeroValue(data: String) -> Bool {
        return data == "0" ? true : false
    }
    
    private func addExpression(signValue: String?, numberValue: String) {
        let expressionStackView = UIStackView()
        
        let signLabel = ExpressionLabel()
        let numberLabel = ExpressionLabel()
        
        signLabel.text = signValue
        numberLabel.text = numberValue
        
        if let signValue = signValue {
            expression += signValue + numberValue
        } else {
            expression += numberValue
        }
        
        expressionStackView.addArrangedSubview(signLabel)
        expressionStackView.addArrangedSubview(numberLabel)
        
        expressionView.addArrangedSubview(expressionStackView)
    }
}

