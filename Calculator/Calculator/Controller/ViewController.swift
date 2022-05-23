//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        operandsTextLabel.text = "0"
    }
    
    @IBOutlet weak var operandsTextLabel: UILabel!
    @IBOutlet weak var operatorTextLabel: UILabel!
    
    @IBAction func changeOperandSignButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
    }
    
    @IBAction func operandButtonsTapped(_ sender: UIButton) {
        eraseZero()
        operandsTextLabel.text! += sender.titleLabel?.text ?? ""
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func operatorButtonsTapped(_ sender: UIButton) {
        operatorTextLabel.text = sender.titleLabel?.text
    }
    
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        if operandsTextLabel.text == "0" {
            operandsTextLabel.text = operandsTextLabel.text
        } else {
            operandsTextLabel.text! += sender.titleLabel?.text ?? ""
        }
    }
    
    @IBAction func doubleZeroButtonTapped(_ sender: UIButton) {
        if operandsTextLabel.text?.count == 1,
           operandsTextLabel.text == "0" {
            operandsTextLabel.text = "0"
        } else {
            operandsTextLabel.text! += sender.titleLabel?.text ?? ""
        }
    }
    
    @IBAction func decimalPointButtonTapped(_ sender: UIButton) {
        if !(operandsTextLabel.text?.count == 0) {
            operandsTextLabel.text! += sender.titleLabel?.text ?? ""
        }
    }
    
    func eraseZero() {
        if operandsTextLabel.text == "0" {
            operandsTextLabel.text = ""
        }
    }
}

