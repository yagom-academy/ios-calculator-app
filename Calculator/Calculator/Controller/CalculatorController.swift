//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var formulaStackView: UIStackView!
    @IBOutlet weak var formulaScrollView: UIScrollView!
    
    //MARK: - Actions
    
    @IBAction func numberPadTapped(_ sender: UIButton) {
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func CEButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func ACButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
    }
}

