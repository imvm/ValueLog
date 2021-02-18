//
//  CapsuleButton.swift
//  ValueLog
//
//  Created by Ian Manor on 17/02/21.
//

import SwiftUI

struct CapsuleButton: View {
    var value: String
    var backgroundColor: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(value)
                .foregroundColor(Color(.label))
                .padding()
                .frame(width: 180)
                .background(
                    Capsule()
                        .foregroundColor(backgroundColor)
                )
        }
    }
}
