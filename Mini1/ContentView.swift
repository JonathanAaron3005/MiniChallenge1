import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color("lightBlue"))
                .ignoresSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView{
                VStack {
                    HStack{
                        Text("Hey, Anies 👋🏻")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    }
                    
                    HStack{
                        Text("December")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Monthly")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    ExpensesAndBalances()
                    
                    Reminders()
                    
                    VStack{
                        Text("Category")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: -1, trailing: 0))
                        
                        HStack{
                            Category(categoryName: "Food", price: 100, icon: "🍔")
                            Category(categoryName: "Transport", price: 100, icon: "🚀")
                        }
                        HStack{
                            Category(categoryName: "Food", price: 100, icon: "🍔")
                            Category(categoryName: "Transport", price: 100, icon: "🚀")
                        }
                        HStack{
                            Category(categoryName: "Food", price: 100, icon: "🍔")
                            Category(categoryName: "Transport", price: 100, icon: "🚀")
                        }
                    }
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    
                    Spacer()
                }
                .padding()
            }
            
        }
    }
}


#Preview {
    ContentView()
}


struct ExpensesAndBalances: View {
    var body: some View {
        VStack(spacing: 2){
            UnevenRoundedRectangle(topLeadingRadius: 25,
                                   bottomLeadingRadius: 0, bottomTrailingRadius: 40, topTrailingRadius: 25)
            .fill(Color("darkBlue"))
            .frame(width: .infinity, height: 100)
            .overlay(HStack{
                VStack{
                    Text("Your Expenses")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity ,alignment: .leading)
                    Text("Rp500.000")
                        .font(.system(size: 37))
                        .fontWeight(.bold)
                        .foregroundColor(Color("customYellow"))
                        .frame(maxWidth: .infinity ,alignment: .leading)
                }
                .padding()
                
                Text("😱")
                    .font(.system(size: 80))
                    .padding(EdgeInsets(top: 22, leading: 0, bottom: 0, trailing: 20))
            }
            )
            
            UnevenRoundedRectangle(topLeadingRadius: 0,
                                   bottomLeadingRadius: 25, bottomTrailingRadius: 25, topTrailingRadius: 40)
            .fill(Color("blue"))
            .frame(width: .infinity, height: 100)
            .overlay(VStack{
                Text("Balance Left")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity ,alignment: .leading)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("lightBlue"))
                    .frame(height: 40)
                    .overlay(HStack{
                        Text("Rp1.500.000")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("blue"))
                            .frame(maxWidth: .infinity ,alignment: .leading)
                            .padding()
                        Text("🤏🏻")
                            .font(.system(size: 50))
                    }
                    )
            }
                .padding()
                     
            )
        }
    }
}

struct Reminders: View {
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("darkBlue"))
                .frame(width: 200, height: 150)
                .overlay(
                    VStack(alignment: .leading, spacing: 8){
                        Text("Reminders")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("customYellow"))
                        Text("You've already spent 90% on food.")
                            .font(.system(size: 15))
                            .foregroundStyle(.white)
                        Button{
                            print("test")
                        } label : {
                            Text("+ Add Reminders")
                                .font(.system(size: 12, weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .frame(width: 120, height: 25)
                                .background(Color("customYellow"))
                                .cornerRadius(7)
                                .frame(maxWidth: .infinity ,alignment: .leading)
                            
                            
                        }
                        
                    }
                        .padding()
                )
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("darkBlue"))
                .frame(width: 160, height: 150)
                .overlay(
                    VStack(alignment: .leading, spacing: 5){
                        Text("Keep it up!")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("blue"))
                        Text("You've already spent 90% on food.")
                            .font(.system(size: 15))
                            .foregroundStyle(.white)
                        Text("😽")
                            .font(.system(size: 30))
                    }
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                )
        }
    }
}
//test
