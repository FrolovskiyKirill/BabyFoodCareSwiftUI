//
//  DetailViewModel.swift
//  BabyFoodCare
//
//  Created by Kirill Frolovskiy on 05.04.2025.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    let element: ProductsData
    
    init(element: ProductsData) {
        self.element = element
    }
}
