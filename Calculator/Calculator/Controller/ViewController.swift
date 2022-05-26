//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberInput: UILabel!
    @IBOutlet weak var operatorInput: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lastInput: UIStackView!
    
    private var totalInput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetNumberInput()
        resetOperatorInput()
        resetTotalInput()
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
    }
    
    @IBAction func touchResultButton(_ sender: UIButton) {
    }
    
    @IBAction func touchAllClearButton(_ sender: UIButton) {
    }
    
    @IBAction func touchClearEntryButton(_ sender: UIButton) {
    }
    
    @IBAction func touchSignChangerButton(_ sender: UIButton) {
    }
    
    func resetNumberInput() {
        numberInput.text = "0"
    }
    
    func resetOperatorInput() {
        operatorInput.text = ""
    }
    
    func resetTotalInput() {
        totalInput = ""
    }
}
