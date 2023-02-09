//
//  viewGenarator.swift
//  Calculator
//
//  Created by Rowan on 2023/02/07.
//

import UIKit

struct ViewGenerator {
    func generateStackView(about currentItem: CurrentItem) -> UIStackView? {
        let operand = UILabel()
        operand.text = currentItem.operand
        operand.textColor = UIColor.white
        operand.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let `operator` = UILabel()
        `operator`.text = currentItem.operator
        `operator`.textColor = UIColor.white
        `operator`.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let result = UIStackView()
        result.addArrangedSubview(`operator`)
        result.addArrangedSubview(operand)
        result.spacing = 8
        
        return result
    }
}
