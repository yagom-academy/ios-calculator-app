//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var accumulatedStackView: UIStackView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var nowOperand: UILabel!
    
    private var nowOperands: String = ""
    private var nowOperandsDouble1: Double = 0
    private var nowOperandsDouble2: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//    @IBAction func numberButtonTapped(_ sender: UIButton) {
//        Double(sender.accessibilityLabel)
//    }
//
//    @IBAction func operatorButtonTapped(_ sender: UIButton) {
//    }
//
//    @IBAction func acButtonTapped(_ sender: UIButton) {
//    }
//    @IBAction func ceButtonTapped(_ sender: UIButton) {
//    }
//    @IBAction func pmButtonTapped(_ sender: Any) {
//    }
    
}

