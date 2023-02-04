//
//  Calculator - OperateStackView.swift
//  Created by Rhode.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class OperateStackView: UIStackView {
    private let operandsLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private let operatorLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    init(operatorText: String?, operandsText: String?) {
        super.init(frame: .zero)
        configure()
        setupView(operatorLabelText: operatorText, operandsLabelText: operandsText)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(operatorLabelText: String?, operandsLabelText: String?) {
        operandsLabel.text = operandsLabelText
        operatorLabel.text = operatorLabelText
        addArrangedSubview(operatorLabel)
        addArrangedSubview(operandsLabel)
    }
    
    private func configure() {
        axis = .horizontal
        alignment = .fill
        distribution = .fill
        spacing = 8
    }
}
