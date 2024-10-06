//
//  MakeModelView.swift
//  Rides
//
//  Created by Ferrakkem Bhuiyan on 2024-10-04.
//

import SwiftUI

struct MakeModelView: View {
    let make: String
    let model: String
    let vin: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: MakeModelViewStrings.makeIcon)
                    .foregroundColor(.blue)
                Text("\(MakeModelViewStrings.makeLabel): \(make)")
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: MakeModelViewStrings.modelIcon)
                    .foregroundColor(.green)
                Text("\(MakeModelViewStrings.modelLabel): \(model)")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding(.bottom, 5)

            HStack {
                Image(systemName: MakeModelViewStrings.vinIcon)
                    .foregroundColor(.red)
                Text("\(MakeModelViewStrings.vinLabel): \(vin)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.top, 10)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2) // Adding shadow
    }
}

#Preview {
    MakeModelView(make: "Honda", model: "Civic", vin: "123DFGHJ345H")
}

