//
//  OperateStackView.swift
//  Calculator
//
//  Created by Jinah Park on 2023/02/02.
//

import UIKit

class OperateStackView: UIStackView {
    init(operatorText: String?, operandsText: String?) {
        super.init(frame: .zero)
        configure()
        loadView(operatorLabelText: operatorText, operandsLabelText: operandsText)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadView(operatorLabelText: String?, operandsLabelText: String?) {
        addArrangedSubview(makeLabel(labelText: operatorLabelText))
        addArrangedSubview(makeLabel(labelText: operandsLabelText))
    }
    
    private func configure() {
        axis = .horizontal
        alignment = .fill
        distribution = .fill
        spacing = 8
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private func makeLabel(labelText: String?) -> UILabel {
        label.text = labelText
        return label
    }
}
