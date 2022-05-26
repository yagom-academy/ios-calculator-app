//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatingScrollView: UIScrollView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var formula: Formula?
    var mainStackInScrollView: UIStackView {
        calculatingScrollView.subviews.compactMap { $0 as? UIStackView }[0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetUI()
    }
    
    func resetUI() {
        formula = Formula()
        operatorLabel.text = ""
        operandLabel.text = "0"
        mainStackInScrollView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func makeNewCalculateLabelStackView(of operatorText: String, operandText: String) -> UIStackView {
        let operatorLabel: UILabel = {
            let ol = UILabel()
            ol.text = operatorText
            ol.font = UIFont.preferredFont(forTextStyle: .title3)
            ol.textColor = UIColor.white
            ol.textAlignment = .right
            return ol
        }()
        
        let operandLabel: UILabel = {
            let ol = UILabel()
            ol.text = operandText
            ol.font = UIFont.preferredFont(forTextStyle: .title3)
            ol.textColor = UIColor.white
            ol.textAlignment = .right
            return ol
        }()
        
        let stackView: UIStackView = {
            let sv = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
            sv.spacing = 8
            sv.alignment = .fill
            sv.distribution = .fill
            sv.axis = .horizontal
            return sv
        }()
        
        return stackView
    }
    
    func addCalculateLabelStackView(to stackView: UIStackView, operatorText: String, operandText: String) {
        let newStackView = makeNewCalculateLabelStackView(of: operatorText, operandText: operandText)
        stackView.addArrangedSubview(newStackView)
    }
    
    func scrollToBottom(of scrollView: UIScrollView) {
        let scrollViewBottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height + scrollView.contentInset.bottom)
        scrollView.setContentOffset(scrollViewBottomOffset, animated: true)
    }
    
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        guard let tappedNumberText = sender.titleLabel?.text else { return }
        if operandLabel.text == "0" { operandLabel.text = "" }
        operandLabel.text?.append(tappedNumberText)
    }
    
    @IBAction func demicalPointButtonTapped(_ sender: UIButton) {
        guard operandLabel.text?.contains(".") == false else { return }
        guard let tappedDemicalPointText = sender.titleLabel?.text else { return }
        operandLabel.text?.append(tappedDemicalPointText)
    }
    
    @IBAction func doubleZeroButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        guard let tappedDoubleZeroText = sender.titleLabel?.text else { return }
        operandLabel.text?.append(tappedDoubleZeroText)
    }
    
    @IBAction func signButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        if operandLabel.text?.first == "-" {
            operandLabel.text?.removeFirst()
        } else {
            operandLabel.text?.insert("-", at: operandLabel.text!.startIndex)
        }
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let tappedOperatorText = sender.titleLabel?.text,
              let operatorLabelText = operatorLabel.text,
              let operandLabelText = operandLabel.text else { return }
        
        if operandLabel.text == "0" {
            guard mainStackInScrollView.subviews.count != 0 else { return }
            operatorLabel.text = tappedOperatorText
            return
        }
        
        operatorLabel.text = tappedOperatorText
        operandLabel.text = "0"
        addCalculateLabelStackView(to: mainStackInScrollView, operatorText: operatorLabelText, operandText: operandLabelText)
        scrollToBottom(of: calculatingScrollView)
        
        let parsingString = operatorLabelText + " " + operandLabelText
        formula? += ExpressionParser.parse(from: parsingString)
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard operatorLabel.text != "" else { return }
        
        guard let operatorLabelText = operatorLabel.text,
              let operandLabelText = operandLabel.text else { return }
        
        addCalculateLabelStackView(to: mainStackInScrollView, operatorText: operatorLabelText, operandText: operandLabelText)
        scrollToBottom(of: calculatingScrollView)
        
        let parsingString = operatorLabelText + " " + operandLabelText
        formula? += ExpressionParser.parse(from: parsingString)
        
        
        switch formula?.result() {
        case .success(let data):
            operatorLabel.text = ""
            operandLabel.text = data.removeTrailingZero()
        case .failure(let error):
            if error as? FormulaError == FormulaError.notANumber {
                operatorLabel.text = ""
                operandLabel.text = "NaN"
            } else {
                print("Error occurred: ☢️\(error)☢️")
            }
        case .none:
            break
        }
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        resetUI()
    }
}

 
