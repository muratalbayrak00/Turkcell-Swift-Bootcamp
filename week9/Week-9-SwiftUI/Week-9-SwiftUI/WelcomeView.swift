//
//  WelcomeView.swift
//  Week-9-SwiftUI
//
//  Created by Kerim Çağlar on 18.04.2024.
//

import SwiftUI


struct AccountRowView: View {
    
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
    }
}

struct WelcomeView: View {
    
    @State var isActive: Bool = false
    @State var rating = 0
    @State var isSheetPresented = false
    
    var body: some View {
        
        
        /*HStack(alignment: .top, spacing: 80) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
                .foregroundColor(isActive ? .red : .gray)
                .onTapGesture {
                    isActive.toggle()
                }
            
            VStack(alignment: .leading) {
                Text("Deneme")
                Text("Deneme 2")
                    .bold()
            }
        }*/
        
        /*List {
            Text("Cem")
            Text("Zeynep")
            Text("Büşra")
            Text("Eren")
            Text("Kerem")
            Text("Osman")
        }.listStyle(.sidebar)
         */
    
        /*Text("Merhaba Kullanıcı")
        
        Group {
            VStack {
                AccountRowView(icon: "scribble", title: "Seyahatlerim")
                AccountRowView(icon: "gift", title: "Kampanyalarım")
                AccountRowView(icon: "alarm", title: "Alarmlarım")
                AccountRowView(icon: "person", title: "Profilim")
                AccountRowView(icon: "questionmark.circle", title: "Yardım")
                AccountRowView(icon: "gearshape", title: "Ayarlar")
                AccountRowView(icon: "info.circle", title: "Hakkımızda")
            }
            
            AccountRowView(icon: "rectangle.portrait.and.arrow.right", title: "Çıkış Yap")
        }
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray, lineWidth: 1)
            }
        .padding(.horizontal)
            */
        
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    DestinationView(text: "NEREDEN", subText: "İl veya İlçe Seçiniz")
                        
                    Divider()
                        .frame(width: 250)
                        .offset(CGSize(width: 60, height: 1))
                        
                    
                    DestinationView(text: "NEREYE", subText: "İl veya İlçe Seçiniz")
                }
                Spacer()
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                        .stroke(.gray, lineWidth: 1)
                }
            .padding(.horizontal)
            
            DateView(dateText: "20 Nisan Cumartesi")
                .onTapGesture {
                    isSheetPresented.toggle()
                }
                .sheet(isPresented: $isSheetPresented) {
                    RatingView(rating: $rating)
                        .presentationDetents([.height(200), .medium])
                }
            
        }
        
    }
}

#Preview {
    WelcomeView()
}
