# Tuist_Study

# Tuist

---

https://www.youtube.com/watch?v=7rvwGLhor-I

에 대한 요약 및 정리

### Tuist란?

Xcode 프로젝트의 생성, 유지보수 및 상호작용을 용이하게 하는 것을 목표로하는 CLI 툴.

## Tuist를 사용한 프로젝트의 예제

![[사진1] 프로젝트의 기본 폴더 구성(예제 프로젝트 - 1개의 프로젝트와 2개의 모듈)](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/f476128c-9397-4168-b1c0-8df951e9f5d8/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_9.59.39.png)

[사진1] 프로젝트의 기본 폴더 구성(예제 프로젝트 - 1개의 프로젝트와 2개의 모듈)

![스크린샷 2024-12-05 오후 9.59.56.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/c4ba3432-9e03-40c9-b659-b087f6d330f4/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_9.59.56.png)

### 프로젝트 (App Manifests)

![Project.swift](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/de7de72d-747d-4672-8b83-94800f6867f2/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.05.16.png)

Project.swift

### 모듈 (DesignSystem Manifests, Network Manifests)

![스크린샷 2024-12-05 오후 10.09.11.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/8bb12cea-1461-42c1-aff6-3820d037f0b0/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.09.11.png)

product에 .staticFramework / .dynamicFramework 등을 설정하는 부분이 기존 프로젝트 생성법과 Tuist를 통한 생성법의 **중요한** 차이점

### Dependencies

![스크린샷 2024-12-05 오후 10.12.29.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/23afb7bf-e26b-44e5-8573-babb769fc6a3/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.12.29.png)

기존의 Xcode로 생성할 경우 패키지를 cocoapods이나 spm로 가져와 사용함

Tuist - Carthage(카르타고), spm을 사용해서 패키지를 가져옴

```jsx
import ProjectDescription

let dependencies = Dependenciesf(
	carthage: [
		.github(path: "Alamofire/Alamofire", requirement: .exact("5.0.4")),
	],
	swiftPackageManager: [
		.remote(url: "https://github.com/Alamofire/Alamofire", requirement: .upToNextMajor
		(from: "5.0.0"))
	],
	platforms: [.iOS]
)
```

위와같이 가져온 패키지를 어떤 프로젝트와 모듈들이 Dependency로 가져야하는지에 대한 설정

![스크린샷 2024-12-05 오후 10.17.59.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/3801af1a-9556-44aa-9c81-736de9e9bada/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.17.59.png)

![프로젝트에 패키지를 적용하는 예시](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/3492d81e-bf0c-4026-bfb0-3e50c613155e/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.22.05.png)

프로젝트에 패키지를 적용하는 예시

Dependencies에서 설정해둔 name을 가져와 위처럼 적용하면 됨

**이때 name은 path나 url 끝에있는 이름이 아닌 해당 패키지의 github 등의 .swift 파일에서 ‘products’ 배열 내부의 라이브러리 name을 사용해야함!!**

![스크린샷 2024-12-05 오후 10.54.42.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/d301d514-2849-445a-a8f9-7acf26d95a5a/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.54.42.png)

### WorkSpace(여러 프로젝트들을 묶어주는 파일)

![스크린샷 2024-12-05 오후 10.25.21.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/3e895e37-a084-4970-85d5-91863446fe6e/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.25.21.png)

위의 예시에는 프로젝트가 App 하나 뿐이라 projects 배열에 요소가 하나 뿐이지만 복수일 경우 추가해주면 됨.

## Tuist를 명령어로 제어하는 전체적인 프로세스(프로젝트 생성)

- Tuist edit
    
    ![스크린샷 2024-12-05 오후 10.27.52.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/8a09fa81-db79-4da8-b2ab-61be0faa4dbb/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.27.52.png)
    
    Xcode로 Project Description과 하위 파일들을 설정할 수 있는 창이 나옴
    
    위의 예시처럼 필요한 정보들을 기입하면 됨
    

