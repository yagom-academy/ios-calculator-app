//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
    
    private var numbers = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapKeypadButton(_ sender: UIButton) {
        guard let number = numberButtons.firstIndex(of: sender) else { return }
        let newInputNumbers = Keypad.convertNumber(number)
        numbers += newInputNumbers
        inputNumberLabel.text = numbers
    }
    
    func updateLable(text: String) {
        inputNumberLabel.text = numbers
    }
    
    func checkInputNumbers(text: String) {
        if numbers.contains(".") && text == "." {
            return
        }
        
        if (numbers == "" || numbers == "0") && (text == "0" || text == "00") {
            numbers = "0"
        } else if numbers == "" && text == "." {
            numbers = "0."
        } else if numbers == "0" && text != "."{
            numbers = text
        } else {
            numbers += text
        }
    }
}
