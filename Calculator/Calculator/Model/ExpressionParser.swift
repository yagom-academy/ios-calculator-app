//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김태훈 on 2022/03/28.
//

import Foundation

enum ExpressionParser {
    func parse(frome input: String) {
        //return Fomula
    }
}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
