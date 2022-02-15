//
//  MarkdownView.swift
//  Take Off Go
//
//  Created by Brendan on 16/2/2022.
//

import SwiftUI

struct MarkdownView: View {
    var source: String?
    var body: some View {
        if (source ?? "").isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(source!.split(separator: "\n"), id: \.self) { str in
                    Text(str)
                }
            }
        }
    }
}

struct MarkdownView_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownView(source: "Hello world")
    }
}
