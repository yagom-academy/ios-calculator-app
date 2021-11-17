//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentOperator: UILabel!
    @IBOutlet var currentResult: UILabel!

    @IBOutlet var operandsButton: UIButton!
    @IBOutlet var operatorsButton: UIButton!
    @IBOutlet var acButton: UIButton!
    @IBOutlet var ceButton: UIButton!
    @IBOutlet var positiveOrNegativeButton: UIButton!
    
    var stringToCalculate: [String] = []
    
    @IBAction func hitOperandOrOperatorButton(_ sender: UIButton) {
        guard let inputButtenTitle = sender.titleLabel?.text else {
            return
        }
        var inputValues: [String] = []
        inputValues.append(inputButtenTitle)
        currentResult.text = inputValues.joined()
    }
    
    @IBAction func hitACButton(_ sender: UIButton) {
        stringToCalculate.removeAll()
        currentResult.text = "0"
    }
    
    @IBAction func hitCEButton(_ sender: UIButton) {
        stringToCalculate.removeLast()
        currentResult.text = "0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

