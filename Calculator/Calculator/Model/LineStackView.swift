//
//  LineStackView.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/29.
//

import UIKit

final class LineStackView: UIStackView {
    private let operatorLabelToPush: UILabel = {
        let label = UILabel()
        label.textColor = .white
        
        return label
    }()
    
    private let operandLabelToPush: UILabel = {
        let label = UILabel()

        label.textColor = .white
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(operatorLabelText: String?, operandLabelText: String?) {
        self.operatorLabelToPush.text = operatorLabelText
        self.operandLabelToPush.text = operandLabelText
        super.init(arrangedSubviews: [operatorLabelToPush, operandLabelToPush])
    }
}
