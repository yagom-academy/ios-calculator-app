//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var calculateStackView: UIStackView!
    @IBOutlet weak var calculateScrollView: UIScrollView!
    
    private var calculateSign: String = ""
    private var calculateNumber: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapACButton() {
        
    }
    
    @IBAction func didTapCEButton() {
        
    }
    
    @IBAction func didTapChangeSignButton() {
        guard calculateNumber != "0" else { return }
        
        guard let calculateNumberFirst = calculateNumber.first else { return }
        
        if calculateNumberFirst == "-" {
            calculateNumber.remove(at: calculateNumber.startIndex)
        } else {
            calculateNumber.insert("-", at: calculateNumber.startIndex)
        }
        
        numberLabel.text = calculateNumber
    }
    
    @IBAction func didTapResultButton() {
        
    }
    
    @IBAction func didTapOperaterButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
    }
}

