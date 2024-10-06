//
//  CarbonEmissionsView.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-06.
//
import SwiftUI
struct CarbonEmissionsView: View {
    @ObservedObject private var viewModel = CarbonEmissionsViewModel()
    let kilometrage: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(CarbonEmissionsViewStrings.carbonEmissionsTitle)
                .font(.headline)
            LabeledIconView(
                iconName: CarbonEmissionsViewStrings.kilometrageIcon,
                labelText: "\(CarbonEmissionsViewStrings.kilometrageLabel): \(kilometrage) km",
                labelColor: .primary,
                iconColor: .blue,
                font: .subheadline
            )
            // Format emissions value before passing it to LabeledIconView
            let formattedEmissions = String(format: "%.2f", viewModel.emissions)
            LabeledIconView(
                iconName: CarbonEmissionsViewStrings.emissionsIcon,
                labelText: "\(CarbonEmissionsViewStrings.emissionsLabel): \(formattedEmissions) units",
                labelColor: .primary,
                iconColor: .green,
                font: .subheadline
            )
        }
        .onAppear {
            viewModel.calculateEmissions(kilometrage: kilometrage)
        }
        .padding(10)
        .frame(width: UIScreen.main.bounds.width - 30, height: 160)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
#Preview {
    CarbonEmissionsView(kilometrage: 300)
}
