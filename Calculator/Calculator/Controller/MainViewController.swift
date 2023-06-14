//
//  Calculator - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//  last modified by karen, Mary.

import UIKit

class MainViewController: UIViewController {
    private var expression = String()
    private var operandsValue = String()
    private var operatorValue = String()
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var parentStackView: UIStackView!
    @IBOutlet weak var expressionScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeOperands()
        initializeOperator()
    }

    private func initializeExpression() {
        expression = ""
    }
    
    private func initializeOperands(labelUpdate: Bool = true) {
        operandsValue = ""
        if labelUpdate {
            operandsLabel.text = "0"
        }
    }
    
    private func initializeOperator() {
        operatorValue = ""
        operatorLabel.text = ""
    }
    
    private func updateOperands(to value: String) {
        operandsValue = value
        operandsLabel.text = value
    }
    
    private func updateOperator(to `operator`: String) {
        operatorValue = `operator`
        operatorLabel.text = `operator`
    }

    private func insertStackView(with strings: String...) {
        let labels = strings.map { createUILabel(text: $0) }
        let subStackView = createSubStackView(with: labels)
        
        parentStackView.addArrangedSubview(subStackView)
        expressionScrollView.layoutIfNeeded()
        expressionScrollView.scrollToBottom()
    }
    
    private func initializeStackView() {
        guard parentStackView.subviews.count > 0 else { return }
        
        parentStackView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
}

extension MainViewController {
    private func createUILabel(text: String) -> UILabel {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.text = text
        
        return label
    }
    
    private func createSubStackView(with labels: [UILabel]) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.spacing = 8
        labels.forEach {
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }
}
