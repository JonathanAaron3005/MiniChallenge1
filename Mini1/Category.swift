import SwiftUI

struct Category: View {
    
    let categoryName: String
    let price: Int
    let icon: String
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: 170, height: 170)
                .foregroundColor(.white)
                .overlay(
                    VStack{
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.gray.opacity(0.3))
                                .frame(height: 20)
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("customRed"))
                                .frame(width: 0.3 * UIScreen.main.bounds.width,
                                       height: 20)
                            
                        }
                        Text("\(icon)")
                            .font(.system(size: 40))
                        Text("\(categoryName)")
                            .font(.system(size: 15))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("IDR \(price)k/mo")
                            .font(.system(size: 12))
                            .fontWeight(.light)
                    }
                    
                        .padding()

                )
        }
    }
}

