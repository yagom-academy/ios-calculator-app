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
    
    func makeNewStackView() {
        
        let newStackView = UIStackView()
        let newOperandsLabel = UILabel()
        let newOperatorLabel = UILabel()
        
        newStackView.axis = .horizontal
        newOperandsLabel.textColor = .white
        newOperatorLabel.textColor = .white
        
        if operatorLable == nil {
            newOperandsLabel.text = operandsLable.text
            operandsLable.text = "0"
        } else {
            newOperandsLabel.text = operandsLable.text
            newOperatorLabel.text = operatorLable.text
            operandsLable.text = "0"
        }
        
        newStackView.addArrangedSubview(newOperatorLabel)
        newStackView.addArrangedSubview(newOperandsLabel)
        expressionView.addArrangedSubview(newStackView)
    }
}



