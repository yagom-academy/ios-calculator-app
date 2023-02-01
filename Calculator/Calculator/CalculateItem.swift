// 특정 기능을 실행하기 위한 요구사항을 적는다
// 정의를 제시할 뿐 기능을 구현하지는 않는다
protocol CalculateItem {
    
}

extension Double: CalculateItem { }
extension Operator: CalculateItem { }

// 원래 이런 기능이 있기떄문에 바로 사용하면 되지 않을까? 왜 확장까지 하는걸까?
extension String {
    func split(with target: Character) -> [String] {
        return self.split(with: target)
    }
}
