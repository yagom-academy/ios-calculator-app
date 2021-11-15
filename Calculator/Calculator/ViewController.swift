//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var formulaeScrollView: UIScrollView!
    @IBOutlet weak var formulaeStakcView: UIStackView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initOperandLabel()
        initOperatorLabel()
    }
}

// MARK: - Actions
extension ViewController {
    @IBAction private func touchUpDigit(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUpOperator(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUpAllClear(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUpClearError(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUpSignConversion(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUPEqualSign(_ sender: UIButton) {
        
    }
}

// MARK: - private Methods

extension ViewController {
    func initOperatorLabel() {
        
        operatorLabel.text = ""
    }
    
    func initOperandLabel() {
        
        operandLabel.text = "0"
    }
}
