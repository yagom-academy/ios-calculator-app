//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mathSign: UILabel!
    @IBOutlet weak var mathFomula: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        clearFormula()
    }
    
    func clearFormula() {
        mathFomula.text = "0"
        mathSign.text = ""
    }
    
    @IBAction func InputNumber(buttonNumber: UIButton) {
        guard let formulaNumber = buttonNumber.currentTitle else { return }
        mathFomula.text = formulaNumber
    }
    
    @IBAction func InputSign(buttonSign: UIButton) {
        guard let signFormula = buttonSign.currentTitle else { return }
        mathSign.text = signFormula
    }
}

