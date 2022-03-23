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
    
    @IBAction func changeSign(sender: UIButton) {
         guard let lastValue = Double(presentValueLabelText.removeLast()) else { return }
         
         let convertedString = String(lastValue * -1)
         presentValue.text = convertedString
         presentValueLabelText.append(convertedString)
     }
    
    @IBAction func didTapAllClear(sender: UIButton) {
           presentValueLabelText.removeAll()
           presentValue.text = "0"
       }
}
