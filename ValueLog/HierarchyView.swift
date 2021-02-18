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
            ForEach(coreValues, id: \.self) { coreValue in
                Text(coreValue)
            }
        }
    }
}
