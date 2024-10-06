//
//  LabeledIconView.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import SwiftUI
// Reusable view for icon and label
struct LabeledIconView: View {
    let iconName: String
    let labelText: String
    let labelColor: Color
    let iconColor: Color
    let font: Font
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            Text(labelText)
                .font(font)
                .foregroundColor(labelColor)
            Spacer()
        }
    }
}
#Preview {
    LabeledIconView(
        iconName: "moon.fill",
        labelText: "Moom",
        labelColor: .primary,
        iconColor: .blue,
        font: .headline
    )
    
}
