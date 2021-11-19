//
//  String+Extensions.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/15.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self
            .split(separator: target)
            .compactMap { String($0) }
    }
    
    var withoutCommas: String {
        return self.filter { $0 != "," }
    }
    
}
