//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    @IBOutlet private weak var fomulaListStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCaculator()
    }
    
    @IBAction private func touchACButton(_ sender: UIButton) {
        removeFomulaList()
        resetCaculator()
    }
    
    private func resetCaculator() {
        self.operatorLabel.text = ""
        self.operandLabel.text = ""
    }
    
    private func removeFomulaList() {
        self.fomulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
}

