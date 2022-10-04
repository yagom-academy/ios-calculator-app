//
//  ComponentMaker.swift
//  Created by Wonbi
//

import UIKit

struct ComponentMaker {
    func makeLabel(_ expr: String?) -> UILabel {
        let label: UILabel = UILabel()
        
        label.text = expr
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    func makeStackView() -> UIStackView {
        let stackView: UIStackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
}
