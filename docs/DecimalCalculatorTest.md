```swift
struct Stack<T> {
    private var list = [T]()

    var isEmpty: Bool {
        return self.list.isEmpty
    }

    var top: T? {
        return self.list.last
    }

    mutating func push(_ item: T) {
        self.list.append(item)
    }

    mutating func pop() -> T? {
        return self.list.popLast()
    }
    
    mutating func removeAll() {
        self.list.removeAll()
    }
}
//
//enum Operator: String, CaseIterable {
//    case plus = "+"
//    case minus = "-"
//    case mutiply = "x"
//    case divide = "/"
//}

class Calculator {
    var operands = Stack<Int>()     // 숫자(피연산자) 담기는 스택
    var operators = Stack<String>() // 연산자 담기는 스택
    var temp = 0                    //
    var screenNumber = "0"
    var operationFunction: [String : (Int, Int) -> Int] = [:]

    init() {
        operationFunction["+"] = { $0 + $1 }
        operationFunction["-"] = { $0 - $1 }
        operationFunction["*"] = { $0 * $1 }
        operationFunction["/"] = { $0 / $1 }
    }

    func run() {
        while true {
            print("input : ", terminator:"")
            let input = readLine()!
            switch input {
                case "+", "-", "*", "/":
                    operands.push(temp)     // 숫자(피연산자) 스택에 들어감
                    if input == "+" || input == "-" {
                        while !operators.isEmpty {
                            let result: Int = operationFunction[operators.pop()!]!(operands.pop()!, operands.pop()!)
                            operands.push(result)
                        }
                    } else if input == "*" || input == "/" {
                        while operators.top == "*" || operators.top == "/" {
                            operands.push(operationFunction[operators.pop()!]!(operands.pop()!, operands.pop()!))
                        }
                    }
                    screenNumber = String(operands.top!)
                    operators.push(input)   // 연산자가 스택에 들어감
                    temp = 0
                case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                    temp = temp * 10 + Int(input)!
                    screenNumber = String(temp)
                case "c":
                    operands.removeAll()
                    operators.removeAll()
                    temp = 0
                    screenNumber = String(temp)
                default:
                    print("input error!")
            }

            print(operands)
            print(operators)
            print("--- screen Numeber =", screenNumber, "---\n")
        }
    }
}

var cal = Calculator()
cal.run()

```
