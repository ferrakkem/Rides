//
//  ErrorMessageView.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import SwiftUI
struct ErrorMessageView: View {
    let errorMessage: String?

    var body: some View {
        if let errorMessage = errorMessage {
            Text(errorMessage)
                .foregroundColor(.red)
                .padding()
        }
    }
}
#Preview {
    ErrorMessageView(errorMessage: "Error Message")
}
