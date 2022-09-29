//
//  LineStackView.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/29.
//

import Foundation
import UIKit

class LineStackView: UIStackView {
    let operatorLabelToPush: UILabel = {
        let label = UILabel()
        label.textColor = .white
        
        return label
    }()
    
    let operandLabelToPush: UILabel = {
        let label = UILabel()

        label.textColor = .white
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(operatorStr: String, operandStr: String) {
        self.operatorLabelToPush.text = operatorStr
        self.operandLabelToPush.text = operandStr
        super.init(arrangedSubviews: [operatorLabelToPush, operandLabelToPush])
    }
    
    func fetchOperatorLabelText() {
        
    }
    
    func fetchOperandLabelText() {
        
    }
}
