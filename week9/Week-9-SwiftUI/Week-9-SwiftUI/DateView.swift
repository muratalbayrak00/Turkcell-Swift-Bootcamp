//
//  DateView.swift
//  Week-9-SwiftUI
//
//  Created by Kerim Çağlar on 20.04.2024.
//

import SwiftUI

struct DateView: View {
    
    @State var dateText: String
    @State var isActiveToday: Bool = true
    @State var isActiveTomorrow: Bool = false
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "calendar")
                        .padding()
                    VStack(alignment: .leading) {
                        Text("GİDİŞ TARİHİ")
                            .bold()
                            .foregroundStyle(.red)
                        Text(dateText)
                    }
                }
                
                Divider().frame(width: 150)
                    .offset(CGSize(width: 60, height: 1))
                
                HStack(spacing: -16) {
                    
                    Group {
                        Text("Bugün")
                            .onTapGesture {
                                isActiveToday = true
                                isActiveTomorrow = false
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .background(isActiveToday ? .red : .white)
                            .foregroundColor(isActiveToday ? .white : .black)

                        
                        Text("Yarın")
                            .onTapGesture {
                                isActiveToday = false
                                isActiveTomorrow = true
                            }
                        
                        
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(isActiveTomorrow ? .red : .white)
                        .foregroundColor(isActiveTomorrow ? .white : .black)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray, lineWidth: 1)
                        }
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .padding(.horizontal)
                    .offset(CGSize(width: 40, height: 1))
                    
                }
            }
           
            Spacer()
        }
        .padding(.vertical, 20)
        //.padding(.trailing, 40)
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray, lineWidth: 1)
            }
        .padding(.horizontal)
    }
    
}

#Preview {
    DateView(dateText: "20 Nisan Cumartesi")
}
