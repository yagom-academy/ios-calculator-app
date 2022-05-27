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
    
    var expressionParserInput: String = ""
    var isCalculated = false
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var exampleStackView1: UIStackView!
    @IBOutlet weak var exampleStackView2: UIStackView!
    @IBOutlet weak var largeStackView: UIStackView!
    @IBOutlet weak var operatorStackLabel: UILabel!
    @IBOutlet weak var operandStackLabel: UILabel!
    @IBOutlet weak var operandsTextLabel: UILabel!
    @IBOutlet weak var operatorTextLabel: UILabel!
    
    //MARK: - addStackView()
    func addStackView() {
        let addedStackView = UIStackView()
        let addedOperatorsLabel = UILabel()
        let addedOperandsLabel = UILabel()
        scrollView.setContentOffset(CGPoint(x: 0,
                                            y: scrollView.contentSize.height - scrollView.bounds.height + 22),
                                    animated: false)
        
        // addedStackView Constraints
        addedStackView.axis = .horizontal
        addedStackView.alignment = .fill
        addedStackView.spacing = 8
        addedStackView.distribution = .fill
        addedStackView.translatesAutoresizingMaskIntoConstraints = false
        addedStackView.isHidden = false
        
        // addedOperatorsLabel Constraints
        addedOperatorsLabel.text = operatorTextLabel.text
        addedOperatorsLabel.textAlignment = .right
        addedOperatorsLabel.textColor = UIColor.white
        addedOperatorsLabel.translatesAutoresizingMaskIntoConstraints = false
        addedOperatorsLabel.isHidden = false
        
        // addedOperandsLabel Constraints
        addedOperandsLabel.text = operandsTextLabel.text
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
        guard let operandsLabelText = operandsTextLabel.text else { return }
        
        if operandsTextLabel.text?.first == "-" {
            operandsTextLabel.text?.removeFirst()
            operandsTextLabel.text = "+" + operandsLabelText
        } else if operandsTextLabel.text?.first == "+" {
            operandsTextLabel.text?.removeFirst()
            operandsTextLabel.text = "-" + operandsLabelText
        } else if operandsTextLabel.text == "0"  {
            operandsTextLabel.text = operandsTextLabel.text
        } else {
            operandsTextLabel.text = "-" + operandsLabelText
        }
    }
    
    //MARK: - allClearButtonTapped
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        deleteStackViewAll()
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
        expressionParserInput = "0"
        
    }
    
    //MARK: - clearEntryButtonTapped
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        isCalculated = false
        if isCalculated == true {
            deleteStackViewAll()
        } else if expressionParserInput.last?.isNumber == true {
            operatorTextLabel.text = ""
        } else {
            operandsTextLabel.text = "0"
        }
    }
    
    //MARK: - calculateButtonTapped
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        addStackView()
    }
    
    //MARK: - operandButtonsTapped()
    @IBAction func operandButtonsTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        
        if operandsTextLabel.text == "NaN" {
            operandsTextLabel.text = ""
            return
        }
        
        if operandsTextLabel.text == "0" {
            operandsTextLabel.text = ""
        } else if isCalculated == true {
            operandsTextLabel.text = ""
            operatorTextLabel.text = ""
            deleteStackViewAll()
            isCalculated = false
        }
        
        operandsTextLabel.text?.append(senderLabelText)
        expressionParserInput.append(senderLabelText)
    }
    
    //MARK: - operatorButtonsTapped()
    @IBAction func operatorButtonsTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        guard let operandLabelText = operandsTextLabel.text else { return }
        guard let operandLabelText = operandsTextLabel.text else { return }
        if operandsTextLabel.text == "NaN" {
            return
        } else if operandLabelText == "0" {
            operatorTextLabel.text = senderLabelText
            return
        }
        
        addStackView()
        expressionParserInput.append(" \(senderLabelText) ")
        operatorTextLabel.text = senderLabelText
        operandsTextLabel.text = operandLabelText
        operandsTextLabel.text = "0"
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
}