- Tuist fetch
    
    ![스크린샷 2024-12-05 오후 10.29.09.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/0a8ce121-7643-43ae-b3a2-2965c7ae04c4/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.29.09.png)
    
    Dependencies에 기입해둔 패키지들을 모두 로컬에 가져와 Artifacts라는 형태로 저장하게되고, 각 프로젝트와 모듈에 패키지를 적용하게됨
    
- Tuist generate
    
    ![스크린샷 2024-12-05 오후 10.30.30.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/7c7acb26-f9be-4f21-bf87-c65588039cd6/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.30.30.png)
    

edit과 fetch를 바탕으로 Xcworkspace가 생성됨

## Tuist의 유지보수 및 상호작용

- RecourceSyntehsizers
    
    ![스크린샷 2024-12-05 오후 10.36.59.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/b0d5b5d2-c88c-487c-8dd0-b25eb781a37c/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.36.59.png)
    
    Resources와 관련된 기능
    
    ![스크린샷 2024-12-05 오후 10.37.32.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/2c6f29e6-a659-4ded-8a2d-9e01bad3b3db/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.37.32.png)
    
    Resources에는 strings, assets 등의 파일들이 들어있는데 ‘Tuist generate’ 할 때에 이를 바탕으로 Derived라는 폴더가 생성됨
    
    ![Derived 내부](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/be732cc1-3f65-40da-8e54-83f857783c66/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.38.35.png)
    
    Derived 내부
    
    ![스크린샷 2024-12-05 오후 10.39.00.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/7ba30081-3253-42e4-a532-70ebd32b182f/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.39.00.png)
    
    Aessets의 내부엔 string으로 모든 리소스를 관여할 수 있도록 자동으로 코드(enum)를 생성해줌
    
    ```jsx
    // 자동으로 생성된 코드를 사용하는 코드 예시.
    
    appleLoginButton.setImage(DesignSystemAsset.Assets.btnApplelogin.image, for: .normal)
    
    view.backgroundColor = DesignSystemAsset.Colors.gray3C.color
    ```
    
- Tuist cache warm(캐싱, Caching) 명령어
    
    ![스크린샷 2024-12-05 오후 10.43.02.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/b24e67de-8d46-453a-bd61-f8f64dbeaac7/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.43.02.png)
    
    작성해둔 패키지들을 tuist fetch 명령어를 통해 Artifacts 형태로 저장하고 이를 tuist cache warm 명령어를 통해 프리빌드된 Cache 파일로 만들 수 있다.
    
    ![캐싱된 파일은 로컬에 저장됨](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/f1dc2dbf-b4ba-40c6-8a74-44fdae7cf03e/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.44.19.png)
    
    캐싱된 파일은 로컬에 저장됨
    
    엄청 큰 용량의 패키지일 경우 캐싱을 통해 프리빌드를 해서 Headers와 같은 것들을 저장하기 때문에 빌드 속도가 아주 빨라짐
    
- Tuist graph 명령어
    
    ![스크린샷 2024-12-05 오후 10.46.53.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/092875ae-3ff1-4f14-a446-fae2f8770927/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.46.53.png)
    
    tuist 자체에서 도형을 통해 그림으로 그려주기도하고 json, svg 등의 포맷을 정해서 자동으로 생성해주는 기능
    

## Tuist를 프로젝트에 적용하며 마주치는 문제들

1. 키값 과 같은 민감한 정보 처리 문제
2. 파이어베이스 analystic 사용 문제
3. 패키지 name 문제
4. Static과 Dynamic 프레임워크 차이점
5. Static과 Dynamic 라이브러리 차이점
6. Target 설정
7. Scheme 설정
8. 잘못된 사용으로 팀 생산성 저하
    
    ![위의 사용예시에서 사용한 .external(name: “SnapKit”)과 같이 사용하면 문제없음!](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/1238082c-10fb-4bf8-8fe6-24e8ecd9233d/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.57.44.png)
    
    위의 사용예시에서 사용한 .external(name: “SnapKit”)과 같이 사용하면 문제없음!
    
    ![스크린샷 2024-12-05 오후 10.58.04.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/76a7e8b4-6d89-4b5c-920a-00a89db8d6ea/f6090f6f-3da9-4dfa-9b01-9abb68ef1abe/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-12-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_10.58.04.png)
    

## Tuist의 장단점
