//
//  String+.swift
//  Calculator
//
//  Created by Dasan on 2023/06/06.
//

extension String {
    var isZero: Bool {
        return self == "0" ? true : false
    }
    
    var withoutDecimalPoint: Self {
        return self.replacingOccurrences(of: ",", with: "")
    }
    
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}
