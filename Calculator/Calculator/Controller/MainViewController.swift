//
//  Calculator - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//  last modified by karen, Mary.

import UIKit

class MainViewController: UIViewController {
    private var expression = String()
    private var operandsValue = String()
    private var operatorValue = String()
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var parentStackView: UIStackView!
    @IBOutlet weak var expressionScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeOperands()
        initializeOperator()
    }

    private func initializeExpression() {
        expression = ""
    }
    
    private func initializeOperands(labelUpdate: Bool = true) {
        operandsValue = ""
        if labelUpdate {
            operandsLabel.text = "0"
        }
    }
    
    private func initializeOperator() {
        operatorValue = ""
        operatorLabel.text = ""
    }
    
}

