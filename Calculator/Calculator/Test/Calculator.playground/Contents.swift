import Foundation

enum ErrorCases: Error {
	case emptyStackAccess
	case dividedByZero
}

class Stack {
	var stack: [String] = []
	
	func isEmpty() -> Bool {
		return stack.isEmpty
	}
	
	func top() -> String? {
		return stack.last
	}
	
	func push(element: String) {
		stack.append(element)
	}
	
	func pop() -> String? {
		return stack.removeLast()
	}
}

class Calculator {
	var currentInput = ""
	var infixNotation = [String]()
	
	
	func isPrior(operator first: String, to second: String) -> Bool {
		return "*/".contains(first) && "+-".contains(second)
	}
	
	func pushOperator(to stack: Stack, postfix: inout [String], element: String) {
		
		while let top = stack.top(), !isPrior(operator: element, to: top) {
			guard let top = stack.pop() else {
				continue
			}
			postfix.append(top)
		}
		stack.push(element: element)
	}
	
	func convertToPosfix() -> [String] {
		let tempStack = Stack()
		var postfix = [String]()
		
		for element in infixNotation {
			if let _ = Int(element) {
				postfix.append(element)
				continue
			}
			
			pushOperator(to: tempStack, postfix: &postfix, element: element)
		}
		while !tempStack.isEmpty() {
			postfix.append(tempStack.pop()!)
		}
		return postfix
	}
}

var c = Calculator()
c.infixNotation = ["5","+","2","/","7","*","4"]
c.convertToPosfix()

print(c.convertToPosfix())
