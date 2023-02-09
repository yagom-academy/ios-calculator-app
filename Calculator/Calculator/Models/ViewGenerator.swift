//
//  viewGenarator.swift
//  Calculator
//
//  Created by Rowan on 2023/02/07.
//

import UIKit

struct ViewGenerator {
    func generateStackView(about currentItem: CurrentItem) -> UIStackView? {
        let operandLabel = UILabel()
        operandLabel.text = currentItem.operandText
        operandLabel.textColor = UIColor.white
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let operatorLabel = UILabel()
        operatorLabel.text = currentItem.operatorText
        operatorLabel.textColor = UIColor.white
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let result = UIStackView()
        result.addArrangedSubview(operatorLabel)
        result.addArrangedSubview(operandLabel)
        result.spacing = 8
        
        return result
    }
}
