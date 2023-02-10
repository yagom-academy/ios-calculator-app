final class Observable<T> {
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
}
