//
//  ImageSliderView.swift
//  Take Off Go
//
//  Created by Brendan on 19/2/2022.
//

import SwiftUI

struct ImageSliderView: View {
    var images: [String]

    var body: some View {
        if images.isEmpty {
            EmptyView()
        } else if images.count == 1 {
            Image.fromHash(hash: images[0])
                .resizable()
                .scaledToFill()

        } else {
            TabView {
                ForEach(images, id: \.self) { image in
                    Image.fromHash(hash: image)
                        .resizable()
                        .scaledToFill()
                        .listRowInsets(.none)
                        .clipped()
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView(images: [])
    }
}
