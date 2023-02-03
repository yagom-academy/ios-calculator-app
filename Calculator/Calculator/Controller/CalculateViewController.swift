//
//  Calculator - CalculateViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var enteringNumberLabel: UILabel!
    @IBOutlet weak var enteringOperatorLabel: UILabel!
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
    
    private var enteringNumber: String = Sign.empty {
        didSet {
            enteringNumberLabel.text = (enteringNumber == Sign.empty) ? Sign.zero : enteringNumber
        }
    }
    private var calculationExpression: String = Sign.empty
    
    private let calculatorChecker = CalculatorChecker()
    
    private lazy var numberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

