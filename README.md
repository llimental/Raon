# What's in Seoul README

[1. 프로젝트 소개](#프로젝트-소개)

[2. 구현 화면](#구현-화면)

[3. 프로젝트 구조](#프로젝트-구조)

[4. 프로젝트 디자인](#프로젝트-디자인)

[5. STEP별 구현 내용](#STEP별-구현-내용)

[6. 트러블 슈팅](#트러블-슈팅)

[7. 추후 계획](#추후-계획)

<br>

## 프로젝트 소개
- 🏃🏻🏃🏻‍♂️💨 **프로젝트 구상:** `24. 01. 08.` ~ `24. 01. 15.`
- 🏃🏻🏃🏻‍♂️💨 **프로젝트 기간:** `24. 01. 16.` ~  **(진행중)**
    - **[Step 1]** `24. 01. 19.` ~ `24. 01. 26.`
    - **[Step 2]** `24. 01. 27.` ~ `24. 02. 02.`
    - **[Step 3]** `24. 02. 03.` ~ `24. 02. 16.`
    - **[Step 4]** `24. 02. 22.` ~ `24. 03. 04.`
    - **[Step 5]** `24. 03. 05.` ~ `24. 03. 05.`
    - **[Step 6]** `24. 03. 06.` ~ `24. 03. 06.`
    - **[Step 7]** `24. 03. 06.` ~ `24. 03. 07.`

<br>

- **프로젝트 구성원(iOS Developer 1인)**

|<img src="https://avatars.githubusercontent.com/u/45708630?v=4" width=200>|
|:---:|
|[Lust3r](https://github.com/llimental)|

- **서비스 :** 서울시 문화 프로그램에 대한 정보 제공
    - 어떤 프로그램이 있는가?
    - 프로그램 정보는 무엇인가?
    - 프로그램 예약은 어떻게 하는가?
    - 날짜별 어떤 프로그램이 있는가?
    - 프로그램 미리 알림 푸시
- **기술 스택 :** **Swift**
    - `SwiftUI`
    - `Model-View Architecture`
    - `Observer Design Pattern(Swift Combine)`
    - `Combine`
        - `Concurrency`
        - `AnyCancellable`
        - `dataTaskPublisher`
        - `sink`
    - `PropertyWrapper`
        - `@AppStorage`
        - `@State`
        - `@Binding`
        - `@StateObject`
        - `@ObservableObject`
        - `@Published`
        - `@Environment`
    - `GCD`
        - `DispatchQueue`
    - `ShareLink`
    - `TabView`
    - `WKWebView(UIViewRepresentable)`
    - `AsyncImage`
    - `NSCache`
        - `NSCache<NSString, UIImage>`
    - `GeometryReader`
    - `Picker`
    - `Navigation`
        - `NavigationStack`
        - `NavigationLink`
        - `ToolBarItem`
    - `NWPathMonitor`
    - `ScrollViewReader`
    - `custom sheet`
    - `searchable`
    - `onTapGesture`
    - `onChange`
    - `External App API Use`
        - `Naver Map`
        - `Kakao Map`
    - `Debug`
        - `Instruments`
        - `Allocation, Leak, VM Tracker`
        - `Xcode Memory Graph`
- **프로젝트 후기 :**
    - .

<br>

## 구현 화면


<br>

## 프로젝트 구조


<br>

## 프로젝트 디자인


<br>

## STEP별 구현 내용

### Step 1: Onboarding View 구현
- **Onboarding View 구현**
    - `상태를 가진 color 변수`를 만들어 App 전체에서 사용
    - `상태를 가진 initial 변수`를 만들어 App 첫 실행 때만 `Onboarding Page`를 보여주기
    - `상태를 가진 region 변수`를 만들어 선택한 지역 저장 및 활용
    - `Picker`를 활용하여 지역을 선택할 수 있도록 구현
    - `TabView`를 통해 `Onboarding` 각 페이지를 이동

### Step 2: Program View 구현
- **Program View 구현**
    - 가운데 보이는 컨텐츠 강조(-> `TabView`로 변경되어 자동 강조)
    - 양쪽 컨텐츠 투명도 조절(-> `TabView`로 변경되어 조절 필요 없음)
    - `NavigationBar` 구성
    - `TabView` 사용
- **API Model 구성**
    - 네트워크 분리
    - 오프라인 환경 감지 및 안내
    - 목업, 실 데이터 테스트

### Step 3: Search View 구현
- **Search View 구현**
    - `ProgramView`에서 `Search Icon`을 터치하면 `SearchView`로 이동(`NavigationLink` 활용)
    - 프로그램 제목은 검색하여 필터링
    - 필터링이 되면 첫 결과로 위치 이동

- **Filter View 구현**
    - 카테고리, 지역은 `FilterView`를 사용하여 적용
    - 아래쪽에 sheet로 작게 띄워 현재 context 유지
    - 필터 초기화, 닫기 버튼 기능 제공
    - `@State`, `@Binding`을 통한 필터 선택값 반영

### Step 4: Program Detail View 구현
- **Program Detail View 구현**
    - 포스터를 배경으로 자세한 정보를 스크롤하며 볼 수 있도록 구현
    - 프로그램명 우측에 즐겨찾기와 알림 버튼 추가
    - 관련 링크로 이동하는 버튼 추가
    - 프로그램 진행 장소를 지도로 제공

- **부가 기능 구현**
    - 즐겨찾기 버튼 체크 여부에 따른 fill 상태 변경
    - 알림 받기 버튼 체크 여부에 따른 fill 상태 변경
    - 공유시트 기능 구현

### Step 5: Project Maintenance
- **DTO**
    - 사용하지 않는 항목 제거

- **ContentView**
    - fullScreenCover 대신 isFirstLaunching 기준으로 분기 처리
    - @AppStorage 등의 프로퍼티 위치 고려

- **ProgramView**
    - 설정, 검색 위치 고려
    - networkManager 위치 고려

- **ProgramCardView**
    - shadow, opacity 값 조정
    - 사용하지 않는 프로퍼티 제거

- **SearchView**
    - List 보일러 플레이트 코드 제거하여 로직 간결화

- **SearchCardView**
    - 이미지와 텍스트 위치 조정
    - content를 전달해서 내부에서 동작하는 것 고려
        - 내부 동작에 대한 캡슐화 목적 + 메모리 Allocations상 10MiB 차이 나는 것 확인

- **ProgramDetailView**
    - 홈페이지 이동 시 ToolBar 제공
        - .toolbar 관련 코드가 중복되어 WebView 내에 CustomWebView를 구현
        - 보일러 플레이트 코드 제거 및 사용하는 View 코드 간결화
        - 필요한 WebView는 외부에서 주입

### Step 6: Image Caching
- **이미지 캐싱**
    - CacheManager 구현
    - CacheManager를 활용하여 이미지 표현

### Step 7: WebView Memory Optimization
- **WebView**
    - WebView 사용 시 메모리가 급증하여 줄지 않는 이슈를 해결하여 메모리 최적화

<br>

## 트러블 슈팅

### 1. 앱 데이터 구성에 대한 고민
**고민한 점 :**
- Onboarding Page를 만드는 데 있어서, View는 각 컴포넌트를 만들고 레이아웃을 잡으면 되지만, 그 과정에서 사용할 데이터, 저장할 데이터는 어떻게 관리하고 어떻게 분리하면 좋을지 고민함

**과정 및 해결 :**
- `WWDC20 Data Essentials in SwiftUI` 영상이 많이 참고가 되었다.
해당 영상에서, 데이터를 사용할 때 고려해야 할 3가지 질문을 알려줬는데, 다음과 같다.

    **1) View가 작업을 수행하려면 어떤 데이터가 필요한가?
    2) View가 해당 데이터를 어떻게 조작하는가?
    3) 데이터는 어디에서 오는가?(Source of Truth)**

- 이외에도 `property wrapper`의 사용 환경에 대한 설명 덕에 고민을 해결할 수 있었다.
가령 Step 1의 상태를 가진 데이터는 다음과 같이 보았다.

    1) **Color**
    - 앱의 메인 색상이 무엇인지 정보를 담고 있는 데이터가 필요
    - 설정에서 메인 색상을 변경할 수 있게 접근할 수 있어야 함. 나머지 View는 단순 데이터 읽기
    - App 내에서 글로벌하게 사용되고, 자주 바뀌지 않는 작은 설정 값이기에 `AppStorage`를 사용하여 저장하고 `binding`을 통해 활용
    <br>
    
    2) **Initial**
    - App을 설치한 이후 처음 실행한 것인지 정보를 담고 있는 데이터가 필요
    - ContentView에서는 OnboardingTabView를 보여주는 여부에 사용하기 위해 단순히 값을 읽는 것만 수행, OnboardingPage의 마지막인 ThirdView에서는 해당 값을 변경하기 위한 접근이 필요
    - 이 데이터는 App 최초 실행 이후에는 변경될 일이 없어 `State`나 `Observable`로 추적할 필요가 없고, 작은 Bool 데이터이기 때문에 `AppStorage`를 사용하고, `binding`을 통해 활용
    <br>
    
    3) **Region**
    - 사용자가 선택한 지역에 대한 정보를 담고 있는 데이터가 필요
    - OnboardingSecondView와 설정에서 값을 바꾸기 위한 접근이 필요, 메인 로직에서는 해당 값을 단순히 참고하여 작업 수행
    - 처음에는 추적을 위해 `ObservableObject`를 고려했으나, 이 역시 크기가 작은 설정 값이기 때문에 `AppStorage`를 사용하고 상위 뷰에서 하위 뷰로 `binding`을 통해 활용

### 2. AppStorage에 저장할 타입
**고민한 점 :**
- Initial은 Bool로 값을 저장하면 되는데, Color, Region은 Enum타입으로 만들었기에 String으로 저장하고 그걸 불러와서 매치하는 방법이 맞나 고민함

**과정 및 해결 :**
- Enum은 `rawPresentable`을 준수하고, `@AppStorage`는 그 타입을 지원하기 때문에 가능하다.
Color는 각 case가 asset의 이름을 rawValue로 갖고 있고, Region도 각 케이스명을 그대로 rawValue로 갖고 있기 때문이다.

### 3. ATS policy 문제
**고민한 점 :**
- API 요청이 http로 제한되어 있는데 보안의 문제로 https를 써야 하는 상황(since it does not conform to ATS policy 오류 발생)

**과정 및 해결 :**
- `Info.plist` 파일 조정을 통해 해결이 가능
    - `App Transport Security Settings Key` 사용
    - `Exception Domains`에 사용할 도메인 기입
    - 만약 http인 전체 도메인을 허용하는 경우에는
`NSExceptionDomains` 대신 `NSAllowsArbitraryLoads` 사용

### 4. CodingKeys 오류
**고민한 점 :**
- DTO를 API 데이터 타입에 맞게 구성했는데 디코딩 오류 발생

**과정 및 해결 :**
- `CodingKeys` 매칭의 문제였음. 일부 CodingKeys가 Codingkeys로 오기입 되어있었다.

### 5. dataTaskPublisher의 중복 실행 방지
**고민한 점 :**
- URLSession의 `dataTaskPublisher`를 사용하여 API 호출을 하는데, 처음 한 번만 부르면 상관이 없으나 새로고침 혹은 오류로 인해 중복으로 호출이 되면 리소스 낭비가 있을 것으로 판단되어 방법을 고민

**과정 및 해결 :**
- 해당 Publisher는 `AnyCancellable` 타입이기에 해당 비동기 작업을 수행할 때 NetworkManager의 programCancellable 변수에 저장
- API 요청 메서드가 호출되면 programCancellable을 `cancel()`하고 새로 `dataTaskPublisher`를 만들어 비동기 작업 수행
- 중복 호출이 아니라면 작업 완료 후 할당 해제

### 6. AsyncImage 오프라인 대응
**고민한 점 :**
- `AsyncImage`에서 이미지를 불러오는 동안 네트워크가 끊기게 되면 placeholder로 지정한 ProgressView만 보이게 됨
- 네트워크가 다시 연결되면 보이도록 하고 싶은데 다른 TabView로 페이징하면 해당 객체는 다시 그려지기 때문에 이미지가 보이나 이미 로딩오류가 난 `AsyncImage`는 이미지가 보이지 않음

**과정 및 해결 :**
- API 요청 메서드를 호출했으나 URL이 동일하기 때문에 새로 그려지지 않음을 확인
- NetworkManager에서 해당 메서드를 호출할 때 기존 contents를 비우는 작업을 추가하여 변화를 줌으로써 해결할 수 있었음

### 7. TabView 처음으로 이동하기
**고민한 점 :**
- `ProgramView`에서 새로고침 버튼을 통해 아이템을 새로 받아왔을 때, `TabView Page`의 맨 처음으로 돌아가게 하고 싶으나 다양한 방법을 시도해도 적용되지 않음

**과정 및 해결 :**
- `@State`프로퍼티를 사용하여 해결하였다. `TabView`의 `selection` 파라미터는 `@State`프로퍼티와 각 `TabViewItem`의 `tag` 조합으로만 써야하는 줄 알았는데, 이는 각 페이지간 버튼을 통해 움직이거나 할 때 사용할 수 있고, 이 문제의 경우에는 단순히 첫 페이지로만 이동하면 되는 것이다.
- `@State` 프로퍼티로 임의의 문자열 혹은 정수를 생성하고, `selection` 파라미터에 해당 프로퍼티를 전달한 후, 새로고침을 할 때 `@State` 프로퍼티의 값을 처음에 지정한 값으로 변경해주는 코드를 수행하도록 했다.
- `TabView`에서 `selection`을 사용하면 첫 아이템을 `selection`에 들어온 `@State`의 값으로 삼기 때문에 이 방법을 통해 돌아갈 수 있었다.

### 8. SearchView에서 키보드 내리기
**고민한 점 :**
- `searchable`로 검색기능을 구현했는데, 일반적으로 앱을 사용할 때처럼 화면을 터치했을 때 키보드를 내리고자 했음

**과정 및 해결 :**
- `View+Extension`에 `hideKeyboard()` 메서드를 구현하여 해결
- `UIApplication` 인스턴스는 `싱글톤` 객체인데, `사용자 이벤트의 라우팅 처리`, `제어 객체가 전달한 동작 메시지를 적절하게 전송`하는 등의 역할을 하는데, 이를 활용할 수 있었다.
- `UIApplication.shared`로 싱글톤 객체에 접근하고, `sendAction` 메서드를 사용하여 `UIResponder`의 `resignFirstResponder`를 수행하도록 했다.

### 9. List에서 맨 위로 이동하기
**고민한 점 :**
- `SearchView`에서 스크롤을 내린 상태로 필터를 적용하면 그 위치에서 항목이 변경되기 때문에 맨 위로 다시 올려야 하는 불편함이 있어 이를 해결하고자 했다.

**과정 및 해결 :**
- `TabView`때처럼 첫 항목을 지정할 수 없기에 `ScrollViewReader`로 `View`를 `embed`하고, `proxy`를 사용하여 `scrollTo` 메서드를 사용하였다.
- 다만 변경되는 항목 속에서 어떻게 맨 위의 값을 얻느냐가 관건이었는데, 필터 결과에 상관없이 고정적으로 상단에 존재하는 `EmptyView`를 만들고 해당 `View`에 `id`를 부여하는 방식으로 해결할 수 있었다.

### 10. WebView 사용하기
**고민한 점 :**
- `UIKit`에서는 `WebView` 혹은 `SFSafariViewController`를 그냥 사용하면 되었지만 `SwiftUI`에서 웹뷰 기능을 네이티브로 제공하지 않아 `UIKit`의 방식을 써야 했다.

**과정 및 해결 :**
- `UIKit`의 기능을 사용할 수 있게 해주는 `UIViewRepresentable` 프로토콜을 사용하여 해결할 수 있었다.
- `makeUIView`, `updateUIView` 두 개의 필수 메서드를 구현해야 하는데, 전자는 View를 만들고 초기 설정을 진행하는 메서드이고 후자는 새로운 정보로 View를 업데이트 해주는 메서드이다.
- `makeUIView`에서 어떤 View 타입을 반환할 것인지 명시해주고, `updateUIView`에서의 파라미터 타입도 이에 맞춰서 변경해줘야 한다.
- `makeUIView`에서 빈 `WKWebView`를 반환하고, `updateUIView`에서 주어진 url을 Request로 만들어 `WKWebView`에서 불러오도록 했다.

```swift
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    // MARK: - Public Properties
    let urlToConnect: String

    // MARK: - Private Properties
    private var webView: WKWebView

    // MARK: - Initializer
    init(urlToConnect: String) {
        self.urlToConnect = urlToConnect
        self.webView = WKWebView()
    }

    // MARK: - UIViewRepresentable
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: urlToConnect) else { return }

        let urlRequest = URLRequest(url: url)

        webView.load(urlRequest)
    }

    // MARK: - Public Functions
    func goBack() {
        webView.goBack()
    }

    func goForward() {
        webView.goForward()
    }

    func reload() {
        webView.reload()
    }
}
```

### 11. TabBar 배경색 변경하기
**고민한 점 :**
- 상세 페이지에 들어갔을 때 `TabBar`의 색상이 페이지 배경 색상과 일치했으면 좋겠으나 색상 변경 코드가 적용되지 않았다.

**과정 및 해결 :**
- `init()`에서 `UITabBar.appearance().backgroundColor` 속성을 통해 변경할 수 있었다.

```swift
init() {
    UITabBar.appearance().backgroundColor = UIColor.systemBackground
}
```

### 12. 위치 정보를 지도로 보여주기
**고민한 점 :**
- 프로그램이 진행되는 장소를 지도를 통해 보여주고 싶으나 `MapKit`을 사용하면 앱의 UI가 깨지는 현상이 발생했다(내비게이션 바, 탭바 색상 변경 및 내비게이션 타이틀 색 초기화).

**과정 및 해결 :**
- `ProgramDetailView`에서 `DescriptionView`에 `Map`을 담아보는 방법, MapView를 따로 구현하고 인스턴스로 불러와 사용하는 방법, 내비게이션 바와 탭바 색상을 강제하는 방법 등 다방면으로 시도하였으나 원하는대로 이뤄지지 않았다.
- 애플 기본 지도 앱으로 연결시키고자 했으나 기본 지도 앱에서 요구하는 정보와 데이터에서 제공하는 정보가 맞지 않아 위치 정보를 표시할 수 없는 데이터가 있었다.
- 사람들이 보통 많이 사용하는 외부 지도 앱(네이버, 카카오)을 사용하여 위치 정보를 제공하고자 했다.
- 그러나 앱 내에서 조작을 하기보다 실제 앱에서 경로를 보여주는 것이 더 효율적이라 판단하여 각 앱의 API를 사용하여 프로그램이 진행되는 장소의 위, 경도를 전달하고 현재 위치에서 가는 경로를 대중교통으로 보여주었다.
- 앱이 설치되어 있으면 실행하여 경로를 보여주고, 없다면 앱스토어에 연결했지만 외부 앱을 사용하고 싶지 않은 이용자도 있을 것이기에 `WebView`를 통해 포털사이트 쿼리에 해당 장소명을 집어넣어 앱 내에서도 장소 정보를 확인할 수 있게 했다.

```swift
struct MapButton: View {
    // MARK: - Public Properties
    var mapType: MapType
    var latitude: String
    var longitude: String

    // MARK: - Body
    var body: some View {
        switch mapType {
            case .naver:
                Button(action: {
                    LinkToNaverMap(
                        latitude: Double(latitude) ?? 0,
                        longitude: Double(longitude) ?? 0)
                }, label: {
                    Image("Naver_map_Icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                })

            case .kakao:
                Button(action: {
                    LinkToKakaoMap(
                        latitude: Double(latitude) ?? 0,
                        longitude: Double(longitude) ?? 0)
                }, label: {
                    Image("Kakao_map_Icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                })
        }
    }
}
```

### 13. 이미지 캐싱
**고민한 점 :**
- 매번 `AsyncImage`로 불러오면 데이터 낭비가 일어나고, `List` 또는 `TabView`에서 `lazy loading`을 하면서 종종 오류가 발생했다. `Caching`을 통해 저장된 이미지가 없다면 불러오고, 있다면 그것을 사용하는 방법을 찾고자 했다.

**과정 및 해결 :**
- 기존에 사용한 `AsyncImage`를 최대한 활용해보려 했으나 `Image` 타입을 `UIImage`로는 변환할 수 없어(반대는 가능하지만) 새롭게 이미지를 표현할 필요가 있었다.
- 우선 `CacheManager`를 `싱글톤 패턴`으로 구현하고, 그 안에 있는 `private cache`를 활용하기로 했다.
- `CacheManager`의 `fetchImage(urlString: completion:)`메서드에 `content`의 `imageURL`을 보내 호출하면, `cache`에 해당 `string`을 `NSString`으로 변환한 값에 이미지가 있는지 확인을 하고, 있다면 이미지를 `completion`으로 반환, 없다면 `URLSession`을 통해 받은 후 캐시에 저장하고 반환하는 방식을 사용
- 이러한 일련의 비동기 방식을 사용하기 위해 `@escaping closure`를 활용
- 이후 커스텀한 View인 `CachedAsyncImageView`에서 `CacheManager`의 `fetchImage`를 활용, 이미지를 보여주는 방식으로 해결하였다.

```swift
final class CacheManager {
    // MARK: - Singleton Pattern
    static let shared = CacheManager()

    // MARK: - Initializer
    private init() { }

    // MARK: - Private Properties
    private var cache = NSCache<NSString, UIImage>()

    // MARK: - Public Functions
    func fetchImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            completion(cachedImage)
        } else {
            guard let url = URL(string: urlString) else {
                completion(nil)

                return
            }

            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data, let image = UIImage(data: data) else {
                    completion(nil)

                    return
                }

                self.cache.setObject(image, forKey: urlString as NSString)

                completion(image)
            }.resume()
        }
    }
}
```

|<img src="https://github.com/llimental/What-is-In-Seoul/assets/45708630/fdfab9e0-c81d-448b-8434-1c434bc7cdf4">|<img src="https://github.com/llimental/What-is-In-Seoul/assets/45708630/b917d4c4-f56f-4d10-b2fa-c4ac774cd33f">|
|:---:|:---:|
|캐싱 전 메모리|캐싱 전 네트워크|

|<img src="https://github.com/llimental/What-is-In-Seoul/assets/45708630/fffc878b-c1a4-4724-866e-55214dd1d8d5">|<img src="https://github.com/llimental/What-is-In-Seoul/assets/45708630/73164564-d7bb-4ba7-ae9d-48f1db915a81">|
|:---:|:---:|
|캐싱 후 메모리|캐싱 후 네트워크|

- 그래프와 같이 캐싱 전에는 매 페이징(스크롤) 때마다 새롭게 이미지를 불러오기 때문에 메모리 사용량이 들쭉날쭉하지만, 캐싱 후에는 메모리 자체 사용량은 높으나 페이징(스크롤)시에 이미 불러온 이미지를 사용하기 때문에 이후 메모리 사용량은 새롭게 불러오지 않는 이상 고정됨을 볼 수 있다.

### 14. WebView 메모리 최적화
**고민한 점 :**
- `WKWebView`를 `UIViewRepresentable`을 사용하여 `SwiftUI View`로 사용했는데, `Instruments`의 `Leak`을 체크하며 메모리가 비정상적으로 높아지는 현상을 발견하였고, 이를 해결하고자 했다.
- `Instruments` 측정 데이터상 `Leak`은 발생하지 않지만 `Allocation`에서 `WebView`를 실행하는 순간 메모리가 4~50MiB에서 550MiB로 급증, 약 500MiB의 메모리 할당은 단일 `VM Allocation`임을 확인했다.
- `VM Allocation` 정보에 따르면 `WKWebView`에서 발생한 할당이며, `Responsible Library`는 `JavaScriptCore`였다.

**과정 및 해결 :**
1) `WKWebView`의 사용상 문제인가?
- `UIViewRepresentable` 구현상 문제는 없었고, 보통 `WKWebView`를 사용하면서 흔히 발생하는 메모리 이슈는 커스텀 코디네이터를 만들면서 `self`를 넘겨주는 과정에서 발생하는 강한 참조였기에 이 케이스에 반영할 수 없었다.

2) 직접 할당 해제를 해줘야 하는가?
- `UIViewRepresentable`로 구현한 `WebView`는 값타입 `struct`이기 때문에 클래스나 클래스 바운드 프로토콜에 해당하지 않아 `deinit`을 사용할 수 없고, 바운드를 벗어나면 메모리가 할당될 것이라 생각했다.

