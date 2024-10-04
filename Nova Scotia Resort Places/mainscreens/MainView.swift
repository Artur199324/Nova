//z\
//  MainView.swiftz
//  Nova Scotia Resort Places
//
//  Created by Artur on 04.10.2024.
//

import SwiftUI

struct MainView: View {
    @Binding var selectedTab: Int
    @State var settings = false
    @State var populaer = false
    @State private var number = 0
    var body: some View {
        VStack{
            HStack{
                Image("text")
                Button {
                    settings.toggle()
                } label: {
                    Image("seetings").padding(.top,10)
                }.padding(.top,10)
            }
            Button(action: {
                selectedTab = 1
            }, label: {
                Image("Frame 28")
            })
            HStack{
                Button(action: {
                    selectedTab = 2
                }, label: {
                    Image("Frame 27")
                })
                Button(action: {
                    selectedTab = 3
                }, label: {
                    Image("Frame 26")
                })
            }
            Button(action: {
                selectedTab = 4
            }, label: {
               Image("Frame 30")
            })
            HStack{
                Image("Frame 10")
                    .padding(.leading,50)
                    .padding(.top,20)
                Spacer()
            }
            Button(action: {
              number = 3
                populaer.toggle()
            }, label: {
                Image("Frame 35")
            }).padding(.top)

        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Image("main screen").ignoresSafeArea())
            .fullScreenCover(isPresented: $settings, content: {
                SetingsScrensView()
            })
            .fullScreenCover(isPresented: $populaer, content: {
                DetailsIView(number: $number)
            })
    }
}

#Preview {
    MainView(selectedTab: .constant(0))
}
