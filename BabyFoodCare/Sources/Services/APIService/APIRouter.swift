//
//  APIRouter.swift
//  BabyFoodCare
//
//  Created by Kirill Frolovskiy on 05.04.2025.
//

import Foundation

enum APIRouter {
    case getProducts
    case getProductDetails(poductID: Int)
    
    var host: String {
        switch self {
        case .getProducts, .getProductDetails:
            return "makarbass.ru"
        }
    }
    
    var scheme: String {
        switch self {
        case .getProducts, .getProductDetails:
            return "https"
        }
    }
    
    var path: String {
        switch self {
        case .getProducts:
            return "/kir/food"
        case let .getProductDetails(poductID):
            return "/kir/food/\(poductID)"
        }
    }
    
    var method: String {
        switch self {
        case .getProducts, .getProductDetails:
            return "GET"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getProducts, .getProductDetails:
            return []
        }
    }
    
    // Добавляем новое свойство для заголовков
    var headers: [String: String]? {
        // Получаем текущую локаль приложения
        let locale = Locale.current
        let languageCode = locale.language.languageCode?.identifier ?? "en"
        let regionCode = locale.region?.identifier ?? "US"
        let localeString = "\(languageCode)-\(regionCode)"
        
        // Базовые заголовки, которые будут использоваться во всех запросах
        let defaultHeaders: [String: String] = [
            "Accept-Language": localeString,
            "Accept": "application/json"
        ]
        
        return defaultHeaders
    }
}
