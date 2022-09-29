//  String+Extensions.swift
//  Created by zhilly on 2022/09/26.

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
