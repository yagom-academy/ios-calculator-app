# README - 계산기



---
### 목차
1. 개요
2. 타임라인
3. 시각화된 프로젝트 구조
4. 실행화면(기능 설명)
5. 트러블 슈팅
6. 참고 링크


---
# 1. 개요
### 계산기 프로젝트
- TDD기반으로 구현한 계산기 프로젝트입니다.
- 팀원: @LJ
---
# 2.타임라인
220919    
- 프로젝트에 필요한 개념 익히기(공식문서, 야곰닷넷UnitTest강의)

220920
- UML 그리기
- 프로토콜과 큐를 배열로 구현한 CalculateItemQueue파일 추가
- 더블스택큐 방식으로 수정, STEP-1 PR 요청

220921
- 더블스택큐 방식으로 수정, PR 피드백 이해 및 리팩토링
- re-PR 요청, merge완료

220922
- 제시받은 UML 해석
- 실제 계산해주는 Formula 테스트 작성 및 수행

220923
- 숫자와 연산자를 적절히 분리
- 저장하는 ExpressionParser 구현

220924
- 조건문,반복문 고차함수로 리팩토링

220925
- 오류처리 목적 Error 타입 추가

220927
- 0으로 나누기연산 오류처리 구현
- STEP-2 PR 요청

220929
- PR 피드백내용 리팩토링
Operater파일 초기화부분, optional값 unwrapping 구현방법, Formula파일 연산자배열 값확인부분

220930
- PR 피드백내용 리팩토링
split메서드 구현, ExpressionParser파일 연산자분리 CaseIterable 활용부분

# 3.시각화된 프로젝트 구조
(추후 추가 예정)

# 4.실행화면(기능 설명)
(추후 추가 예정)

---
# 5. 트러블슈팅
### STEP 1
#### 고민한점
- ### 배열과 리스트 중 어떤 방법으로 구현해야 하는지
리스트의 장점은 리스트에 포함된 여러개의 데이터 중 중간에 있는 값을 삭제하거나 특정 위치에 삽입할 때 속도가 빠른점인데, 계산기의 경우에는 그런 상황의 가능성이 적을 것이라 예상하였습니다.
또한 요구사항명세서 명시된 내용중 하나인 맨 마지막에 입력받는 값만 지우는 기능인 CE버튼을 사용하는 경우 리스트는 처음부터 맨 마지막까지 찾아가서 확인 후 지워야해서 비효율적이기 때문에 배열로 구현하였습니다.

- ### 입력받는 숫자와 연산자를 열거형으로 구현한 이유
사용자로부터 입력받은 숫자와 연산자가 계산기의 버튼으로 한정되어있기 때문에 한정된 값 이외에는 입력받지 않을 수 있는 타입인 열거형으로 사용하였습니다.

- ### 제네릭 사용
`CalculatorItemQueue`에서 `CalculateItem프로토콜`을 채택하였습니다.
▶️ 문제점 1
그 후 테스트파일에서 제네릭 매개변수로 받은 T를 추론할 수 없다는 에러메세지가 떴습니다.
    > Generic parameter 'T' could not be inferred

    ▶️ 문제점 2
    > Type 'Double' does not conform to protocol 'CalculateItem’ 
    
    `Double` 타입이 `CalculateItem프로토콜`을 채택하지 않았다는 에러메세지가 떴습니다.
▶️ 해결방법
 `CalculateItem프로토콜`에서 `extension`기능을 이용하여 `Double`타입도 이 프로토콜을 채택하도록 해주어 해결하였습니다.
```swift
extension Double: CalculateItem {
}
```
`extension`은 타입(구조체, 클래스, 열거형, 프로토콜, 제네릭)에 새로운 기능을 추가할 수 있는 기능입니다. 재정의하여 사용하는 것은 불가합니다.

```swift
extension 확장할타입이름: 프로토콜1이름, 프로토콜2이름 {
    //프로토콜 요구사항 구현
}
```

#### 배운개념
queue(선형,원형), List(노드,단방향,양방향), TDD, enum, UML, extension, Generic, 빈프로토콜의 역할

---
### STEP 2
#### 고민한점
- ### TDD 기반으로 수행할 때 실패테스트 작성
반환값이 있는 메서드의 경우에는 반환값을 실패하도록 주어 수월했으나 반환값이 없는 메서드의 경우에는 실패하게 할 반환값이 없었습니다. 
▶️ 해결방법 : 조건이 필요한 메서드의 경우 조건문 없이 특정 상황을 그대로 마주하여 실패하도록 테스트한 후 리팩토링 하였습니다.

