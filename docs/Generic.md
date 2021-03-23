# 목차

- Generic Function
  - Type Parameters
  - Type Constraints (형식 제약)
  - Speicialization (특수화)
- Generic Types 
  - 형식 표기 방식
  - 익스텐션으로 제네릭 타입 확장
  - 확장 대상 제한
- Associated Types (연관 형식)

---

---

<br>

<br> 

# Generic Function

> 특정 형식과 연관되지 않은 함수를 구현하는 방법을 사용할 때

### Type Parameters

```swift
func name<T>(parameters) -> Type {
    code
}
```

- `<T>` : Type Parameter
  - 함수내부에서 파라미터 형식이나 리턴형으로 사용된다.
  - 함수바디에서 사용하는 것도 가능하다.
  - 실제 자료형으로 대체되는 `place holder `이다.
  - Type Parameter의 이름을 `T` 로 생성했다고 해서 `T` 라는 이름의 새로운 형식이 생성되는 것은 아니다. 코드가 실행될 때 문맥에 따라서 실제형식으로 대체되는 `place holder` 일 뿐이다.  

- 보통은 이름으로 `T`를 사용하지만, 다른 이름으로 사용해도 괜찮다. 
  - 다만 형식이름으로 사용되기 때문에, UpperCamelCase로 선언한다.
  -  `<>(angle bracket)` 에 2개 이상 선언하는 것도 가능하다.

### Type Parameters 예시

```swift
func swapValue<T>(lhs: inout T, rhs: inout T) {
   let tmp = lhs
   lhs = rhs
   rhs = tmp
}

a = 1
b = 2
swapValue(lhs: &a, rhs: &b)
a // 2
b // 1

var c = 1.2
var d = 3.4
swapValue(lhs: &c, rhs: &d)
c // 3.4
d // 1.2
```

- Generic 함수는 형식에 관계없이 하나의 구현으로 모든 자료형을 처리한다.
- 일반함수와 비교해보면 작성해야 하는 코드의 양이 비약적으로 감소한다.

<br>

### Type Constraints (형식 제약)

```swift
<TypeParameter: ClassName>
<TypeParameter: ProtocolName>
```

```swift
func swapValue<T>(lhs: inout T, rhs: inout T) {
    if lhs == rhs { return } // error

    let tmp = lhs
    lhs = rhs
    rhs = tmp
}
```

- 기본적으로 제네릭함수로 전달하는 타입 파라미터 형식에는 제한이 없다. 

- Int에 들어있는 값을 비교할 수 있는 이유는 두 값을 비교하는 연산자가 구현되어 있기 때문이다.

- 우리가 직접 형식을 선언하면 비교기능 역시 구현해야 한다.

- 지금은 파라미터로 비교 기능이 구현되지 않은 값도 전달될 수 있기 때문에 error 발생

```swift
// 문제를 해결할려면? Type Constraints(형식 제약)

func swapValue<T: Equatable>(lhs: inout T, rhs: inout T) {
    if lhs == rhs { return }

    let tmp = lhs
    lhs = rhs
    rhs = tmp
}
```

- Type Constraints 를 통해 error 해결



<br>



### Speicialization (특수화)

```swift
func swapValue<T: Equatable>(lhs: inout T, rhs: inout T) {
   print("generic version")
   
   if lhs == rhs {
      return
   }
   
   let tmp = lhs
   lhs = rhs
   rhs = tmp
}
```

- 제네릭 함수는 기본적으로 형식에 관계없이 동일한 코드를 실행한다.

- 여기서 두 파라미터를 비교하고 있는데 문자를 비교하는 경우에도 Equatable 연산자로 비교한다.

- 대소문자를 무시하고 비교하고 싶다면 caseInsensitiveCompare method를 사용해야 한다. 이 method는 String 형식만 제공하기 때문에 여기에서 직접 바꾸는 것을 불가능하다. 이럴 땐 특수화를 통해서 특정 형식을 위한 함수를 구현한다.

