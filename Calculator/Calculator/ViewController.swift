//
//  Calculator - ViewController.swift
//  Created by Red
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var touchedNumber: String = ""
    
    @IBAction func clickNumberButton(_ sender: UIButton) {
        touchedNumber += sender.currentTitle ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

