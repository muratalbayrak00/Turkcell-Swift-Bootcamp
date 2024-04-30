//
//  DestinationView.swift
//  Week-9-SwiftUI
//
//  Created by Kerim Çağlar on 18.04.2024.
//

import SwiftUI

struct DestinationView: View {
    var text: String
    var subText: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin")
                .padding()
            VStack(alignment: .leading) {
                Text(text)
                    .bold()
                    .foregroundStyle(.red)
                Text(subText)
            }
        }

    }
}

#Preview {
    DestinationView(text: "NEREDEN", subText: "İl veya İlçe Seçiniz")
}
