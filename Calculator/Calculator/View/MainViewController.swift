//  Calculator - MainViewController.swift
//  Created by zhilly on 2022/09/20.

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var numberButton: [UIButton]!
    @IBOutlet var operatorButton: [UIButton]!
    
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!

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

