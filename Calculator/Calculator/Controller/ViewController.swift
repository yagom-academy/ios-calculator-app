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
    
    @IBOutlet weak var ExpressionView: UIStackView!
    
    @IBAction func initializationInputField(_ sender: UIButton) {
        numberCompositionLabel.text = "0"
    }
    
    @IBAction func clickOperator(_ sender: UIButton) {
        addExpression()
        guard let operatorOfButton = sender.titleLabel?.text else {
            return
        }
        operatorSettingLabel.text = operatorOfButton
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
    
    private func addExpression() {
        let expressionStackView = UIStackView()
        
        let signLabel = ExpressionLabel()
        let numberLable = ExpressionLabel()
        
        numberLable.text = "123"
        
        expressionStackView.addArrangedSubview(signLabel)
        expressionStackView.addArrangedSubview(numberLable)
        
        ExpressionView.addArrangedSubview(expressionStackView)
    }
    
}

