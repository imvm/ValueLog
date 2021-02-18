//
//  Array+Toggle.swift
//  ValueLog
//
//  Created by Ian Manor on 18/02/21.
//

extension Array where Element: Equatable {
    mutating func toggle(_ element: Element) {
        if contains(element) {
            removeAll(where: { $0 == element })
        } else {
            append(element)
        }
    }
}
