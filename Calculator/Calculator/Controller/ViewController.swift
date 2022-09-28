//
//  ViewController.swift
//  Created by Wonbi
//

import UIKit

class ViewController: UIViewController {
    var expression: String = ""
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func tapOperandButton(_ sender: UIButton) {
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
    }
    
    @IBAction func tapEqualsButton(_ sender: UIButton) {
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
    }

    @IBAction func tapACButton(_ sender: UIButton) {
    }
}

