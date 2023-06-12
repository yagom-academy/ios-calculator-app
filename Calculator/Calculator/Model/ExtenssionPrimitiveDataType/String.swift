//
//  String.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/07.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: "\(target)")
    }
}
