//
//  NoDataView.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import SwiftUI
struct NoDataView: View {
    var body: some View {
        VStack {
            Image(systemName: NoDataViewStrings.carImageName)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            Text(NoDataViewStrings.noVehiclesMessage)
                .foregroundColor(.gray)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
#Preview {
    NoDataView()
}

