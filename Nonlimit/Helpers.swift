//
//  Helpers.swift
//  Nonlimit
//
//  Created by Designer on 2025/5/26.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content

    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: some View {
        build()
    }
}
