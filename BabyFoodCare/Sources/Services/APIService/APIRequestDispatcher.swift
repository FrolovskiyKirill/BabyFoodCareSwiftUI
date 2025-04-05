//
//  IAPIRequestDispatcher.swift
//  BabyFoodCare
//
//  Created by Kirill Frolovskiy on 05.04.2025.
//

import Foundation

protocol IAPIRequestDispatcher {
    static func request<T: Codable>(apiRouter: APIRouter) async throws -> T
}

final class APIRequestDispatcher: IAPIRequestDispatcher {
    class func request<T: Codable>(apiRouter: APIRouter) async throws -> T {
        var components = URLComponents()
        components.host = apiRouter.host
        components.scheme = apiRouter.scheme
        components.path = apiRouter.path
        components.queryItems = apiRouter.parameters
        
//        guard let url = components.url else {
//            throw APIRequestError.badUrl
//        }
        guard let url = URL(string: "http://localhost:3000/kir/food") else { throw APIRequestError.badUrl }
        
        print("🌐 API Request URL: \(url.absoluteString)")
        print("🚀 HTTP Method: \(apiRouter.method)")

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.method
        
        apiRouter.headers?.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        print("📋 HTTP Headers:")
        if let headers = urlRequest.allHTTPHeaderFields, !headers.isEmpty {
            headers.forEach { key, value in
                print("   \(key): \(value)")
            }
        } else {
            print("   [Нет заголовков]")
        }
        
        urlRequest.timeoutInterval = 30
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        print("✅ Response received with status code: \((response as? HTTPURLResponse)?.statusCode ?? 0)")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIRequestError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200 ... 299:
            break
        case 401:
            throw APIRequestError.unauthorized
        case 404:
            throw APIRequestError.notFound
        default:
            throw APIRequestError.unexpectedStatusCode(httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let responseObject = try decoder.decode(T.self, from: data)
            return responseObject
        } catch let decodingError as DecodingError {
            switch decodingError {
            case let .keyNotFound(key, _):
                throw APIRequestError.decodingError("Ключ не найден: \(key)")
            case let .valueNotFound(type, _):
                throw APIRequestError.decodingError("Значение типа \(type) не найдено")
            case let .typeMismatch(type, _):
                throw APIRequestError.decodingError("Несоответствие типа для \(type)")
            default:
                throw APIRequestError.decodingError(decodingError.localizedDescription)
            }
        } catch {
            throw APIRequestError.decodingError(error.localizedDescription)
        }
    }
}

enum APIRequestError: Error {
    case badUrl
    case invalidResponse
    case unauthorized
    case notFound
    case decodingError(String)
    case unexpectedStatusCode(Int)
}
