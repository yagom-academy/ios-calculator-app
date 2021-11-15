//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputedOperatorLabel: UILabel!
    @IBOutlet weak var inputedOperandLabel: UILabel!
    @IBOutlet weak var toBeCalculateFormulaStackView: UIStackView!
    
    @IBOutlet weak var inputDotButton: UIButton!
    @IBOutlet weak var inputZeroZeroButton: UIButton!
    @IBOutlet weak var inputZeroButton: UIButton!
    @IBOutlet weak var inputOneButton: UIButton!
    @IBOutlet weak var inputTwoButton: UIButton!
    @IBOutlet weak var inputThreeButton: UIButton!
    @IBOutlet weak var inputFourButton: UIButton!
    @IBOutlet weak var inputFiveButton: UIButton!
    @IBOutlet weak var inputSixButton: UIButton!
    @IBOutlet weak var inputSevenButton: UIButton!
    @IBOutlet weak var inputEightButton: UIButton!
    @IBOutlet weak var inputNineButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var cleanEntry: UIButton!
    @IBOutlet weak var convertPositiveOrNegativeNumber: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func numberDidTap(_ sender: UIButton) {
        //inputedOperandLabel.text += operands(for: sender)
    }
}

