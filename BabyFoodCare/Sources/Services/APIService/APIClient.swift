//
//  ProductsProtocol.swift
//  BabyFoodCare
//
//  Created by Kirill Frolovskiy on 05.04.2025.
//


import Foundation

protocol ProductsProtocol {
    func getProducts() async throws -> [ProductsModel]
}

protocol ProductDetailsProtocol {
    func getProductDetails(productID: Int) async throws -> ProductDetailsModel
}

final class APIClient: ProductsProtocol {
    func getProducts() async throws -> [ProductsModel] {
        let products: [ProductsModel] = try await APIRequestDispatcher.request(apiRouter: .getProducts)
        return products
    }
}

extension APIClient: ProductDetailsProtocol {
    func getProductDetails(productID: Int) async throws -> ProductDetailsModel {
        let productDetails: ProductDetailsModel = try await APIRequestDispatcher.request(apiRouter: .getProductDetails(poductID: productID))
        return productDetails
    }
}
