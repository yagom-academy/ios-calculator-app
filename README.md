# 계산기 프로젝트

[팀그라운드룰](https://github.com/stevenkim18/ios-calculator-app/blob/main/docs/teamGroundRule.md)

## 팀원
SJ, Steven, Kio

## 기간
21/03/21 - 21/04/04
## 타임 라인
- 3/21(월): 팀 그라운드 룰 작성, UML 공부 및 실습
- 3/22(화): Stack, 제네릭, 프로토콜 개념 공부, [새로운 지식을 나의 지식으로 만드는 법] 특강, 10진수 계산기 메인 로직 고민해 보기
- 3/23(수): 보충학습(이벤트 기반 프로그래밍, 클로져, 프로토콜), 10진수 계산기 테스트 코드 작성
- 3/24(목): 이진수와 비트 논리 연산 공부, 리뷰어와 상담, 활동학습(solid 강의)
- 3/25(금): 간단하게 10진수 계산기 ui구성, 정수만 가능한 계산기 구현 완료, 코드 리팩토링
- 3/29(월): TDD, NumberFormatter() 사용하여 10진수 계산기 실수처리 및 9자리 제한
- 3/30(화): 비트 논리 연산, 두 수에 관한 2진수 계산기
- 3/31(수): 첫번째 pr 보냄.
- 4/01(목): 오토레이아웃(스택뷰) 실습, 리뷰 코멘트 바탕으로 코드 수정
- 4/02(금): 10진수 계산기 코드 리펙토링

<br>

## 협업(collaborate)
### 사용했던 Tools
- discord
- Zoom
- vscode live share

### 협업 진행 방식
- zoom이나 discord로 음성 소통을 함. 
- 매일 돌아가면서 팀원 한명이 xcode와 vscode를 동시 열고 vscode live share을 사용해서 페어프로그래밍을 함.
- xcode를 킨 팀원이 zoom이나 discord를 통해서 화면 공유를 함.
- live share를 공유 받은 팀원은 vscode에서 코드를 작성하고 xcode를 킨 팀원은 수시로 새로 작성한 코드에서 오류가 있는지 확인을 하고 다른 팀원에게 알려줌.
- 테스틑 해볼 때도 xcode를 켠 팀원이 시뮬을 돌려서 확인함.
- 프로젝트와 관련된 학습할 내용들은 링크를 통해 공유(하단 참고링크)

<br>
<br>

## 계산기 구현내용
### auto layout 적용
![image](https://user-images.githubusercontent.com/35272802/113388521-5513c280-93c9-11eb-82fd-4a308039e713.png)

### 계산기
- 2개의 숫자 연산   
![image](https://user-images.githubusercontent.com/35272802/113390333-77f3a600-93cc-11eb-9b90-da8da3e8ca73.png)


- 10진수/2진수 토글 기능
- 사칙연산(+, -, /, *) 우선순위에 따른 연산이 가능
    ```
    // 상황별 예시 
    5 x 6 + 2 = 32
    5 + 6 x 2 = 17
    ```
- 사칙연산(+, -, /, *)을 눌렀을 때 연산된 값에 대해 화면 출력
    ```
    // 상황별 예시 
    5 x 6 x → 30
    5 + 6 + → 11
    ```
- NumberFormatter() 적용하며 3자리 숫자마다 콤마 적용
    - 그림
- 점을 여러번 눌러도 한번만 적용
    - 그림
- 입력 자릿수가 많아지면 화면크기에 맞게 글자크기 조절
    - 그림

<br>
<br>


## 질문 및 피드백
### 3/24(목) 리뷰어에게 보낸 질문 및 답변
- [질문 및 답변 링크](https://github.com/stevenkim18/ios-calculator-app/blob/main/docs/question.md)
### 3/30(수) PR 후 피드백 받은 내용
- [PR 내용](https://github.com/yagom-academy/ios-calculator-app/pull/23#issue-605236108)

<br>

## 아쉬운 부분
- 계산기 타입에 익스텐션과 프로토콜을 사용하여 구현하지 못한 점.
- 2진수 9자리 자릿수 제한(현재 8자리)을 시도해 보지 않은 점.
- Unit Test를 사용해 보지 않음.
- 공부할 양이 많은데, 제대로 이해하기보다는 코드를 위한 이해만 하고 넘어간 점. 
- 처음에 감이 잘 오지 않아서 테스트 코드를 작성하고 시작하기로 했었는데 테스트 코드 작성 시간이 길어진 점.
- 설계에 많은 시간과 고민을 들여서 하지 않은 점.
- 설계를 하지 않았기 때문에 클래스 다이어그램을 그리지 않았던 점.
- Live share가 자주 끊김.
- [ ] 연산자와 피연산자의 스택의 개수가 같고 `=`을 눌렀을 떄 처리 `2+3x = 11`

<br>
<br>

## 학습 키워드
### CS
- 자료구조 Stack
- 10진수, 2진수
- 논리게이트
- 계산기 종류(연산방식차이) 
    - 아이폰 계산기 vs 구글웹계산기
- UML
- SOLID
### Swift
- 비트연산
- Generic([공부정리링크](https://github.com/stevenkim18/ios-calculator-app/blob/main/docs/Generic.md))
- Extension
- Protocol (공부📚)
- TDD, unit test (공부📚)

<br>
<br>

## 참고 링크
**git**
- [Oh My ZSH+ iTerm2로 터미널을 더 강력하게](https://medium.com/harrythegreat/oh-my-zsh-iterm2%EB%A1%9C-%ED%84%B0%EB%AF%B8%EB%84%90%EC%9D%84-%EB%8D%94-%EA%B0%95%EB%A0%A5%ED%95%98%EA%B2%8C-a105f2c01bec)
- [좋은 커밋 메시지를 작성하기 위한 커밋 템플릿 만들어보기](https://junwoo45.github.io/2020-02-06-commit_template/)

**자료구조**

- [Swift로 작성해보는 기본 자료구조 - Stack, Queue](https://wlaxhrl.tistory.com/87)
- [[스위프트 : 자료구조] 스택 : Stack : Sequence 프로토콜 지향 스택 구현하기](https://the-brain-of-sic2.tistory.com/38)
- [영상 [알고리즘기초(algorithm)] 03. 자료구조(스택)|중위표현식을 후위표현식으로 변환하기](https://www.youtube.com/watch?v=Svhp73MIOqY)
- [3. Deque (덱)](https://velog.io/@fenta0917/03.Deque)

**2진수/10진수**

- [[Swift] 고급 연산자 Part 1 - 비트연산자들1 Bitwise Operators1](https://m.blog.naver.com/PostView.nhn?blogId=badwin&logNo=221178028123&proxyReferer=https:%2F%2Fwww.google.com%2F)
- [[Swift] 고급 연산자 Part 2 - 비트연산자들2 Bitwise Operators2 시프트연산 Shift Operators, 연산자 우선순위](https://m.blog.naver.com/badwin/221180694420)
- [컴퓨터가 10진수 숫자(정수)를 표현 하는 방법](https://m.blog.naver.com/badwin/221179926161)
- [Swift 숫자를 문자로 변환 (2진수, 8진수, 16진수)](http://blog.naver.com/PostView.nhn?blogId=yoonsea&logNo=221004904163&redirect=Dlog&widgetTypeCall=true&directAccess=false)

SOLID

- [Swift 개발에 SOLID 적용하기](https://velog.io/@delmasong/Swift-%EA%B0%9C%EB%B0%9C%EC%97%90-SOLID-%EC%A0%81%EC%9A%A9%ED%95%98%EA%B8%B0) - delma

Swift
- [swift - NumberFormatter 알아보기. #콤마 표시 #소수점 다루기](https://jinsangjin.tistory.com/104)
- [maximumSignificantDigits(Swift)](https://developer.apple.com/documentation/foundation/numberformatter/1412008-maximumsignificantdigits)
- [iOS에서 세 자리수 마다 콤마(,) 넣기](https://kka7.tistory.com/44)
- [Swift 5에서 추가된 Character 속성](https://jercy.tistory.com/10)