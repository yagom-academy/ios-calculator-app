import Foundation

struct Formula<Element> {
    var operands = CalculatorItemQueue<Element>()
    var operators = CalculatorItemQueue<Element>()
    
    func result() -> Double {


    }
}

extension String {
    func split(with target: Character) -> [String] {
        let splitedString = self.split(separator: target).map { String($0) }
        return splitedString
    }
}
