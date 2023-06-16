//
//  String+.swift
//  Calculator
//
//  Created by Zion & Dasan on 2023/06/06.
//

extension String {
    var isZero: Bool {
        return self == "0"
    }
    
    var isNaN: Bool {
        return self == "NaN"
    }
    
    var withoutDecimalPoint: Self {
        return replacingOccurrences(of: ",", with: "")
    }
    
    func split(with target: Character) -> [String] {
        return split(separator: target).map{ String($0) }
    }
}
