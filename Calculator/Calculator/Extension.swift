//  Created by hy on 2022/09/22.

extension Double: CalculateItemProtocol {
    
}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}
