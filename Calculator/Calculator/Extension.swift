//
//  Extension.swift
//  Calculator
//  - 음수(키보드) -> 인식할 수 있음 / − 뺴기()
//  Created by Christy Lee on 2023/01/30.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        // return 값에 기호로 분리된 값 넘기기
        let components = components(separatedBy: String(target))
        return components
    }
}
