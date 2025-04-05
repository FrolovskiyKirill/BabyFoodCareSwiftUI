//
//  ContentView.swift
//  MVVM_example
//
//  Created by Boris Bugor on 03/03/2025.
//

import SwiftUI

struct ProductView: View {
    @StateObject var viewModel: ProductViewModel

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(viewModel.productsData.indices, id: \.self) { index in
                    let element = viewModel.productsData[index]

                    VStack {
                        VStack {
                            Text(element.title)
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text(element.description)
                                .font(.caption)
                                .lineLimit(2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, 1)
                        .padding(.bottom, 4)

                        if index != viewModel.productsData.endIndex - 1 {
                            Divider()
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.presentedContent = element
                    }
                }
            }
            .padding(.horizontal)
        }
        .task {
            await viewModel.fetchData()
        }
        .sheet(
            item: $viewModel.presentedContent) { item in
                DetailView(viewModel: .init(element: item))
        }
    }
}

#Preview {
    ProductView(viewModel: .init())
}
