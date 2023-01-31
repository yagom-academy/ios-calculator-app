//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var presentOperatorLabel: UILabel!
    @IBOutlet weak var presentNumberLabel: UILabel!
        
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var dotButton: UIButton!
    
    @IBOutlet weak var doubleZeroButton: UIButton!
    @IBOutlet weak var singleZeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    var stringToBeCalculated = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapACButton(_ sender: UIButton) {
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
    }
    
    @IBAction func tapConvertSignButton(_ sender: UIButton) {
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        insertString(titleName: sender.titleLabel?.text)
        print(stringToBeCalculated)
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        insertString(titleName: sender.titleLabel?.text)
        print(stringToBeCalculated)
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        insertOperatorSign(titleName: sender.titleLabel?.text)
        print(stringToBeCalculated)
    }
    
    @IBAction func tapCalculateButton(_ sender: UIButton) {
    }
    
    func insertString(titleName: String?) {
        stringToBeCalculated += titleName ?? ""
    }
    
    func insertOperatorSign(titleName: String?) {
        let lastIndex = stringToBeCalculated.index(before: stringToBeCalculated.endIndex)
        let lastString = stringToBeCalculated[lastIndex]
        if lastString.isNumber {
            insertString(titleName: titleName)
        } else {
            stringToBeCalculated = String(stringToBeCalculated.dropLast())
            insertString(titleName: titleName)
        }
    }
}

