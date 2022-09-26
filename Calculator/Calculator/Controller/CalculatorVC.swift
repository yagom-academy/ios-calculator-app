//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorVC: UIViewController {

    
    @IBOutlet private weak var calculationFormulaScroll: UIScrollView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAllUI()
    }
    
    private func resetAllUI() {
        mainStackView.superview?.removeFromSuperview()
        operatorLabel.text = ""
        operandLabel.text = ""
    }


}

