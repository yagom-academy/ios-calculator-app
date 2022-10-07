# 계산기 Ⅱ

## 🗒︎목차

1.[소개](#소개)
2.[개발환경 및 라이브러리](#개발환경-및-라이브러리) 
3.[팀원](#팀원)
4.[타임라인](#타임라인)
5.[트러블 슈팅 및 고민](#트러블-슈팅-및-고민)
6.[참고링크](#참고-링크)

## 소개
UML을 바탕으로 작성된 Aaron과 mene의 코드를 통합하여 하나의 계산기로 리팩토링
입력 순서대로 계산하는 계산기 앱 구현

## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()

## 팀원
[Aaron](https://github.com/Hashswim)
[Mene](https://github.com/JaeKimdev)

## 타임라인

<details>
<summary>Commit History</summary>
<div markdown="1">
   
<b>10/3</b>
<img width="1178" alt="image" src="https://i.imgur.com/0GHHEuO.png">

<b>10/4</b>
<img width="1178" alt="image" src="https://i.imgur.com/VZPnIBH.png">
    
<b>10/4</b>
<img width="1178" alt="image" src="https://i.imgur.com/4Ii04Ty.png">
    
<b>10/6</b>
<img width="1178" alt="image" src="https://i.imgur.com/hJUEepT.png">
    
</div>
</details>

## 트러블 슈팅 및 고민

- Unit Test 작성에 대한 고민
    ```swift
    class ExpressionParserTests: XCTestCase {
        var sut: ExpressionParser.Type?
        ...

        override func setUpWithError() throws {
            ...
            sut = ExpressionParser.self
        }

        override func tearDownWithError() throws {
            ...
            sut = nil
        }
    ```
    열거형 타입의 `ExpressionParser`의 테스트 코드를 작성할 때 `sut` 변수의 타입을 고민 했습니다. 이 부분을 타입 메서드를 사용하기 위해서 열거형의 타입 자체를 프로퍼티로 설정하고 할당했다가 해제하는 방식으로 구현했습니다.

- Formula 구현방식
    - Formula 구현방식이 메네와 애런이 달라서 어떻게 수정해야 할 지 고민해 보았습니다.
    - 애런이 구현한 방식에서는 operator queue에 담긴 첫번째 연산자가 처음 숫자의 음수/양수 판정을 해주고 있어서 기본적으로 +을 `totalFormulaString`에 넣어주고 시작하도록 변경하였고 `+-`로 시작하는 경우에 `−`로 변경하여 `substract`로 변경해 주도록 로직을 수정하였습니다.

## 참고 링크 

[Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)  
[Swift Language Guide - Extentions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)  
[Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)   
[Set Up and Tear Down State in Your Tests](https://developer.apple.com/documentation/xctest/xctestcase/set_up_and_tear_down_state_in_your_tests)  
[WWDC2017 - Engineering for Testability](https://devstreaming-cdn.apple.com/videos/wwdc/2017/414qr3121b1oieq/414/414_engineering_for_testability.pdf)  
[소프트웨어 테스팅과 스위프트에서의 Unit Testing](https://seizze.github.io/2020/01/08/%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4-%ED%85%8C%EC%8A%A4%ED%8C%85%EA%B3%BC-%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8%EC%97%90%EC%84%9C%EC%9D%98-Unit-Testing.html)  
[Documentation Archive - iOS Drawing Concepts](https://developer.apple.com/library/archive/documentation/2DDrawing/Conceptual/DrawingPrintingiOS/GraphicsDrawingOverview/GraphicsDrawingOverview.html)    
[Apple Developer Doc - UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)  
[Apple Developer Doc - NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)  
[오토레이아웃 정복하기 - 야곰닷넷](https://yagom.net/courses/autolayout/)  
