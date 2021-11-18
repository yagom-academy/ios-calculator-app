//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInit()
    }
    
    func configureInit() {
        operandsLabel.text = ""
        operatorLabel.text = ""
    }
    
    //MARK: - Actions
    
    @IBAction func numberPadTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle else {
            return
        }
        guard let currentText = operandsLabel.text else {
            return
        }
        operandsLabel.text = currentText + number
    }
}

