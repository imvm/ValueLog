//
//  ContentView.swift
//  ValueLog
//
//  Created by Ian Manor on 05/12/20.
//

import SwiftUI

typealias Value = String

struct ContentView: View {
    @State var maxCount = 5
    @State var selectedValues: [Value] = []
    @State var values: [Value] = [
        "Acceptance", "Faith", "Knowledge", "Achievement",
        "Fame", "Obedience", "Adventure", "Family",
        "Open-mindedness", "Advocacy", "Financial security", "Popularity",
        "Confidence", "Friendships", "Positivity", "Community",
        "Hard work", "Power", "Compassion", "Health",
        "Resilience", "Dependability", "Honesty", "Self-control",
        "Environmentalism", "Humor/fun", "Self-expression", "Fairness",
        "Independence", "Tradition"
    ]

    var body: some View {
        VStack {
            Spacer()
            Text("What are your core values? \(selectedValues.count)/\(maxCount)")
                .font(.headline)
                .fontWeight(.bold)
            Spacer()
            valueGrid
            Spacer()
            nextButton
            Spacer()
        }
    }

    var nextButton: some View {
        Button {

        } label: {
            Text("Next")
                .foregroundColor(Color(.label))
                .padding()
                .frame(width: 180)
                .background(
                    Capsule()
                        .foregroundColor(selectedValues.count < maxCount ? .gray : .purple)
                )
        }
        .disabled(selectedValues.count < maxCount)
    }

    var valueGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]) {
            ForEach(values, id: \.self) { value in
                Button {
                    if selectedValues.contains(value) {
                        selectedValues.removeAll(where: { $0 == value })
                    } else {
                        selectedValues.append(value)
                    }
                } label: {
                    Text(value)
                        .foregroundColor(Color(.label))
                        .padding()
                        .frame(width: 180)
                        .background(
                            Capsule()
                                .foregroundColor(selectedValues.contains(value) ? .gray : .purple)
                        )
                }
                .disabled(!selectedValues.contains(value) && selectedValues.count >= maxCount)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
