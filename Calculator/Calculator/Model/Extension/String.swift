//
//  String.swift
//  Calculator
//
//  Created by dragon on 2022/09/23.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}
