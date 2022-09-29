//
//  LineStackView.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/29.
//

import Foundation
import UIKit

class LineStackView: UIStackView {
    var operatorLabel = UILabel()
    var operandLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addArrangedSubview(operatorLabel)
        addArrangedSubview(operandLabel)
    }
    
    func fetchOperatorLabelText() {
        
    }
    
    func fetchOperandLabelText() {
        
    }
}
