//
//  CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var singleZeroButton: UIButton!
    @IBOutlet weak var doubleZeroButton: UIButton!
    @IBOutlet weak var singleDotButton: UIButton!
    @IBOutlet weak var numberOneButton: UIButton!
    @IBOutlet weak var numberTwoButton: UIButton!
    @IBOutlet weak var numberThreeButton: UIButton!
    @IBOutlet weak var numberFourButton: UIButton!
    @IBOutlet weak var numberFiveButton: UIButton!
    @IBOutlet weak var numberSixButton: UIButton!
    @IBOutlet weak var numberSevenButton: UIButton!
    @IBOutlet weak var numberEightButton: UIButton!
    @IBOutlet weak var numberNineButton: UIButton!
    
    @IBOutlet weak var equalSignButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearElementButton: UIButton!
    @IBOutlet weak var positiveNegativeConversionButton: UIButton!
    
    @IBOutlet weak var operatorComeInLabel: UILabel!
    @IBOutlet weak var operandComeInLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedOperandsButtons(_ sender: UIButton) {
    }
    
    @IBAction func tappedOperatorsButtons(_ sender: UIButton) {
    }
    
    @IBAction func tappedClearAndConversionButtons(_ sender: UIButton) {
    }
    
}

