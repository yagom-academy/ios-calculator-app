//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
        exampleStackView1.isHidden = true
        exampleStackView2.isHidden = true
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var exampleStackView1: UIStackView!
    @IBOutlet weak var exampleStackView2: UIStackView!
    @IBOutlet weak var largeStackView: UIStackView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    @IBOutlet weak var operandsTextLabel: UILabel!
    @IBOutlet weak var operatorTextLabel: UILabel!
    
    func addStackView() {
        let addedStackView = UIStackView()
        let addedOperatorsLabel = UILabel()
        let addedOperandsLabel = UILabel()
        
        addedStackView.axis = .horizontal
        addedStackView.alignment = .fill
        addedStackView.spacing = exampleStackView1.spacing
        addedStackView.distribution = exampleStackView1.distribution
        addedStackView.isHidden = false
        addedStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addedOperatorsLabel.textAlignment = .right
        addedOperatorsLabel.text = "+"
        addedOperatorsLabel.font = operatorLabel.font
        addedOperatorsLabel.textColor = operatorLabel.textColor
        addedOperatorsLabel.translatesAutoresizingMaskIntoConstraints = false
        addedOperatorsLabel.isHidden = false
        
        addedOperandsLabel.text = "0000000"
        addedOperandsLabel.textColor = operandLabel.textColor
        addedOperandsLabel.font = operandLabel.font
        addedOperandsLabel.textAlignment = .right
        addedOperandsLabel.translatesAutoresizingMaskIntoConstraints = false
        addedOperandsLabel.isHidden = false
        
        addedStackView.addArrangedSubview(addedOperatorsLabel)
        addedStackView.addArrangedSubview(addedOperandsLabel)
        
        largeStackView.addArrangedSubview(addedStackView)
    }
    
    func deleteStackViewAll() {
    }
    
    @IBAction func changeOperandSignButtonTapped(_ sender: UIButton) {
        if operandsTextLabel.text?.first == "-" {
            operandsTextLabel.text?.removeFirst()
            operandsTextLabel.text = "+" + (operandsTextLabel.text ?? "")
        } else if operandsTextLabel.text?.first == "+" {
            operandsTextLabel.text?.removeFirst()
            operandsTextLabel.text = "-" + (operandsTextLabel.text ?? "")
        } else if operandsTextLabel.text == "0"  {
            operandsTextLabel.text = operandsTextLabel.text
        } else {
            operandsTextLabel.text = "-" + (operandsTextLabel.text ?? "")
        }
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        deleteStackViewAll()
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
    }
    
    @IBAction func operandButtonsTapped(_ sender: UIButton) {
        eraseZero()
        operandsTextLabel.text! += sender.titleLabel?.text ?? ""
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        addStackView()
    }
    
    @IBAction func operatorButtonsTapped(_ sender: UIButton) {
        operatorTextLabel.text = sender.titleLabel?.text
    }
    
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        if operandsTextLabel.text == "0" {
            operandsTextLabel.text = operandsTextLabel.text
        } else {
            operandsTextLabel.text! += sender.titleLabel?.text ?? ""
        }
    }
    
    @IBAction func doubleZeroButtonTapped(_ sender: UIButton) {
        if operandsTextLabel.text?.count == 1,
           operandsTextLabel.text == "0" {
            operandsTextLabel.text = "0"
        } else {
            operandsTextLabel.text! += sender.titleLabel?.text ?? ""
        }
    }
    
    @IBAction func decimalPointButtonTapped(_ sender: UIButton) {
        if !(operandsTextLabel.text?.count == 0) {
            operandsTextLabel.text! += sender.titleLabel?.text ?? ""
        }
    }
    
    func eraseZero() {
        if operandsTextLabel.text == "0" {
            operandsTextLabel.text = ""
        }
    }
}

