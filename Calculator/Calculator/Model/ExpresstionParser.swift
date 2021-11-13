//
//  ExpresstionParser.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {

    }

    static private func componentsByOperators(from input: String) -> [String] {

    }
}

extension String {
    func split(with target: Character) -> [String] {
        let result = self.split(separator: target).map{ String($0) }
        return result
    }
}
