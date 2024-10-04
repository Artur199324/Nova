//
//  DetailsINewsViewView.swift
//  Nova Scotia Resort Places
//
//  Created by Artur on 05.10.2024.
//

import SwiftUI

struct DetailsINewsViewView: View {
    @Binding var number: Int
    @Environment(\.dismiss) var dismiss
    @State var settings = false
    @State var news = News()
    @State private var showAlert = false
    var body: some View {
        VStack{
            HStack{
                Button {
                    self.dismiss()
                } label: {
                    Image("Frame 40")
                }.padding(.leading)
                
                Image("Details").padding(.leading,15)
                Spacer()
                Button {
                    settings.toggle()
                } label: {
                    Image("seetings")
                }.padding(.trailing,30)
                
            }
            Image(news.imgNews[number])
            ScrollView{
                Text(news.textNews[number])
                    .foregroundColor(Color("Color1"))
                    .padding()
                HStack{
                    Image("Rate this Material_").padding(.leading)
                    Spacer()
                    Button(action: {
                        showAlert.toggle()
                    }, label: {
                        Image("Frame 16")
                    })
                    Button(action: {
                        showAlert.toggle()
                    }, label: {
                        Image("Frame 17")
                    }).padding(.trailing)
                }
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Thank you for your feedback"),
                      dismissButton: .default(Text("OK")))
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Image("main screen").ignoresSafeArea())
            .fullScreenCover(isPresented: $settings, content: {
                SetingsScrensView()
            })
    }
}

#Preview {
    DetailsINewsViewView(number: .constant(0))
}
