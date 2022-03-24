//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    // MARK: - IBAction
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {

        if operandLabel.text == "0" && sender.currentTitle != "." { operandLabel.text = "" }
        
        guard let text = operandLabel.text, let inputText = sender.currentTitle else { return }
        
        operandLabel.text = text + inputText
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        if operandLabel.text == "0" && sender.currentTitle == "00" { return }
        
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        guard let operandText = operandLabel.text else { return }
        
        if operandText.contains(".") && sender.currentTitle == "." { return }
        
    }
    
    // MARK: - Method
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandLabel.text = "0"
        operatorLabel.text = ""
    }


}

