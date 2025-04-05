//
//  Injections.swift
//  BabyFoodCare
//
//  Created by Kirill Frolovskiy on 05.04.2025.
//

import Foundation
import Swinject

final class Injections {
    static let shared = Injections()
    var container = Container()

    init() {
        container.register(APIClient.self) { _ in APIClient() }
        container.register(APIImageClient.self) { _ in APIImageClient() }
    }

    var apiClient: APIClient { container.resolve(APIClient.self) ?? APIClient() }
    var apiImageClient: APIImageClient { container.resolve(APIImageClient.self) ?? APIImageClient() }
}

@propertyWrapper struct Injected<Dependency> {
    let wrappedValue: Dependency

    init() {
        wrappedValue = Injections.shared.container.resolve(Dependency.self)!
    }
}
