//  String+Extensions.swift
//  Created by zhilly and Gundy on 2022/10/04.

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
