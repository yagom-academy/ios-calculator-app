//  String.swift
//  Created by 레옹아범 on 2023/01/26.

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}
