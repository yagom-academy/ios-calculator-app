//
//  FormulaStackView.swift
//  Calculator
//
//  Created by Ari on 2021/11/22.
//

import UIKit

class FormulaStackView: UIStackView {
    private(set) var element = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 8
    }
    
    func addLabel(_ text: String) {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.adjustsFontForContentSizeCategory = true
        label.text = text
        self.addArrangedSubview(label)
        element.append(text.replacingOccurrences(of: ",", with: ""))
    }
}
