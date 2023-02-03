//
//  HistoryEntryStackView.swift
//  Calculator
//
//  Created by Harry on 2023/02/03.
//
import UIKit

final class HistoryEntryStackView: UIStackView {
    private let operatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        
        return label
    }()
    
    private let operandsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        
        return label
    }()
    
    init(operatorText: String, operandText: String) {
        super.init(frame: .zero)
        
        configureView()
        
        operatorLabel.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        operatorLabel.text = operatorText
        operandsLabel.text = operandText
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        spacing = 8
        
        addArrangedSubview(operatorLabel)
        addArrangedSubview(operandsLabel)
    }
}
