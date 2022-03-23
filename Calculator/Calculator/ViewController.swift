//
//  Calculator - ViewController.swift
//  Created by Red
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentNumberLabbel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    var touchedNumber: String = ""
    
    @IBAction func clickNumberButton(_ sender: UIButton) {
        touchedNumber += sender.currentTitle ?? ""
        currentNumberLabbel.text = touchedNumber
    }
    
    @IBAction func clickOperatorButton(_ sender: UIButton) {
        currentOperatorLabel.text = sender.currentTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

