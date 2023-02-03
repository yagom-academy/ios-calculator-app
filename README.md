# iOS 커리어 스타터 캠프
# 🧮 계산기 

> 프로젝트 기간: 2023.01.24 ~ 2023.02.03
> 
> 팀원: 👨🏻‍💻[kaki](https://github.com/kak1x) | 리뷰어: 👨🏻‍💻[그루트](https://github.com/Groot-94)
>


## 목차
1. [프로젝트 소개](#프로젝트-소개)
2. [타임라인](#타임라인)
3. [폴더구조](#폴더구조)
4. [UML](#UML)
5. [실행 화면](#실행-화면)
6. [트러블 슈팅](#트러블-슈팅)
7. [참고 링크](#참고-링크)


# 프로젝트 소개

계산기 앱 구현

<br/>

# 타임라인 
<details>
    <summary><big>타임라인</big></summary>
- 23.01.24 (화): 알고리즘 학습, CalculateItem 프로토콜 생성 및 채택
<br>
- 23.01.25 (수): STEP1 Node, CalculaterItemQueue 구현 및 테스트
<br>
- 22.01.26 (목): STEP1 리뷰 내용 수정 (Generic 수정 및 refactor)
<br>
- 22.01.27 (금): STEP2 extension 추가, split 메서드 구현, Operater, Formula, ExpressionParser 구현 및 테스트
<br>
- 22.01.30 (월) : Formula result 메서드 로직 수정
<br>
- 22.01.31 (화) : 기본 계산 기능 구현, NumberFormatter 적용, ScrollView 구현
<br>
- 22.02.01 (수) : ScrollView Focus 문제 해결, 리팩토링(옵셔널 바인딩)
<br>
- 22.02.02 (목) : 오류 수정 및 리팩토링
<br>
- 22.02.03 (금) : STEP3 리뷰 내용 수정 (리팩토링)
</details>
<br>

# 폴더구조
<details>
    <summary><big>폴더구조</big></summary>
    <img src = "https://i.imgur.com/kkPb81d.png">
</details>

# UML
<details>
    <summary><big>STEP1</big></summary>
<img src = "https://i.imgur.com/qisRy98.png">
    </details>
    
<details>
    <summary><big>STEP2</big></summary>
<img src = "https://i.imgur.com/eaCq5CW.png">
    </details>
    
# 실행 화면
### 1. 계산기 앱 실행
<details>
    <summary>실행화면</summary>
<img src = "https://user-images.githubusercontent.com/51234397/216521383-9ae578ea-ae47-407b-be48-d3b2c0fda3d2.gif" width = "400">

- 계산기 기능이 정상적으로 작동됨.
    </details>

### 2. 계산 이후 계산
<details>
    <summary>실행화면</summary>
<img src = "https://user-images.githubusercontent.com/51234397/216521930-74b6e813-c44b-49be-891b-e0d0a9193976.gif" width = "400">

- 계산이 완료된 상태에서 계산 버튼을 눌러도 더이상의 연산은 실행되지 않음.
- 다른 연산을 추가해준 이후 계산 버튼을 누를 시 이전 연산 결과에 추가적으로 입력된 연산 결과를 보여줌. 
</details>

### 3. AC 버튼 선택
<details>
    <summary>실행화면</summary>
<img src = "https://user-images.githubusercontent.com/51234397/216522326-e4ad1685-7ee8-486a-9d55-2f25018ef5fc.gif" width = "400">

- AC 버튼을 눌러줄 경우 초기화면으로 돌아감.
</details>

### 4. CE 버튼 선택
<details>
    <summary>실행화면</summary>
<img src = "https://user-images.githubusercontent.com/51234397/216522512-c1ba047f-1d3a-4b1b-accd-a3a63ef80571.gif" width = "400">

- CE 버튼을 눌러줄 경우 입력 중이던 숫자가 초기화 됨.
</details>

### 5. 아무것도 입력되지 않은 상태
<details>
    <summary>실행화면</summary>
<img src = "https://user-images.githubusercontent.com/51234397/216522918-10c6b8ac-935c-42b0-b386-17423e7806cf.gif" width = "400">

- 아무것도 입력되지 않은 상태에서 연산 기호 버튼이나 계산 버튼을 눌러도 아무런 반응이 없음.
- 0에 0이나 00을 추가할 수 없음.
- .버튼을 눌러줄 경우 소수 입력으로 변경됨.
</details>

### 6. 연산 도중 연산자 변경
<details>
    <summary>실행화면</summary>
<img src = "https://user-images.githubusercontent.com/51234397/216522926-b0cf4530-fc24-43f1-86ed-32e3adddc225.gif" width = "400">

- 연산 도중 연산자 버튼을 눌러 연산자를 수정해줄 수 있음.
</details>


# 트러블 슈팅 

### 1. Double LinkedList ARC
```swift
final class Node {
    var prev: Node?
    var data: CalculateItem?
    var next: Node?
    
    init(_ data: CalculateItem?) {
        self.data = data
    }
}
```

![](https://i.imgur.com/v5yB6ev.png)

- Node에서 강한 참조를 사용하여 CalculatorItemQueue의 dequeue, clear 메서드를 실행해줄 경우 메모리 누수가 발생할 수 있는 현상을 발견하였습니다.

### ⚒️ 해결방법
```swift
final class Node {
    weak var prev: Node? // weak 선언
    var data: CalculateItem?
    var next: Node?
    
    init(_ data: CalculateItem?) {
        self.data = data
    }
}
```

![](https://i.imgur.com/Zqc1tH4.png)

- Node의 prev 프로퍼티에 weak 키워드를 사용해주어 ARC의 문제를 해결할 수 있었습니다.

### 2. 테스트 코드의 가독성
```swift
func test_dequeue_됐을경우_처음에_enqueue_해준_데이터가_반환된다() {
         sut.enqueue(data: "111")
         sut.enqueue(data: "222")
         sut.enqueue(data: "333")
         let result = sut.dequeue()!
         let expectation = "111"

         XCTAssertEqual(result, expectation)
     }
```

- 기존 테스트 코드는 아무런 구분 없이 작성하여 가독성이 떨어졌습니다.

### ⚒️ 해결방법
```swift
func test_dequeue_됐을경우_처음에_enqueue_해준_데이터가_반환된다() {
        // given
        sut.enqueue(111)
        sut.enqueue(222)
        sut.enqueue(333)
        let expectation: Double = 111
        // when
        let result = sut.dequeue()!
        // then
        XCTAssertEqual(result, expectation)
    }
```

- given, when, then으로 명확하게 구분해주어 테스트 코드의 가독성을 높일 수 있었습니다.

### 3. componentsByOperators 메서드의 구현
```swift
private static func componentsByOperators(from input: String) -> [String] {
    input.split(with: " ")
}
```
- 처음 `componentsByOperators` 메서드를 구현할때는 의도적으로 operator 양옆에 공백을 주는 식으로 구현할 생각이었기에 공백 기준 split을 해주는 방식을 선택하였습니다.
- 하지만 이는 `componentsByOperators` 메서드명과 맞지 않는 로직이라 생각되었습니다.

### ⚒️ 해결방법
```swift
private static func componentsByOperators(from input: String) -> [String] {
    var components = [input]

    Operator.allCases.forEach { Operator in
        var splitedComponents: [String] = []

        components.forEach {
            splitedComponents += $0.split(with: Operator.rawValue)
        }

        components = splitedComponents
    }

    return components
}
```
- 계산기 프로젝트 스토리보드 내의 음수(-)와 빼기 연산자 기호(−)가 다른 Charactor라는 것을 알게 되어 Operator의 rawValue를 수정해준 이후 이를 이용하도록 로직을 수정해주었습니다.

### 4. StackView 내부의 StackView 지우기
```swift
private func clearAllContentStack() {
    contentStack.arrangedSubviews.forEach { self.contentStack.removeArrangedSubview($0) }
}
```
- StackView 내의 StackView를 제거하기 위해 `removeArrangedSubview` 메서드를 사용했었는데, 해당 메서드는 StackView에서 뷰의 위치, 사이즈 관리를 하지 않을 뿐 Subview 자체를 끊어주지 않아 이전 내용이 이상한 위치에 출력되는 문제가 발생하였습니다.

### ⚒️ 해결방법
```swift
private func clearAllContentStack() {
    contentStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
}
```
- `removeFromSuperview` 메서드를 이용하여 연결을 완전히 끊어주어 이를 삭제해줄 수 있었습니다.

# 참고 링크
* [Swift 공식문서](https://www.swift.org/)
* [Swift) 큐(Queue) 구현 해보기](https://babbab2.tistory.com/84)
* [Swift) 양방향 연결 리스트(Doubly LinkedList) 구현 해보기](https://babbab2.tistory.com/87)
* [Apple 개발자 문서 - FloatingPoint](https://developer.apple.com/documentation/swift/floatingpoint)
* [Apple 개발자 문서 - NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
* [Apple 개발자 문서 - NumberFormatter.Style](https://developer.apple.com/documentation/foundation/numberformatter/style)
* [Apple 개발자 문서 - contentOffset](https://developer.apple.com/documentation/uikit/uiscrollview/1619404-contentoffset)
* [Apple 개발자 문서 - contentInset](https://developer.apple.com/documentation/uikit/uiscrollview/1619406-contentinset)
* [Apple 개발자 문서 - contentSize](https://developer.apple.com/documentation/uikit/uiscrollview/1619399-contentsize)
* [Apple 개발자 문서 - removeArrangedSubview](https://developer.apple.com/documentation/uikit/uistackview/1616235-removearrangedsubview)
* [Apple 개발자 문서 - removeFromSuperview](https://developer.apple.com/documentation/uikit/uiview/1622421-removefromsuperview)
