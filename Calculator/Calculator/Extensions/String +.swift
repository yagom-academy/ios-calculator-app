//
//  String.swift
//  Calculator
//
//  Created by 유제민 on 2022/09/28.
//

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}
