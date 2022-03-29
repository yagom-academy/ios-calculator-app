//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCaculator()
    }
    
    private func resetCaculator() {
        self.operatorLabel.text = ""
        self.operandLabel.text = ""
    }


}

