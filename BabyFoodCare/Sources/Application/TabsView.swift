//
//  TabsView.swift
//  BabyFoodCare
//
//  Created by Kirill Frolovskiy on 16.11.2024.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            ProductsView()
                .tabItem {
                    Image(systemName: "house")
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "house")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "house")
                }
        }
    }
}

#Preview {
    TabsView()
}