- ### 열거형 연산프로퍼티 초기화를 해야하는지
열거형타입이면서 저장프로퍼티를 갖지 않고, 메서드인 연산프로퍼티만 갖는 경우, 테스트파일에서 초기화를 하지 않았다는 오류가 생겼습니다.
![](https://i.imgur.com/xJbAgeW.png)
▶️ 해결방법 : static 키워드를 enum에 있는 메서드에 붙여주어 해결하였습니다. static 키워드를 붙이면 연산프로퍼티가 연산 타입 프로퍼티가 되어 초기화할 필요 없이 테스트파일에서도 접근할 수 있기 때문에 해결할 수 있었습니다.

- ### 0으로 나누기 결과값 처리
구현목표 : 0으로 나누기를 시도할 경우 "NaN" 을 화면에 보여준다.

우선 0으로 나누기를 시도하는 경우의 상황을 예상해보았습니다.
➡️ 고민방법 1 : 나누기연산의 피연산자 중 rhs가 0일 때
➡️ 고민방법 2 : 0을 받고나서 결과값.isInfinite == ture 일 때
rhs가 0 인경우는 0을 곱할 수도 있는 다른 경우의 수가 있기 때문에 나누기 연산 후 결과값으로 처리하는 방법으로 결정 하였습니다.

▶️  결과값 처리방법 1 : do-catch문 사용하여 에러 처리
do-catch문으로 구현할 경우 rethrow를 두번하여 반환값이 없는곳까지 던져야했습니다. 그 이유는 반환값을 갖는 메서드는 에러를 던지는 상황에서 어떤값을 반환해야할지 오류가 났기 때문입니다.
rethrow를 위해 0으로 나누기 연산을 호출한 코드, 0으로 나누기 연산의 결과값을 담는 코드에 do-catch구문을 작성해주었습니다.
테스트 파일에서는 에러를 XCTAssertThrowsError메서드를 이용하여 받은 후 예상한 에러와 일치하는지 XCAssertEqual 메서드를 이용하여 테스트 성공여부를 판단하였습니다.
▶️  결과값 처리방법 2 : infinity 값을 조건문으로 확인하여 처리 
0으로 나누기 연산의 결과값인 inf 에 대해 알아보았습니다.
Double 타입에서 지원하는 값이었습니다. 나누기연산을 계산하는 역할을 맡은 Operator파일의 calculate메서드의 반환타입도 Double이었으므로 Double.infinity값을 테스트파일로 받아올 수 있었습니다.
0으로 나누기 연산의 결과값이 테스트코드에서 예상한 결과값인 Double.infinity와 일치하면 NaN을 출력하게 하였습니다.

▶️ 해결방법 : Double.infinity 값을 활용하는 두번째 방법으로 해결하였습니다.

- ### LLDB 활용
활용목표 : print문을 사용하지 않고, 콘솔창에서 lldb 명령어를 이용하여 디버깅한다.
➡️ 주로 사용한 명령어
```swift
// 생성, 확인
(lldb) br list   // bp 목록,  클릭한 파란bp도 포함
(lldb) br list -b   //간단하게 확인하기
(lldb) b 30      // 현재파일 30번줄 bp 걸기


// 삭제
(lldb) br de        //breakpoint 전체삭제
(lldb) br de 3      //3번 breakpoint 삭제


// 값 확인
(lldb) p 변수명    // 변수명 값 확인하기   ex. (Int) $R3 = 5
(lldb) po 변수명   // 변수 정보 알려줌     ex. 5     (배열은 몇개요소 가졌는지)

// lldb 진행
(lldb) run        // 명령어로 설정한 bp 다 지워짐, 새롭게 다시 진행
(lldb) n          // 다음줄
(lldb) c          // 다음 breakpoint 나타날때까지 진행, continue
(lldb) finish     // 시뮬레이터는 정지 안됨, 함수return이후 지점까지 진행 
```
➡️ 활용내용
- 정상인 경우
테스트 할 때 피연산자 3개, 연산자 2개가 있는 식에서 값이 배열에 순서대로 정상 저장되는지 확인해보았습니다.
첫번째 연산의 결과가 두번째 연산을 할 때 lhs(연산자 기준 왼쪽피연산자)에 올바른 계산결과값이 저장되는지 확인할 수 있었습니다.
- 오류의 경우
비어있는 값을 피연산자변수에 저장하려고 할 때, nil병합 연산자로 임의의 값(99.999)를 저장하게 했던 코드가 있었습니다.
코드 진행 순서로 값 확인을 하던 중 `(lldb) p Formula.rhs` 에서 99.999가 출력되는걸 보고 어느시점에서 잘못된건지 알 수 있었습니다.  

➡️ 다음목표 : lldb상에서 변수를 생성, 변수에 값 담아 확인하기, 주소값 이용해보기

#### 배운개념
UML표기규칙(관계화살표,접근제어자+/-,static밑줄 등), 연산프로퍼티와 연산타입프로퍼티의 차이
클로저, do-catch구문, XCTFail, XCTAssertThrowsError, Double.Infinity, Double.nan, 사용자정의 연산자, LLDB

---
# 6.참고
야곰 스위프트프로그래밍 책
[제네릭함수 /Swift공식문서 Generic Functions](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
[익스텐션 /Swift공식문서 Extension > Extension Syntax](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
[Protocol extension /야곰블로그](https://blog.yagom.net/529/)

[UML reference 1](https://www.nextree.co.kr/p6753/)
[UML reference 2](https://rldd.tistory.com/m/365)

[XCTAssert /XCTFail](https://developer.apple.com/documentation/xctest/1500970-xctfail)
[XCTAssert /XCTAssertThrowsError](https://developer.apple.com/documentation/xctest/1500795-xctassertthrowserror/)

[infinity /애플개발자Documentation > Swift > Double > infinity ](https://developer.apple.com/documentation/swift/double/infinity)
[nan /애플개발자Documentation > Swift > Swift Standard Library > Numbers and Basic Values > Numeric Protocols > FloatingPoint > nan ](https://developer.apple.com/documentation/swift/floatingpoint/nan)

[사용자정의연산자 /Swift공식문서 Advanced Operators > CustomOperators ](https://xho95.github.io/swift/language/grammar/advanced/operator/2020/05/11/Advanced-Operators.html)
[사용자정의연산자 사용가능기호 /Swift공식문서 Lexical Structure > Operators](https://xho95.github.io/swift/language/grammar/reference/lexical-structure/2020/07/28/Lexical-Structure.html#operators-%EC%97%B0%EC%82%B0%EC%9E%90)
