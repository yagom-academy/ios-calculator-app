//
//  String +.swift
//  Calculator
//
//  Created by yyss99, Serena on 2023/06/06.
//

extension String: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
