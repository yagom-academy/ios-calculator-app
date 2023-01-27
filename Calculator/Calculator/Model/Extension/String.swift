//
//  Extension.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/27.
//

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}

extension String: CalculateItemProtocol { }
