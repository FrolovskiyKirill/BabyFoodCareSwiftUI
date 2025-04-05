//
//  ProductsData.swift
//  BabyFoodCare
//
//  Created by Kirill Frolovskiy on 05.04.2025.
//
import SwiftUI

struct ProductsData: Identifiable {
    let id = UUID()
    let title: String
    let description: String
//    let image: UIImage?
}

extension ProductsData: Equatable {
    static func == (lhs: ProductsData, rhs: ProductsData) -> Bool {
        lhs.id == rhs.id
    }
}
