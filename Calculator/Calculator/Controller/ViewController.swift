//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var screenLabel: UILabel?
    @IBOutlet weak var currentOperatorLabel: UILabel?
    @IBOutlet weak var historyStackView: UIStackView?
    @IBOutlet weak var scrollView: UIScrollView?
    
    private var formula: Formula?
    private let numberFormatter = NumberFormatter()
    private let zero = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
    }
}

extension ViewController {
    
    @IBAction func operandButtonDidTapped(_ sender: UIButton) {
        
        if screenLabel?.text == zero {
            screenLabel?.text = ""
        }
        screenLabel?.text! += sender.currentTitle!
    }
    
    @IBAction func operatorButtonDidTapped(_ sender: UIButton) {
    }
    
    @IBAction func equalButtonDidTapped(_ sender: UIButton) {
    }
    
    @IBAction func functionButtonDidTapped(_ sender: UIButton) {
    }
}

private extension ViewController {
}
