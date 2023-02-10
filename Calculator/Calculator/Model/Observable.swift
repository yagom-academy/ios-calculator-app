import UIKit

final class Observable<T: StringProtocol> {
    var closure: ((T) -> Void)?
    
    var value: T {
        didSet {
            self.closure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(closure: @escaping (T) -> Void) {
        self.closure = closure
    }
    
    func bind(_ label: UILabel) {
        self.subscribe { enteringNumber in
            label.text = (String(enteringNumber) == Sign.empty) ? Sign.zero : String(enteringNumber)
        }
    }
}