3) 어떤 점이 문제인가?
- 위의 2가지 관점으로 다양한 정보를 찾고, 시도를 해본 끝에 원점으로 돌아와 이게 어떤 문제인지 다시금 생각을 했다.
- `Instruments`에서는 메모리가 급증한 후 유지되는 양상을 보이는 반면, `Xcode Memory Report`상 `Memory Usage`는 정상적인 메모리 사용률을 보였다.
- 만약 메모리상 계속 `WebKit`을 사용함에 있어 증가 추세를 보였거나, `Leak`이 발생했거나, `Xcode Memory Report`에서도 급증하는 현상을 보였다면 사용상의 문제로 메모리 최적화가 반드시 필요하지만, 전반적으로 정상인데 반해 `Instruments`에서만 메모리가 증가하는 점에서 다른 방향으로 접근해야 함을 알았다.

4) `VM Tracker`
- 왜 `Instruments`에서만 일어날까? 일단 메모리 할당이 `VM Allocation`이기 때문에 `VM Tracker`로 측정을 했다.
- `VM Tracker`로 측정했을 때, `Dirty Size/Swapped Size/Resident Size` 세 파트로 정보를 얻을 수 있다.
- `Resident Size 409 MiB / Dirty Size 67 MiB / Swapped 59 MiB`
- 그러나 `Type`에서 절반을 차지하는 `__Text`, `*Dirty*`를 보면 각각은 220/0/0, 83/67/43의 메모리 분포를 볼 수 있다.

