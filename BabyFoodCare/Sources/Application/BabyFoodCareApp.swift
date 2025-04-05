import SwiftUI

@main
struct DemoApp: App {
    // Используем ContentViewModel вместо ProductViewModel
    @StateObject private var productsViewModel = ProductViewModel()
    
    var body: some Scene {
        WindowGroup {
            // Внедряем TabView напрямую в корневое представление приложения
            TabView {
                // Первая вкладка
                ProductView(viewModel: productsViewModel)
                    .tabItem {
                        Label("Первая", systemImage: "1.circle")
                    }
                    .tag(0)
                
                // Вторая вкладка
                ProductView(viewModel: productsViewModel)
                    .tabItem {
                        Label("Вторая", systemImage: "2.circle")
                    }
                    .tag(1)
                
                // Третья вкладка
                ProductView(viewModel: productsViewModel)
                    .tabItem {
                        Label("Третья", systemImage: "3.circle")
                    }
                    .tag(2)
            }
        }
    }
}
