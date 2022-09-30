//
//  DoubleExtension.swift
//  Calculator
//
//  Created by 써니쿠키 on 2022/09/22.
//

import Foundation

extension Double: CalculateItem {
    var changeToDemical: String {
        let numberFormatter = NumberFormatter()
        let twenty: Int = 20
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = twenty
        numberFormatter.roundingMode = .up
    
        let result = numberFormatter.string(from: self as NSNumber) ?? "0"
        
        return result
    }
}
