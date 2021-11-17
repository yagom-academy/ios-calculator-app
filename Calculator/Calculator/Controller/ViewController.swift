//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentNumberLabel: UILabel!
    var currentNumberString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        guard let numberPressedString = sender.accessibilityIdentifier else {
            return
        }
        currentNumberString += numberPressedString
        update(self.currentNumberLabel, to: currentNumberString)
    }
    
    private func update(_ label: UILabel, to data: String) {
        label.text = data
    }
}

