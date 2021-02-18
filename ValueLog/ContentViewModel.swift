//
//  ContentViewModel.swift
//  ValueLog
//
//  Created by Ian Manor on 17/02/21.
//

import Foundation

enum ContentViewNavigation: Identifiable {
    case hierarchyView

    // MARK: Identifiable
    var id: Int {
        switch self {
        case .hierarchyView:
            return 1
        }
    }
}

class ContentViewModel: ObservableObject {
    @Published var showingNavigation: ContentViewNavigation?
    @Published var maxCount = 5
    @Published var selectedValues: [Value] = []
    @Published var values: [Value] = [
        "Acceptance", "Faith", "Knowledge", "Achievement",
        "Fame", "Obedience", "Adventure", "Family",
        "Open-mindedness", "Advocacy", "Financial security", "Popularity",
        "Confidence", "Friendships", "Positivity", "Community",
        "Hard work", "Power", "Compassion", "Health",
        "Resilience", "Dependability", "Honesty", "Self-control",
        "Environmentalism", "Humor/fun", "Self-expression", "Fairness",
        "Independence", "Tradition"
    ]

    func addValue(_ value: Value) {
        if selectedValues.contains(value) {
            selectedValues.removeAll(where: { $0 == value })
        } else {
            selectedValues.append(value)
        }
    }
}
