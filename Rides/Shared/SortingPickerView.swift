//
//  SortingPickerView.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import SwiftUI

struct SortingPickerView: View {
    @Binding var sortByVin: Bool
    let onSortChange: () -> Void
    var body: some View {
        Picker(SortingPickerViewStrings.sortByLabel, selection: $sortByVin) {
            Text(SortingPickerViewStrings.vinLabel).tag(true)
            Text(SortingPickerViewStrings.carTypeLabel).tag(false)
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: sortByVin) { _ in
            onSortChange()
        }
        .padding(.top, 3)
    }
}
#Preview {
    SortingPickerView(
        sortByVin: .constant(true),
        onSortChange: {
            // Do nothing for preview purposes
        }
    )
}


