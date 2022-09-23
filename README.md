
# 🧮 계산기

## 📖 목차
1. [팀 소개](#팀-소개)
2. [Diagram](#Diagram)
4. [타임라인](#타임라인)
5. [트러블 슈팅](#트러블-슈팅)
7. [참고 링크](#참고-링크)

## 팀 소개
 |[baem🐍](https://github.com/dylan-yoon)|
 |:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/MhtaBYT.png">|

##  Diagram
###  Class Diagram
![](https://i.imgur.com/61SNEot.png)

##  타임라인

### 👟 Step 1
- 배열를 활용한 `CalculatorItemQueue`타입 구현
- `CalculateItem`프로토콜 생성하여 특정 타입만 입력받도록 구현
- Extention을 사용하고 CalculatorExtention 폴더로 그룹화
    - `Int+CalculateItem`
    - `String+CalculateItem`
- 테스트를 위한 `CalculatorTests`클래스 구현

##  트러블 슈팅

### 불필요한 메서드,프로퍼티 구현
Data Structure 를 처음 마주하고 구현을 처음 해보았다.
queue를 사용하기위해 여러 블로그와 글들을 마주 했는데, 이것 저것 구현하다보니
프로젝트 내에서 지금 당장 필요하지 않은 메서드들 또한 구현하게 되었다.

```swift=
 func test_dequeue실행시_queue가_값을_가질때_dequeue의_값이_반환되고_삭제되는지() {
        // given
        let queue1: Int = 10
        
        // when
        sut?.enqueue(queue1)
        let result = sut?.dequeue()

        // then
        XCTAssertEqual(sut?.count, 0)
        XCTAssertEqual(result as! Int, queue1)
    }
```
이 테스트에서와 같이 10번줄의 count프로퍼티가 직접적으로 사용하지는 않지만
테스트를 위해서 구현된것 처럼 보인다.
이렇게 불필요한 프로퍼티와 메서드를 구현하지 않도록 해야함.

### Equatable 과의 첫 마주침 

```swift=
struct CalculatorItemQueue {
    private var queue: [CalculatorItem] = []

    mutating func enqueue(_ element: CalculatorItem) {
        queue.append(element)
    }
    
    mutating func dequeue() -> CalculatorItem? {
        if queue.isEmpty {
            return nil
        }
        
        return queue.removeFirst()
    }
}
```

```swift=
struct Cal

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
     func test_dequeue실행시_queue가_값을_가질때_dequeue의_값이_반환되고_삭제되늕() {
         // given
         let queue1: CalculatorItemQueue = 10
         let queue2: CalculatorItemQueue = "intss"
         
         // when
         sut?.enqueue(queue1)
         sut?.enqueue(queue2)
         
         let result = sut?.dequeue()
         
         // then
         XCTAssertEqual(sut?.count, 1)
         
         // XCTAssertEqual(result as! Int, queue1)
          XCTAssertEqual(result , queue1) // ->  why?
     }
}
```
처음에 위와같이 구현하려고 했었다.
하지만 `equatable` 오류 메세지를 마주했다.

이유는 34번째줄의 result와 queue1는 비교할 수 없는 타입인 것이다.
해결하기 위해서 CalculatorItem에 Equatable을 채택해서 비교 가능하게 만들어 주어야 하는데
Test를 하기위해 불필요한 구현을 하면 안된다 생각하고, 아래와 같이 변경했다.

```swift=
let queue1: Int = 1

XCTAssertEqual(result as! Int, 1)
```
타입캐스팅을 해서 Test 에 맞는 test를 해야한다 생각했다.
불필요한 구현을 최대한 줄이고 이유 있는 코드로 만들도록 해야겠다.

## 참고 링크


[Equatable](https://developer.apple.com/documentation/swift/equatable/)
[Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
[Swift Language Guide - Extentions](https://ko.wikipedia.org/wiki/유닛_테스트)
[Unit Test](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)



 
