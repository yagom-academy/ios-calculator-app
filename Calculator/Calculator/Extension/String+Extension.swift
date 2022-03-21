//
//  String+Extension.swift
//  Calculator
//
//  Created by DuDu on 2022/03/18.
//

extension String {
    func split(with target: Character) -> [String] {
        split(separator: target).map{String($0)}
    }
}
