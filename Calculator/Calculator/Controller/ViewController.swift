//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var presentValue: UILabel!
    var presentValueLabelText: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapOperand(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        
        presentValueLabelText.append(buttonLabel)
        presentValue.text = buttonLabel
    }
}
