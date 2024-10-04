

import SwiftUI

struct SetingsScrensView: View {
    @Environment(\.dismiss) var dismiss
    @State var isPresent = false
    @State var isWrite = false
    
    let termsofUse =  "https://sites.google.com/view/terms-and-conditions-last-upda/"
    let privacyPolicy  = "https://www.termsfeed.com/live/fc9aaf9f-3289-43ed-aca1-7cd558516d0d"
    @State var link = ""
    private let requst = RequestAppReview()
    var body: some View {
        VStack{
            
            HStack{
                Button {
                    self.dismiss()
                } label: {
                    Image("Frame 40")
                }.padding(.leading)
                
                Image("Frame 8").padding(.leading,15)
                Spacer()
            }
            
            ScrollView{
                Button(action: {
                    isWrite.toggle()
                }, label: {
                    Image("st1")
                })
                Button(action: {
                    requst.requestAppReview()
                }, label: {
                    Image("st2")
                })
                Button(action: {
                    link = termsofUse
                    isPresent.toggle()
                }, label: {
                    Image("st3")
                })
                Button(action: {
                    link = privacyPolicy
                    isPresent.toggle()
                }, label: {
                    Image("st4")
                    
                })
            }.padding(.top)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Image("main screen").ignoresSafeArea())
            .overlay {
                if isPresent{
                    NavigationView {
                        PolisiPropertiView(url: URL(string: link)!)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarItems(trailing: Button(action: {
                                isPresent.toggle()
                            }) {
                                Text("Close")
                            })
                    }
                }
            }
            .fullScreenCover(isPresented: $isWrite, content: {
              WritetoUsView()
            })
    }
}

#Preview {
    SetingsScrensView()
}
