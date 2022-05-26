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
    var calculatingStackView: UIStackView {
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
        calculatingStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func makeStackView(of operatorText: String, operandText: String) -> UIStackView {
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
    
    func addCalculatingLabelStack(to stackView: UIStackView, operatorText: String, operandText: String) {
        let newStackView = makeStackView(of: operatorText, operandText: operandText)
        stackView.addArrangedSubview(newStackView)
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
            guard calculatingStackView.subviews.count != 0 else { return }
            operatorLabel.text = tappedOperatorText
            return
        }
        
        operatorLabel.text = tappedOperatorText
        operandLabel.text = "0"
        
        addCalculatingLabelStack(to: calculatingStackView, operatorText: operatorLabelText, operandText: operandLabelText)
        
        let inputString = operatorLabelText + " " + operandLabelText
        formula? += ExpressionParser.parse(from: inputString)
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard operatorLabel.text != "" else { return }
        
        guard let operatorLabelText = operatorLabel.text,
              let operandLabelText = operandLabel.text else { return }
        
        addCalculatingLabelStack(to: calculatingStackView, operatorText: operatorLabelText, operandText: operandLabelText)
        
        let inputString = operatorLabelText + " " + operandLabelText
        formula? += ExpressionParser.parse(from: inputString)
        
        switch formula?.result() {
        case .success(let data):
            operatorLabel.text = ""
            operandLabel.text = String(data)
            
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

 
