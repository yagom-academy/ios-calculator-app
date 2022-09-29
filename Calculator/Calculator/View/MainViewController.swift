//  Calculator - MainViewController.swift
//  Created by zhilly on 2022/09/20.

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var doubleZeroButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var devideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var reverseSignButton: UIButton!
    
    @IBOutlet weak var displaySignLabel: UILabel!
    @IBOutlet weak var displayNumberLabel: UILabel!
    
    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    var displayNumber: String = ""
    var displaySign: Operator.RawValue = Operator.add.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDisplayLabels()
    }
    
    func configureDisplayLabels() {
        displaySignLabel.text = ""
        displayNumberLabel.text = displayNumber
        formulaStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
}

