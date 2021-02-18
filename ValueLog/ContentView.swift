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
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    var nextButton: some View {
        NavigationLink(destination: HierarchyView(coreValues: viewModel.selectedValues)) {
            Text("Next")
                .foregroundColor(Color(.label))
                .padding()
                .frame(width: 180)
                .background(
                    Capsule()
                        .foregroundColor(viewModel.selectedValues.count < viewModel.maxCount ? .gray : .purple)
                )
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
                Button {
                    viewModel.addValue(value)
                } label: {
                    Text(value)
                        .foregroundColor(Color(.label))
                        .padding()
                        .frame(width: 180)
                        .background(
                            Capsule()
                                .foregroundColor(viewModel.selectedValues.contains(value) ? .gray : .purple)
                        )
                }
                .disabled(!viewModel.selectedValues.contains(value) && viewModel.selectedValues.count >= viewModel.maxCount)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
