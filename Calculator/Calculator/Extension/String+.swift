//
//  String+.swift
//  Calculator
//
//  Created by Dasan on 2023/06/06.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}
