//
//  ImportTripView.swift
//  Take Off Go
//
//  Created by Brendan on 12/2/2022.
//

import SwiftUI

struct ImportTripView: View {
    @Binding var importTripKey: String

    var body: some View {
        Form {
            TextField("ABC123", text: $importTripKey)
                .keyboardType(.alphabet)
                .autocapitalization(.allCharacters)
                .disableAutocorrection(true)
                .font(.system(size: 30, weight: .heavy, design: .monospaced))
                .multilineTextAlignment(.center)
        }
    }
}

struct ImportTripView_Previews: PreviewProvider {
    static var previews: some View {
        ImportTripView(importTripKey: .constant(""))
    }
}
