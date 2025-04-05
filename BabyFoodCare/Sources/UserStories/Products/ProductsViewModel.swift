//
//  ContentViewModel.swift
//  MVVM_example
//
//  Created by Boris Bugor on 03/03/2025.
//

import SwiftUI

final class ProductViewModel: ObservableObject {
    @Injected var service: APIClient
    @Injected var imageServise: APIImageClient
    @Published var presentedContent: ProductsData?
    @Published var productsData: [ProductsData] = []
    
    func fetchData() async {
        do {
            let mapData = try await service.getProducts()
            
            let productsData: [ProductsData] = mapData.map {
                .init(title: $0.title, description: $0.description)
            }
            await MainActor.run {
                self.productsData = productsData
            }
        } catch {
            print("Fetching establishments failed with error \(error)")
        }

        func setPresentedContent(_ content: ProductsData) {
            presentedContent = content
        }
    }
}
