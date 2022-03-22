//
//  MainViewController.swift
//  Calculator
//
//  Created by mmim.

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var calculationLogStackView: UIStackView!
    private var calculationLog: String?
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var doubleZeroButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    
    @IBOutlet weak var selectedOperatorLabel: UILabel!
    @IBOutlet weak var selectedOperandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.selectedOperatorLabel.text = ""
        self.selectedOperandLabel.text = ""
    }


    
    @IBAction func operandButtonsClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func signButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func operatorButtonsClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func equalSignButtonClicked(_ sender: UIButton) {
        
    }
    
}

