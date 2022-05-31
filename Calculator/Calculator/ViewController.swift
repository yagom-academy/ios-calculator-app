//
//  Calculator - ViewController.swift
//  Created by unchain123
//
// 

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTyping = false
    var valueStack: String = ""
    
    @IBOutlet weak var operandsLable: UILabel!
    @IBOutlet weak var operatorLable: UILabel!
    @IBOutlet weak var expressionView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



