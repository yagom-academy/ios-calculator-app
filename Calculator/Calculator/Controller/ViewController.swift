//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var OperatorLabel: UILabel!
    @IBOutlet weak var OperandsLabel: UILabel!
    @IBOutlet var containerStackView: UIStackView!
    @IBOutlet var scrollView: UIScrollView!
    
    private var isDotClicked: Bool = false
    private var currentLabelText: String = ""
    private var inputList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OperandsLabel.text = "0"
    }

    @IBAction func operandsButtonDidTap(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle else { return }
        
        switch inputNumber {
        case "0", "00":
            if currentLabelText.isEmpty {
                currentLabelText = "0"
                OperandsLabel.text = "0"
                return
            } else if currentLabelText == "0" { return }
            currentLabelText += inputNumber
            
        default: currentLabelText += inputNumber
        }
        OperandsLabel.text = currentLabelText
    }
    

 
}
