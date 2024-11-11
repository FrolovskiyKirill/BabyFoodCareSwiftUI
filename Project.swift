@preconcurrency import ProjectDescription

let scriptPath = "./SwiftFormat/swiftformat.sh"

let project = Project(
    name: "BabyFoodCare",
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
            dependencies: []
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
