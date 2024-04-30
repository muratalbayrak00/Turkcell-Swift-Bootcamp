//
//  RatingView.swift
//  Week-9-SwiftUI
//
//  Created by Kerim Çağlar on 20.04.2024.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(index <= rating ? .yellow : Color(uiColor: .systemGray5))
                    .onTapGesture {
                        self.rating = index
                    }
                
            }
        }
    }
}

#Preview {
    
    RatingView(rating: .constant(3))
}
