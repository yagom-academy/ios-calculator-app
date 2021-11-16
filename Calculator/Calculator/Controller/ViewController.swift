//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var verticalStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addFormulaLine(operator: String, operand: String) {
        let horizontalStackView = UIStackView()
        verticalStackView.addArrangedSubview(horizontalStackView)
    }
    
    private func makeFormulaLabel(with text: String) -> UILabel {
        let label = UILabel()
        
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.text = text
        
        return label
    }
    
    private func makeHorizontalStackView(operator: UILabel, operand: UILabel) -> UIStackView {
        let horizontal = UIStackView()
        let defaultSpacing: CGFloat = 8
        
        horizontal.axis = .horizontal
        horizontal.translatesAutoresizingMaskIntoConstraints = false
        horizontal.addArrangedSubview(`operator`)
        horizontal.addArrangedSubview(operand)
        horizontal.spacing = defaultSpacing
        
        return horizontal
    }
}

