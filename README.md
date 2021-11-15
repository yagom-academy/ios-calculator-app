## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

## 프로젝트 소개
1. 숫자 및 기호 버튼을 이용해 연산을 입력합니다.
1. AC버튼은 모든 연산내역을 초기화 하고, CE는 현재 입력하던 숫자나 연산결과만 삭제합니다.
1. +/-버튼으로 숫자의 부호를 변환합니다.
1. 숫자입력중에 연산자(+,−,×,÷)를 누르면 입력을 중지하고 다음 숫자 입력을 받습니다.
1. 숫자입력이 없는 0인 상태에서는 연산자를 반복해서 누르면 연산이 되지 않고 연산자의 종류만 변경합니다.
1. = 버튼을 누르면 입련된 전체 연산을 수행합니다.
1. 0으로 나누면 결과값은 NaN으로 표기합니다.

### 의존모둠 그라운드 룰
- 스크럼
  - 오전(11시~최대 1시간 30분): 어떤 것을 할 것인지, 어떤 것이 막혔는지
  - 오후(17시): 서로 막힌 부분 공유, 감정 공유
  - 활동학습 있는 날은 오후 스크럼만
  - 수요일 No 스크럼
- 커뮤니케이션
  - 솔직하게 의사소통하자

### 프로젝트 일정
1) 1주차 - STEP1
    - 11/08 (월)
      - 그라운드 룰 설정
      - 스크럼 (오늘 할일, 컨디션/감정/일정 공유)
      - GitHub Issue, Milestones, Projects 생성
      - TDD 학습 및 STEP1 구상
    - 11/09 (화) - STEP1 PR 요청
      - 스크럼 (어제 한 일/오늘 할 일, 컨디션/감정/일정 공유)
      - 테스트 코드 포함 전체 코드 구현
      - UML 작성
      - README 작성

## STEP1
### 구현 내용
 - TDD를 위한 각 테스트 케이스 생성
 - CalculateItem 빈 프로토콜 생성
 - CalculateItem을 채택하는 CalculatorItemQueue 구조체 생성
 - CalculatorItemQueue은 연산자와 숫자 Queue에서 모두 사용할 수 있도록 Generic 타입으로 생성
  (Queue를 구현하기 위해 Double Stack 방식 사용)
 - Operator 연산자 타입(열거형) 생성

### UML
![](STEP1_UML.png)

### 고려사항
* 주요 사용자 정의 타입
	 - CalculatorItemQueue : 여러 요소에서 Queue를 사용하기 위해 타입을 Generic으로 생성하여 각 요소의 타입으로 사용할 수 있도록 구현
* 주요 프로퍼티
   - inbox/outbox : Double Stack으로 Queue를 구현하기 위해 요소가 들어오는 inbox, 내보내는 outbox를 생성함

* 주요 메서드
   - enqueue : element를 inbox에 추가
   - dequeue :  
      1) inbox & outbox가 비어있으면 빼낼 값이 없기 때문에 nil을 반환
      2) inbox에 요소가 있고 outbox가 비어있다면 inbox에 reversed메서드를 사용해 outbox로 할당해준 다음 removeAll메서드로 비워줌
      3) outbox에 removeLast메서드를 사용하면 사실상 Queue의 첫번째 요소가 나오게 됨
  
### 키워드
   - TDD, Unit Test, Queue, Double Stack, Generic, UML 

