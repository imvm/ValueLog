//
//  HierarchyView.swift
//  ValueLog
//
//  Created by Ian Manor on 17/02/21.
//

import SwiftUI

struct HierarchyView: View {
    @State var coreValues: [Value]

    var body: some View {
        VStack {
            Text("Which one of these is more important to you?")
                .bold()
            ForEach(coreValues, id: \.self) { coreValue in
                Text(coreValue)
            }
        }
    }
}
