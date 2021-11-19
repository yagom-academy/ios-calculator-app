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
        removeExpression()
        expression = ""
    }
    
    @IBAction func clickCalculate(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let operatorOfButton = operatorSettingLabel.text else {
            return
        }
        expression += operatorOfButton + numberOfLabel
        
        var formula: Formula = ExpressionParser.parse(from: expression)
        let calculatedValue: Double = formula.result()
        
        removeExpression()
        expression = ""
        operatorSettingLabel.text = ""
        numberCompositionLabel.text = String(calculatedValue)
    }
    
    @IBAction func initializationInputField(_ sender: UIButton) {
        setZeroInNumberLabel()
    }
    
    @IBAction func clickOperator(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let operatorOfButton = sender.titleLabel?.text else {
            return
        }
        
        if numberOfLabel.isZeroValue {
            operatorSettingLabel.text = operatorOfButton
            return
        }
        
        handleExpressionAddition(operatorOfLabel: operatorSettingLabel.text, numberOfLabel: numberOfLabel)
        
        operatorSettingLabel.text = operatorOfButton
        setZeroInNumberLabel()
    }
    
    @IBAction func clickNumberSign(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text else {
            return
        }
        
        if numberOfLabel.isZeroValue {
            return
        }
        
        numberCompositionLabel.text = changeNumberSign(numberValue: numberOfLabel)
    }
    
    @IBAction func clickDoubleZero(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let doubleZero = sender.titleLabel?.text else {
            return
        }
               
        if numberOfLabel.isZeroValue == false {
            numberCompositionLabel.text = numberOfLabel + doubleZero
        }
    }
    
    @IBAction func clickNumber(_ sender: UIButton) {
        guard let numberOfLabel = numberCompositionLabel.text, let numberOfButton = sender.titleLabel?.text else {
            return
        }
    
        if numberOfLabel.isZeroValue {
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

// MARK: - private method

extension ViewController {
    
    // stackView 만들기
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
    
    // stackView 지우기
    private func removeExpression() {
        expressionView.subviews.forEach{ $0.removeFromSuperview() }
    }
    
    // ViewController단 numberLabel = 0 으로 만들기
    private func setZeroInNumberLabel() {
        numberCompositionLabel.text = "0"
    }
    
    // numberLabel 값 기호 바꾸기
    private func changeNumberSign(numberValue: String) -> String {
        return numberValue.hasPrefix("-") ? numberValue.filter { $0.isNumber } : "-" + numberValue
    }
    
    // stackView 추가
    func handleExpressionAddition(operatorOfLabel: String?, numberOfLabel: String) {
        if let operatorOfLabel = operatorOfLabel {
            addExpression(signValue: operatorOfLabel, numberValue: numberOfLabel)
        } else {
            addExpression(signValue: nil, numberValue: numberOfLabel)
        }
    }
}
