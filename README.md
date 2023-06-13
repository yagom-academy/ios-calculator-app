# 계산기 [STEP 2]
> UML대로 연산과 관련한 타입을 구현합니다.
> 변수보다는 상수를, 반복문 조건문 보다는 고차함수를 사용하여 코드를 작성합니다.
> TDD를 적극 수행하여 코드를 작성합니다.

## 📚 목차
- [자기소개](#-자기-소개)
- [타임라인](#-타임라인)
- [실행화면](#-실행화면)
- [트러블 슈팅](#-트러블-슈팅)
- [참고자료](#-참고자료)

## 🧑‍💻 자기 소개
|<img src="https://github.com/devKobe24/BranchTest/blob/main/IMG_5424.JPG?raw=true" width="200" height="200"/>|
| :-: |
| [**Kobe**](https://github.com/devKobe24) |

## ⏰ 타임라인
프로젝트 진행 기간 | 23.06.03.(토) ~ 23.06.09.(금)

| 날짜 | 진행 사항 |
| -------- | -------- |
| 23.06.03.(토)| removeFirst 함수 로직 변경.<br/>Test Double를 위한 CalculateItemProtocol 구현<br/>DummyLinkedList, MockCalculatorItemQueue 구현. <br/>private 제어 접근자 삭제.<br/>CalculatorItemQueue 단방향 리스트로 수정.<br/>코드 전면 수정.<br/>Mock Object와 Dummy Data 활용한 테스트 성공[GREEN]<br/>접근 제어자 설정.<br/>enqueue 확인 테스트 [RED]<br/>enqueue 호출시 데이터가 쌓이는 테스트[GREEN]<br/>MockNode 클래스 생성.<br/>Node타입을 MockNode<T> 타입으로 변경.<br/>CalculateItemProtocol에 Equatable을 채택.<br/>MockNode의 Value값 비교 테스트[GREEN]<br/>테스트 코드 성공, MockNode 생성, Equatable 채택, MockNode 타입으로 변경.<br/>CalculateItem 프로토콜 Equatable 채택.<br/>LinkedList의 T가 CalculateItem 채택.<br/>Node 클래스와 T 타입 Equatable 채택.<br/>불필요한 코드 삭제.<br/>접근 제어자 변경, MockLinkedListProtocol 생성.<br/>접근 제어자 삭제.<br/>Mock enqueue Test code 수정.<br/>dequeue시 데이터 삭제 테스트[GREEN]<br/>isEmpty 호출시 true 반환 테스트[GREEN]<br/>isEmpty 호출시 false 반환 테스트[GREEN]<br/>front 호출시 head 값 가져오는 테스트[GREEN]<br/>front 호출시 nil값 반환 테스트[GREEN]|
| 23.06.05.(월)| DummyLinkedList에서 MockLinkedList로 변경.<br/>MockNode에서 DummyNode로 변경.<br/>|
| 23.06.06.(화)| 열거형 ExpressionParser 구현 및 파일 생성.<br/>Formula 파일 생성및 구조체 생성.<br/>FormulaProtocol 구현.<br/>Formula 구조체 임시 구현.<br/>ExpressionParser 열거형 임시구현.<br/>MockFormula 객체 생성.<br/>Double를 확장, CalculateItem 채택. <br/>Operator 열거형 임시 구현, Operator 확장.<br/>String Extension 파일 생성 및 임시 구현.<br/>calculate 메서드 수정.<br/>제네릭 CalculateItem 채택, 불필요 코드 삭제.<br/>LinkedListProtocol 채택.<br/>Operator 테스트를 위한 Mock 객체 생성.<br/>Operator의 add 테스트[GREEN]<br/>코드 정리, add 테스트, Mock객체 생성.<br/>Operator subtract 호출시 테스트[GREEN]<br/>Operator의 divide 호출시 테스트[GREEN]<br/>Operator의 multiply 테스트[GREEN]<br/>프로토콜, 구조체 내부 로직 수정.<br/>result 호출시 operator에 따른 결과값 반환 테스트[RED]<br/>프로토콜, 구조체 내부 코드 수정, 테스트 실패|
| 23.06.07.(수)| String Extension 로직 변경.<br/>불명확한 테스트 함수 이름들 수정. <br/>테스트를 위하여 프로토콜과 구조체 코드 수정.<br/>ExpressionParser의 Mock 객체 생성. <br/>operator 초기값 할당 테스트[GREEN]<br/>Mock객체 생성, add 테스트, 프로토콜과 구조체 수정.<br/>MockFormula operator subtract 테스트[GREEN]<br/>MockFormula operator divide 테스트[GREEN]<br/>MockFormula operator multiply 테스트[GREEN] <br/> split 내부 코드 수정.<br/>MockFormula operands 테스트[GREEN]<br/>MockFormula result 내부 코드 수정.<br/>MockFormula result operands 반환 테스트[GREEN]<br/>MockFormula result 메서드 내부 코드 수정.<br/>MockFormula result operands 반환 테스트[RED]<br/>MockFormula result 메서드 로직 변경.<br/>MockFormula results 연산자 add 테스트[GREEN]<br/>test 케이스 코드 수정.<br/>MockFormula results subtract 호출 테스트[GREEN]<br/> MockFormula results divide 테스트[GREEN]<br/>MockFormula results multiply 테스트[GREEN]<br/>잘못된 띄어쓰기 수정.<br/>componentsByOperators 함수 로직 변경.<br/>componentsByOperator 호출 테스트[RED]<br/>componentsByOperators 내부 로직 변경.<br/>componentsByOperators 호출 테스트[GREEN]<br/>componentsByOperators 메서드 로직 수정.<br/>componentsByOperators 메서드 호출 테스트[GREEN]|
| 23.06.08.(목)|componentsByOperators 메서드 내부 로직 수정.<br/>|
| 23.06.09.(금)| parse 메서드 내부 로직 수정.<br/>parse 메서드 호출시 MockFormula 객체 반환 테스트[GREEN]<br/>테스트를 위하여 프로토콜과 구조체 코드 수정.<br/>ExpressionParser의 Mock 객체 생성.<br/>Protocols 파일생성, LinkedListProtocol 파일 생성 및 구현.<br/>CalculateItem 파일생성 및 구현.<br/>Protocols 하위에 FormulaProtocol 파일 생성. <br/>Extensions 폴더 생성 및 String+Extension 파일 이동.<br/>Doule+Extension 파일 생성 및 코드 이동.<br/>Operator+Extension 파일 생성 및 코드 이동.<br/>Operator+Extension 코드 수정.<br/>componentsByOperators 내부 코드 수정[BLUE].<br/>불필요한 주석 삭제.<br/>FormulaProtocol 코드 수정.<br/> Formula 구조체 코드 수정.<br/> Formula의 operators 제네릭 타입 수정[BLUE]<br/>ExpressionParser의 parse 내부 로직 수정[BLUE] <br/> Formula의 result 함수 내부 로직 수정[BLUE].<br/>README 작성|

## 📺 실행화면
- 계산기 Unit Test 실행 화면 <br>
<img src = "https://github.com/devKobe24/images/blob/main/230609TEST_GIF.gif?raw=true" width = 700>

## 🔨 트러블 슈팅 
1️⃣ **제네릭을 2개 받기** <br>
🔒 **문제점** <br>
Operands와 Operators 각각의 제네릭 타입을 받아야 했습니다.
문제는 T 한 가지 타입으로만 두 Operands와 Operators를 제네릭으로 받아 관리하고 있었습니다.
각기 다른 타입을 받아야하는 관계에 문제가 발생했었습니다.

🔑 **해결방법** <br>
학습을 통해 여러개의 제네릭을 받을 수 있다는 점을 인지하고 각기 다른 T,U 제네릭 타입을 구현하고 채택했습니다.
따라서 Operands와 Operator 각각 다른 제네릭 타입을 갖을 수 있게 되었습니다.


2️⃣ **고차함수의 사용** <br>
🔒 **문제점 2** <br>
반복문과 조건문 대신 고차함수를 사용하려 노력했습니다.
그러다보니 가독성이 떨어질때도 있고 한 편으로는 코드가 짧아지는 장점도 있었습니다.
그리고 고차함수에 대한 제대로된 이해가 없어서 잘 사용하지 못하는 문제가 있었습니다.

🔑 **해결방법** <br>
활동학습과 직접 고차함수 구현을 통해 고차함수가 어떻게 구현되고 동작하는지에 대해 알아보고 이해한 다음 고차함수를 사용했습니다.
가독성이 너무 떨어지지 않는 선에서 고차함수를 사용하려 노력했습니다.


🤔 **고민했던 점** <br>
- UML만을 보고 함수와 전체 적인 구조를 생각하고 구현하는 것을 많이 고민했습니다.
- 고차함수의 사용의 장점과 단점에 대해서 고민했습니다.
- 제네릭과 프로토콜 그리고 익스텐션의 조합이 어떤 형식으로 프로그램이 짜여지는지 고민했습니다.
- SOLID를 어떻게 적용할지 많이 고민했습니다.


## 📑 참고자료
- [제네릭](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
- [TDD & Unit Test](https://yagom.net/courses/unit-test-%ec%9e%91%ec%84%b1%ed%95%98%ea%b8%b0/)
- [프로토콜](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/)
- [Extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions/)
- [고차함수 TIL](https://github.com/devKobe24/TIL/blob/main/TIL/230609_TIL.md)
- [UML-넥스트리소프트](https://www.nextree.co.kr/p6753/)
- [SOLID TIL](https://morgan-kang.notion.site/230520-TIL-SOLID-d77c52091c874ef4848376d248ee1eae)

