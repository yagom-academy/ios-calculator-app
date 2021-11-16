//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var verticalStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addFormulaLine(operator: String, operand: String) {
        let horizontalStackView = UIStackView()
        verticalStackView.addArrangedSubview(horizontalStackView)
    }
    
    
}

