import ProjectDescription

let project = Project(
    name: "Tuist_Study",
    packages: [
        .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.0.1"))
    ],
    targets: [
        .target(
            name: "Tuist_Study",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Tuist-Study",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Tuist_Study/Sources/**"],
            resources: ["Tuist_Study/Resources/**"],
            dependencies: [
                .package(product: "SnapKit")
            ]
        ),
        .target(
            name: "Tuist_StudyTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.Tuist-StudyTests",
            infoPlist: .default,
            sources: ["Tuist_Study/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Tuist_Study")]
        ),
    ]
)
