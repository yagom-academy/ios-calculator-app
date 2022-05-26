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
    
    //MARK: - addStackView()
    func addStackView() {
        let addedStackView = UIStackView()
        let addedOperatorsLabel = UILabel()
        let addedOperandsLabel = UILabel()
        
        addedStackView.axis = .horizontal
        addedStackView.alignment = .fill
        addedStackView.spacing = 8
        addedStackView.distribution = .fill
        addedStackView.translatesAutoresizingMaskIntoConstraints = false
        addedStackView.isHidden = false
        
        addedOperatorsLabel.text = "+"
        addedOperatorsLabel.textAlignment = .right
        addedOperatorsLabel.textColor = UIColor.white
        addedOperatorsLabel.translatesAutoresizingMaskIntoConstraints = false
        addedOperatorsLabel.isHidden = false
        
        addedOperandsLabel.text = "0000000"
        addedOperandsLabel.textAlignment = .right
        addedOperandsLabel.textColor = UIColor.white
        addedOperandsLabel.translatesAutoresizingMaskIntoConstraints = false
        addedOperandsLabel.isHidden = false

        addedStackView.addArrangedSubview(addedOperatorsLabel)
        addedStackView.addArrangedSubview(addedOperandsLabel)
        
        largeStackView.addArrangedSubview(addedStackView)
    }
    //MARK: - deleteStackViewAll()
    func deleteStackViewAll() {
        largeStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    //MARK: - changeOperandSignButtonTapped
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
    
    //MARK: - allClearButtonTapped
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        deleteStackViewAll()
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
    }
    
    //MARK: - clearEntryButtonTapped
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
    }
    
    //MARK: - operandButtonsTapped
    @IBAction func operandButtonsTapped(_ sender: UIButton) {
        eraseZero()
        operandsTextLabel.text! += sender.titleLabel?.text ?? ""
    }
    
    //MARK: - calculateButtonTapped
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        addStackView()
    }
    
    //MARK: - operatorButtonsTapped
    @IBAction func operatorButtonsTapped(_ sender: UIButton) {
        operatorTextLabel.text = sender.titleLabel?.text
    }
    
    //MARK: - zeroButtonTapped
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        if operandsTextLabel.text == "0" {
            operandsTextLabel.text = operandsTextLabel.text
        } else {
            operandsTextLabel.text! += sender.titleLabel?.text ?? ""
        }
    }
    
    //MARK: - doubleZeroButtonTapped
    @IBAction func doubleZeroButtonTapped(_ sender: UIButton) {
        if operandsTextLabel.text?.count == 1,
           operandsTextLabel.text == "0" {
            operandsTextLabel.text = "0"
        } else {
            operandsTextLabel.text! += sender.titleLabel?.text ?? ""
        }
    }
    
    //MARK: - decimalPointButtonTapped
    @IBAction func decimalPointButtonTapped(_ sender: UIButton) {
        if operandsTextLabel.text?.contains(sender.titleLabel?.text ?? "") == true {
            operandsTextLabel.text = operandsTextLabel.text
        } else if operandsTextLabel.text?.count != 0 {
            operandsTextLabel.text! += sender.titleLabel?.text ?? ""
        }
    }
    
    //MARK: - eraseZero
    func eraseZero() {
        if operandsTextLabel.text == "0" {
            operandsTextLabel.text = ""
        }
    }
}

