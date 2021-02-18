//
//  ContentView.swift
//  ValueLog
//
//  Created by Ian Manor on 05/12/20.
//

import SwiftUI

typealias Value = String

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("What are your core values? \(viewModel.selectedValues.count)/\(viewModel.maxCount)")
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                valueGrid
                Spacer()
                nextButton
                Spacer()
            }
            .navigation(item: $viewModel.showingNavigation, destination: presentNavigation)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    var nextButton: some View {
        CapsuleButton(
            value: "Next",
            backgroundColor: viewModel.selectedValues.count < viewModel.maxCount ? .gray : .purple
        ) {
            viewModel.showingNavigation = .hierarchyView
        }
        .disabled(viewModel.selectedValues.count < viewModel.maxCount)
    }

    var valueGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]) {
            ForEach(viewModel.values, id: \.self) { value in
                CapsuleButton(
                    value: value,
                    backgroundColor: viewModel.selectedValues.contains(value) ? .gray : .purple
                ) {
                    viewModel.addValue(value)
                }
                .disabled(!viewModel.selectedValues.contains(value) && viewModel.selectedValues.count >= viewModel.maxCount)
            }
        }
    }

    @ViewBuilder
    func presentNavigation(_ navigation: ContentViewNavigation) -> some View {
        switch navigation {
        case .hierarchyView:
            HierarchyView(coreValues: viewModel.selectedValues)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
