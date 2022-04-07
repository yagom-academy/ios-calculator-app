//
//  String+extension.swift
//  Calculator
//
//  Created by Eddy on 2022/03/28.
//

import Foundation

fileprivate enum Const {
    static let blank: String = ""
    static let comma: String = ","
    static let maximumLength: Int = 20
}

extension String {
    var withoutComma: String {
        self.replacingOccurrences(of: Const.comma,
                                  with: Const.blank)
    }
    
    func split(with target: Character) -> [String] {
        return split(separator: target).map { String($0) }
    }
}

extension String {
    func numberFomatter() -> String {
        let zero: NSNumber = 0
        guard self != "nan" else { return "NaN" }
        
        let noCommaText = self.withoutComma
        let numberFomatter = NumberFormatter()
        let number = numberFomatter.number(from: noCommaText) ?? zero
        numberFomatter.numberStyle = .decimal
        numberFomatter.maximumFractionDigits = Const.maximumLength
        
        let changedNumber = numberFomatter.string(from: number) ?? Const.blank
        return changedNumber
    }
}

extension Optional where Wrapped == String {
    var unwrapped: String {
        guard let result = self else { return Const.blank }
        
        return result
    }
}
