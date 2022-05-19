//
//  String.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/19.
//
extension String: CalculatorItem {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
