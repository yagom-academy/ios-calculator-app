//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandLabel.text = "0"
        operatorLabel.text = ""
    }

    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        stackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction func touchUpCleanEntryButton(_ sender: UIButton) {
        operandLabel.text = "0"
    }
}

