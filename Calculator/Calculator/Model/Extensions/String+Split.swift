//
//  String+Split.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/13/24.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
