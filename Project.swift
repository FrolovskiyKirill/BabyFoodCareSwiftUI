@preconcurrency import ProjectDescription

let bundleId = ""

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