```swift
func swapValue(lhs: inout String, rhs: inout String) {
    print("speciallized version")
    
    if lhs.caseInsensitiveCompare(rhs) == .orderedSame {
        return
    }
    
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

var a = 1
var b = 2
swapValue(lhs: &a, rhs: &b)
a
b

var c = "Swift"
var d = "Programming"
swapValue(lhs: &c, rhs: &d)
c
d
// 특수화로 구현한 두번째 함수는 Generic 함수를 Override한 함수로 인식한다.
// Generic 함수보다 우선순위가 높다.

```

---

---

<br>

<br>

# Generic Types

> Swift에서 Collection은 모두 구조체로 구현되어 있고, Collection에는 동일한 값만 저장할 수 있다고 공부했는데 Generic Types을 공부하고 나면 그 이유가 명확해진다. 



### Generic Type 선언

```swift
class Name<T> {
    code
}

struct Name<T> {
    code
}

enum Name<T> {
    code
}
```

- Generic Type은 새로운 형식이 아니다. 
- 기존 형식에 파라미터를 추가하면 Generic Type으로 선언된다. 
- 타입 파라미터는  형식이름뒤에 선언한다. 
- 문법은 제네릭 함수와 동일하다.
  - 형식제약 문법도 동일)하다.

- 제네릭 타입에서는 속성의 자료형, 메서드의 리턴형, 파라미터처럼 형식 내부에서 사용되는 형식들을 타입파라미터로 대체할 수 있다. 

### 형식 표기 방식

```swift
struct Color<T> {
    var red: T
    var green: T
    var blue: T
}

var c = Color(red: 128, green: 80, blue: 200)
// 생성 시 Int의 값을 전달했기 때문에 추론하여 c는 Int 형식

c = Color(red: 128.0, green: 80.0, blue: 200.0) ❌
// 이미 c를 생성시 Int로 했기 때문에
// Generic은 Int, Double 둘 다 만들 수 있기 때문

let d: Color //= Color(red: 128.0, green: 80.0, blue: 200.0) ❌
// 추론불가능

let d: Color<Int>
// 선언해야 한다.
```

### 익스텐션으로 제네릭 타입 확장

```swift
extension Color {
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

let intColor = Color(red: 1, green: 2, blue: 3)
intColor.getComponents() // [1,2,3]

let dblColor = Color(red: 1.0, green: 2.0, blue: 3.0)
dblColor.getComponents() // [1,2,3]
```

### 확장 대상 제한

```swift
extension Color where T: FixedWidthInteger {
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

let intColor = Color(red: 1, green: 2, blue: 3)
intColor.getComponents() // [1,2,3]

let dblColor = Color(red: 1.0, green: 2.0, blue: 3.0)
dblColor.getComponents() // [1,2,3] // error ❌
```



```swift
// Int 형식에만 지정하고 싶다면
extension Color where T == Int {
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

let intColor = Color(red: 1, green: 2, blue: 3)
intColor.getComponents() // [1,2,3]

let dblColor = Color(red: 1.0, green: 2.0, blue: 3.0)
dblColor.getComponents() // [1,2,3] // error ❌
```

---

---

<br>

<br>

# Associate Types (연관 형식)

```swift
associatedtype Name
```

**Protocol**

```swift
protocol QueueCompatible {
    func enqueue(value: Int)
    func dequeue() -> Int?
}
```

**Generic Protocol**

```swift
protocol QueueCompatible: T { ❌
		func enqueue(value: T) ❌
    func dequeue() -> T? ❌
}

// Swift에서는 허용되지 않는다,
```

- Generic Protocol을 허용할 때는 `Associate Types(연관 형식)` 이 필요하다

```swift
protocol QueueCompatible {
    associatedtype Element
    
    func enqueue(value: Element)
    func dequeue() -> Element?
}

// associatedtype은 protocol에서 사용하는 place holder
```

- associatedtype은 protocol에서 사용하는 place holder

```swift
class IntegerQueue: QueueCompatible {
    typealias Element = Int
    
    func enqueue(value: Int) {
        <#code#>
    }
    
    func dequeue() -> Int? {
        return 0
    }
}


class DoubleQueue: QueueCompatible {
    func enqueue(value: Double) {
        <#code#>
    }
    
    func dequeue() -> Double? {
        <#code#>
    }
}
```

