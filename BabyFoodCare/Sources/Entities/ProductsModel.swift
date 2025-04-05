//
//  ProductsModel.swift
//  BabyFoodCare
//
//  Created by Kirill Frolovskiy on 05.04.2025.
//

import Foundation

struct ProductsModel: Codable {
    let id: Int
    let title: String
    let foodType: String
    let description: String
    let imageURL: String
    let foodTypeImageURL: String
    let monthFrom: Int
    let allergen: Bool
    let allergenDescription: String?
    let withWarning: Bool
    let warningNote: String?
    let howToServe: String?
    let howToServeImageURL: [String]?
    let calories: Int
    let protein: Int
    let fats: Int
    let carbs: Int
}

enum CodingKeys: String, CodingKey {
    case productID = "id"
}

extension ProductsModel: Hashable { }
