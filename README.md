# MovieReview

네이버 검색 API를 사용하여 영화를 검색하고 즐겨찾기 기능을 적용한 샘플입니다.  

<p>
<img src="screenshot_01.png" width="200">
<img src="screenshot_02.png" width="200">
</p>

- UI작업은 [Snapkit](https://github.com/SnapKit/SnapKit) 을 사용하였습니다.
- MVP패턴을 사용하여 코드를 작성하였습니다. 
- BDD를 따르는 UI Test, Unit Test 코드를 작성하였습니다. 


### BDD 
Behavior Driven Deveelop 
시나리오를 기반으로 테스트 케이스를 작성하는 테스트 작성 방법

#### 테스트 작성 구조 (진행 흐름)

|Given|A의 상태에서|네트워크 통신이 실패하는 상태에서|
|:---:|:---:|:---:|
|When|B가 실행될 때|유저가 새로고침 버튼을 탭 했을때|
|Then|C가 발생되어야 한다.|유저에게 에러메세지를 보여줘야 한다.|


