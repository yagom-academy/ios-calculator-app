//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var inputNumLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    private var entireStringFormula: String = ""
    private let negativeSign = "-"
    private let initialNumLabel = "0"
    private let initialStringValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initailizeLabel()
        initializeFormulaStackView()

    }
    
    func initailizeLabel() {
        inputNumLabel.text = initialNumLabel
        inputOperatorLabel.text = initialStringValue
    }
    
    func initializeFormulaStackView() {
        formulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    // MARK: - 숫자 버튼 입력

}

