@preconcurrency import ProjectDescription

let scriptPath = "./SwiftFormat/swiftformat.sh"

let project = Project(
    name: "BabyFoodCare",
    packages: [
        .remote(url: "https://github.com/uber/needle.git", requirement: .upToNextMajor(from: "0.18.0")),
        .remote(url: "https://github.com/ozontech/SUINavigation.git", requirement: .upToNextMajor(from: "1.11.0")),
        .remote(url: "https://github.com/Swinject/Swinject.git", requirement: .upToNextMajor(from: "2.8.0"))
    ],
    targets: [
        .target(
            name: "BabyFoodCare",
            destinations: .iOS,
            product: .app,
            bundleId: "io.frolovskiy.BabyFoodCare",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["BabyFoodCare/Sources/**"],
            resources: ["BabyFoodCare/Resources/**"],
            scripts: [
                .pre(
                    script: "bash SwiftFormat/swiftformat.sh",
                    name: "SwiftFormat"
                ),
            ],
            dependencies: [
                .package(product: "Swinject", type: .runtime),
                .package(product: "SUINavigation", type: .runtime),
                .package(product: "NeedleFoundation", type: .runtime)
            ]
        ),
        .target(
            name: "BabyFoodCareTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.frolovskiy.BabyFoodCareTests",
            infoPlist: .default,
            sources: ["BabyFoodCare/Tests/**"],
            resources: [],
            dependencies: [.target(name: "BabyFoodCare")]
        ),
    ]
)
