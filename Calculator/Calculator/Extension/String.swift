//
//  String.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/18.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target)
            .map { character in
                String(character)
            }
    }
}
