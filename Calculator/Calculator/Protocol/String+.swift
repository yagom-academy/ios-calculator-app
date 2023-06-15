//
//  String+.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/06.
//

extension String {
    var isNaN: Bool {
        return self == "NaN"
    }
    
    var isNotNaN: Bool {
        return self != "NaN"
    }
    
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
