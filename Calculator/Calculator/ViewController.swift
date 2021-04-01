//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clearButton: CaculatorButton!
    @IBOutlet weak var signToggleButton: CaculatorButton!
    @IBOutlet weak var modeToggleButton: CaculatorButton!
    
    @IBOutlet weak var zeroButton: CaculatorButton!
    @IBOutlet weak var dotButton: CaculatorButton!
    @IBOutlet weak var oneButton: CaculatorButton!
    @IBOutlet weak var twoButton: CaculatorButton!
    @IBOutlet weak var threeButton: CaculatorButton!
    @IBOutlet weak var fourButton: CaculatorButton!
    @IBOutlet weak var fiveButton: CaculatorButton!
    @IBOutlet weak var sixButton: CaculatorButton!
    @IBOutlet weak var sevenButton: CaculatorButton!
    @IBOutlet weak var eightButton: CaculatorButton!
    @IBOutlet weak var nineButton: CaculatorButton!
    
    @IBOutlet weak var equalButton: CaculatorButton!
    @IBOutlet weak var subtractButton: CaculatorButton!
    @IBOutlet weak var divideButton: CaculatorButton!
    @IBOutlet weak var multiplyButton: CaculatorButton!
    @IBOutlet weak var addButton: CaculatorButton!

    private var decimalMode = true
    private var decimalCalculator = DecimalCalculator()
    private var binaryCalculator = BinaryCalculator()
    
    @IBOutlet weak var numberField: UILabel!
    
    @IBAction func touchUpNumberOrOperator(_ sender: CaculatorButton) {

        switch sender.customButtonType {
        case .numberButton:
            numberField.text?.append(sender.currentTitle!)
        case .operatorButton:
            sender.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            sender.tintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        default:
            return
        }
        
    }

    @IBAction func touchUpToggleSign(_ sender: Any) {
        do {
            if decimalMode {
                let minusedInput = try decimalCalculator.formatInput(numberField.text!) * -1
                numberField.text = try decimalCalculator.formatResult(of: minusedInput)
            } else {
                let minusedInput = try binaryCalculator.formatInput(numberField.text!) * -1
                numberField.text = try binaryCalculator.formatResult(of: minusedInput)
            }
        } catch {
            return
        }
    }
    
    @IBAction func touchUpToggleMode(_ sender: Any) {
        decimalMode.toggle()
        clearButton(sender)
        twoButton.isHidden.toggle()
        threeButton.isHidden.toggle()
        dotButton.isHidden.toggle()
        if decimalMode {
            fourButton.setTitle("4", for: .normal)
            fiveButton.setTitle("5", for: .normal)
            sixButton.setTitle("6", for: .normal)
            sevenButton.setTitle("7", for: .normal)
            eightButton.setTitle("8", for: .normal)
            nineButton.setTitle("9", for: .normal)
        } else {
            fourButton.customButtonType = .operatorButton
            fiveButton.customButtonType = .operatorButton
            sixButton.customButtonType = .operatorButton
            sevenButton.customButtonType = .operatorButton
            eightButton.customButtonType = .operatorButton
            nineButton.customButtonType = .operatorButton
            fourButton.setTitle("AND", for: .normal)
            fiveButton.setTitle("NAND", for: .normal)
            sixButton.setTitle("XOR", for: .normal)
            sevenButton.setTitle("OR", for: .normal)
            eightButton.setTitle("NOR", for: .normal)
            nineButton.setTitle("NOT", for: .normal)
        }
        
    }
    
    @IBAction func clearButton(_ sender: Any) {
        numberField.text?.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearButton.customButtonType = .functionButton
        signToggleButton.customButtonType = .functionButton
        modeToggleButton.customButtonType = .functionButton
        divideButton.customButtonType = .operatorButton
        multiplyButton.customButtonType = .operatorButton
        subtractButton.customButtonType = .operatorButton
        addButton.customButtonType = .operatorButton
        equalButton.customButtonType = .operatorButton
    }
    
}
