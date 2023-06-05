//
//  extension.swift
//  Calculator
//
//  Created by mint on 2023/06/02.
//

import Foundation

extension Double: CalculateItem { }

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
} // String을 매개변수 target 기준으로 잘라서 [String]으로 반환
//extension이기에 String type이면 어디서든 사용 가능. -> expressionParser?
