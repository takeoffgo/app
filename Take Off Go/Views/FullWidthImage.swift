//
//  FullWidthImage.swift
//  Take Off Go
//
//  Created by Brendan on 14/2/2022.
//

import SwiftUI

struct FullWidthImage: View {
    var hash: String

    var body: some View {
        AsyncImage(url: URL(string: "https://cdn.takeoffgo.com/\(hash)?w=800&h=400")) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                // Since the AsyncImagePhase enum isn't frozen,
                // we need to add this currently unused fallback
                // to handle any new cases that might be added
                // in the future:
                EmptyView()
            }
        }
    }
}

struct FullWidthImage_Previews: PreviewProvider {
    static var previews: some View {
        FullWidthImage(hash: "f754b3899622beeef21c4fbde473150f")
    }
}
