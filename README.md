# 계산기

## ⭐️ 목차

1. [팀원소개](#팀원소개)
2. [STEP 1 소개](#step-1-소개)
3. [타임라인](#타임라인)
4. [UML](#uml)
5. [트러블 슈팅](#step1-트러블슈팅)
6. [Reference](#reference)

---

## 팀원소개
|<center>무리</center>|
|---|
|<img width="200" alt="image" src=https://i.imgur.com/U7TmXby.jpg>|

## STEP 1 소개 

> **Queue 타입 구현**
- 프로젝트에 단위 테스트(Unit Test)를 위한 타깃을 추가합니다.
- 계산기가 입력받은 숫자와 연산자는 연산큐에 쌓입니다.
    - 사칙연산 계산을 위한 큐(Queue) 타입(`CalculatorItemQueue`)과 큐타입 구현을 위한 List 타입을 직접 UML로 표현해봅니다.
- `CalculatorItemQueue`를 코드로 구현합니다.
    - `CalculatorItemQueue`의 내부구현은 자율로 합니다.
    - `CalculatorItemQueue`에서 다루는 요소는 `CalculateItem` 프로토콜을 준수합니다.
        - `CalculateItem` 프로토콜은 빈 프로토콜입니다.
    - `CalculatorItemQueue`의 내부에서 사용하는 List 형식의 자료구조를 직접 구현해보고 싶다면 List 자료구조를 구현해봐도 좋습니다(선택사항)

### ⭐️ 스텝 수행 중 핵심 경험

<details>
<summary>스텝별 핵심경험</summary>

### STEP 1

- [x]  TDD 시작하기
    - [x]  기존의 프로젝트에 Test Target 추가
- [x]  Queue 자료구조의 이해와 구현
- [ ]  List 자료구조 직접 구현해보기(선택)
    - [ ]  리스트를 활용하여 Queue 구현(선택)

</details>

---

## 타임라인

|STEP|날짜|타임라인|
|---|---|---|
|STEP1|2023.01.24|- 유닛테스트 타겟 설정 </br>- CalculatorItemQueue.swift파일 생성 </br>- CalculatorItemQueue 변수 data, isEmpty, count 생성, enqueue메서드 생성</br>- dequeue호출 시 test코드 작성|
|STEP1|2023.01.25|- 배열값 전체 삭제 메서드 테스트 구현</br>- clearAll메서드 추가, test코드 메서드 명 변경 및 순서 변경</br>- 변수 head추가 및 dequeue로직 수정</br>- 변수 first, last 생성 및 테스트코드 구현 </br>- Calculator프로토콜 생성 및 채택 </br>- dequeue로직 수정|
|STEP1|2023.01.27|- dequeue test code 메서드 네이밍 변경 </br>- dequeue test code 메서드 수정 </br>- 제네릭 타입 네이밍 수정, 프로토콜 채택 </br>- test를 위한 Int 타입 protocol extension 사용</br>- data 접근제어자 설정 및 테스트 코드에서 사용하는 sut.data 수정|

---

## UML

![](https://i.imgur.com/SpkUBq1.png)

---

## STEP1 트러블슈팅

### 1️⃣ 타겟 설정 중 만난 오류
<img src='https://i.imgur.com/aq0suTq.png' width='800'>

- 타겟 설정 중 `No such module 'XCTest'`, `No such module 'UIKit'` 등의 오류를 보게되었습니다.
- 인스펙터의 타겟 멤버쉽에서 필요하다고 생각되어 체크해주었던 `Calculator`를 해제하니 정상적으로 작동하는 모습을 보았습니다.

### 2️⃣ 제네릭 타입의 사용과 제네릭 타입의 프로토콜 채택

- `Queue`를 처음 사용하다보니 구글링을 통해 정보를 많이 접해보려고 노력했습니다. 
대부분의 예시에서 `Queue` 사용 시 `제네릭` 을 함께 사용하는 모습을 보고 `제네릭` 에 대해 공부하는 시간을 가질 수 있었습니다!
- 제네릭의 사용 이점은 추상적이기 때문에 유연하고 광범위하게 사용할 수 있으며 `CalculatorItemQueue` 의 인스턴스가 생성 될 때 타입이 정해지기 때문에 `CalculatorItemQueue`내부에서  `제네릭 타입` 으로 사용한 부분에선 같은 타입으로 비교할 수 있다는 점도 있었습니다.
- 요구사항 중 
>`CalculatorItemQueue`에서 다루는 요소는 `CalculateItem` 프로토콜을 준수합니다.

   위의 부분을 이해하는데 조금 시간이 필요했던 것 같습니다. 처음 저 문구를 봤을 때 작성한 UML에서는 `CalculatorItemQueue<T>: CalculatorItem` 으로 사용하고있었는데 **내부에서 사용하는 요소**가 프로토콜을 준수해야한다고 하여 `CalculatorItemQueue<T: CalculatorItem>`으로 수정하였습니다.
- `Type 'Int' does not conform to protocol 'CalculatorItem'`
하지만 이렇게 수정하고보니 test코드에서 오류가 발생했는데요😢… 멘토링 중에 발견하여 멘토의 도움을 받아 해결하게되었습니다.
test코드에서는 계산기이고 숫자를 다룰테니 `<Int>`로 설정하여 테스트 하고있었는데, 저 Int타입은 CalculatorItem을 채택하고 있지 않아서 발생한 오류였습니다.
- protocol에서 `extenstion Int: CalculatorItem { }` 확장을 해주고 나니 정상적으로 실행할 수 있었습니다.

~~위의 오류 해결 중간에 타겟 멤버쉽으로 CalculatorItem을 찾을수 없다는 오류도 만나게되어서… 이번 1, 2번의 트러블 슈팅으로 타겟 멤버쉽은 왠만하면 건들지 말아야겠다는 교훈을 얻었습니다…~~

### 3️⃣ 효율 좋은 dequeue()

- 처음 UML을 그릴때만 해도 `dequeue()`는 맨 앞에있는 숫자 하나만 제거해주니까 막연하게 `removeFirst()` 를 사용해주면 되겠다고 생각했습니다.
그러다 자료를 찾아 공부하면서 `시간복잡도` 를 생각하여 `dequeue` 해주어야 효율적이라는 글들을 많이 접하게되어 최대한 이해하며 따라해보았습니다.
- `var head`를 생성하여 `dequeue()` 호출 시 삭제되는 값은 `nil`로 변환 후 어느정도 이상(코드에서는 배열의 count가 40이상, head ÷ count가 0.25이상)이면 `nil`값을 한번에 삭제하는 방향으로 진행하게 되었습니다.

> 그냥 `dequeue` 하게 되면 뒤쪽의 element를 하나하나 옮기며 O(n)의 시간복잡도를 가지며 오버헤드가 발생할 수 있기 때문에 효율적인 `dequeue`가 중요하다고 합니다!

### 4️⃣ 접근 제어자

- 아직까지도 어렵게 느껴지는 부분입니다. 막연하게 어느 정보를 숨겨야하고, 어느 정보를 숨기지 않아도 되는가로만 생각을 하니 와닿지 않았는데, 멘토링을 통해 (계산기)사용자가 알아도 되는 부분은 (현재는)`internal`로, 숨겨야하는 부분은 `private` 으로 설정해보자는 생각이 들었습니다.
- 메서드 같은 경우엔 사용을 하라고 구현을 해놓았기 때문에 모두 `internal`로 사용해보았습니다.
- `var data`같은 경우는 `Queue`를 배열로 쓰고있기 때문에 `Queue` 의 사용을 유도하기 위해서는 숨기는게 맞다고 생각이 들었습니다. 
하지만 test 파일에서 저 조차 `sut.data = [1, 2, 3]` 등으로 사용하고 있었기 때문에 전체적으로 수정하는 과정이 필요했습니다🥲

---

## Reference

- [소들이블로그-큐 구현해보기](https://babbab2.tistory.com/84)
- [두두블로그-큐](https://velog.io/@aurora_97/Swift-큐)
- [이누의개발성장기-큐 구현](https://inuplace.tistory.com/1188)
- [swift공식문서-Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