5) 결론
- `VM Tracker`상에서도 앱에서 사용한 `Dirty Memory`의 크기가 작고, `__Text`의 `Resident Size`도 `WebCore`만 있는 것이 아니라 `SwiftUI`, `UIKitCore`, `JavaScriptCore`가 각각 조금씩 갖고 있는 것으로 보아 `WebView`만의 문제라고 보기가 어려웠다.
- `Instruments`에서 시뮬레이터 웹 환경을 측정하기 위해 필요한 자원이거나, `__Text` 타입에서 봤듯이 `UIKit`의 `WebView`를 `SwiftUI`의 View로 전환하는 과정에서 자원이 필요했을 수도 있다고 보았다.
- `Instruments`에서의 메모리 증가를 줄이거나 원인을 찾지는 못했지만, 그 과정에서 `Xcode의 메모리 관리 기법`을 다양하게 사용해봤다는 점, `WebView`를 더 효율적으로 사용할 수 있는 방향을 다방면으로 시도해볼 수 있었기에 얻어간 것이 많다고 생각한다.

|<img src="https://github.com/llimental/What-is-In-Seoul/assets/45708630/a8ef03b7-b448-455a-bb00-f92f7e0ffbde">|
|:---:|
|Instruments|

|<img src="https://github.com/llimental/What-is-In-Seoul/assets/45708630/bf8f8415-0353-4cc8-ad6e-e362a06d49b5">|<img src="https://github.com/llimental/What-is-In-Seoul/assets/45708630/4dcece06-10ba-44dc-8834-1201edbd65bc">|
|:---:|:---:|
|툴바 없을 때 메모리|툴바 있을 때 메모리|

<br>

## 추후 계획

- 
