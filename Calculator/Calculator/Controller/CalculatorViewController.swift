//
//  Calculator - CalculatorViewController.swift
//  Created by 미니.
//

import UIKit

class CalculatorViewController: UIViewController {
    var userInputs: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func didTappedNumberButton(_ sender: UIButton) {
        let input = sender.titleLabel?.text
        guard let input else {
            return
        }
        userInputs.append(input)
    }
}

