//
//  DetailView.swift
//  BabyFoodCare
//
//  Created by Kirill Frolovskiy on 05.04.2025.
//

import MapKit
import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                VStack {
                    Text(viewModel.element.title)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 4)
                    
                    Text(viewModel.element.description)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                .padding(.horizontal, 1)
                
                .frame(height: 300)
                .frame(maxWidth: .infinity)
            }
        }
    }
}
