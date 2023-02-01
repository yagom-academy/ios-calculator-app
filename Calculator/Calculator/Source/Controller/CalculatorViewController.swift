//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var currentNumbersLabel: UILabel!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    
    private var numberFormatter: NumberFormatter = .init()
    private var currentNumbersLabelText: String = "0" {
        didSet {
            currentNumbersLabel.text = numberFormatter.string(for: Double(currentNumbersLabelText))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.numberStyle = .decimal
    }
    
    @IBAction private func numericButtonTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        
        if currentNumbersLabelText == "0" {
            currentNumbersLabelText = number
        } else {
            currentNumbersLabelText += number
        }
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction private func signButtonTapped(_ sender: UIButton) {
        
    }
    
    func configureCurrentNumbersLabel(number: String) {
        
    }
}

