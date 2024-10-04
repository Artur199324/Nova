import SwiftUI

struct WritetoUsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var Smessage = false
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.dismiss()
                } label: {
                    Image("Frame 40")
                }.padding(.leading)
                
                Image("Write to Us").padding(.leading, 15)
                Spacer()
            }
            
            ScrollView {
                VStack(spacing: 20) {
                    TextField("Enter Your Name", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .bold))
                    
                    TextField("Enter Your Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .bold))
                        .keyboardType(.emailAddress)
                    
                    ZStack(alignment: .topLeading) {
                        // Placeholder text
                     
                        
                        TextEditor(text: $message)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .bold))
                            .frame(height: 150)
                            .scrollContentBackground(.hidden) // Убирает стандартный фон
                            .background(Color.purple.opacity(0.3))
                        if message.isEmpty {
                            Text("Enter your message")
                                .foregroundColor(Color.gray)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 10)
                        }
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    Smessage.toggle()
                }, label: {
                    Image("Frame 68")
                }).padding(.top)
            }.padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("main screen").ignoresSafeArea())
        .overlay {
            if Smessage{
                Image("Frame 50")
                    .overlay {
                        Button(action: {
                            self.dismiss()
                        }, label: {
                            Image("Frame 7")
                        }).padding(.top,180)
                    }
            }
        }
    }
}

#Preview {
    WritetoUsView()
}
