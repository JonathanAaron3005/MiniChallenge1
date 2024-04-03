import SwiftUI
import Charts

//DUMMY DATA ------------------------------------------------------------------------

var data = TransactionModel.createDummyData()

//------------------------------------------------------------------------------

struct DetailView: View {
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("lightYellow"))
                .ignoresSafeArea(.all)
            
            ScrollView{
                VStack{
                    ProfileBar()
                    
                    StatusInfo()
                    
                    VStack{
                        Text("March 2024")
                            .fontWeight(.medium)
                        
                    }
                    .padding(.vertical)
                    
                    Chart(data) {
                        LineMark(
                            x: .value("Day", $0.date),
                            y: .value("Hours of Sunshine", $0.amount)
                        )
                        .foregroundStyle(by: .value("Status", $0.status))
                    }
                    
                    VStack{
                        HStack{
                            Text("History")
                                .fontWeight(.medium)
                                .font(.system(size: 20))
                            Spacer()
                            Text("Sort By")
                                .font(.system(size: 15))
                        }
                        .padding(.vertical, 20)
                        
                        TransactionHistory(title: "KFC", day: 2, month: "March", amount: Int64(20000))
                        TransactionHistory(title: "Pagi Sore", day: 2, month: "March", amount: Int64(100000))
                        TransactionHistory(title: "KFC", day: 2, month: "March", amount: Int64(20000))
                        TransactionHistory(title: "KFC", day: 2, month: "March", amount: Int64(20000))
                        TransactionHistory(title: "Pagi Sore", day: 2, month: "March", amount: Int64(100000))
                        TransactionHistory(title: "KFC", day: 2, month: "March", amount: Int64(20000))
                        TransactionHistory(title: "KFC", day: 2, month: "March", amount: Int64(20000))
                        TransactionHistory(title: "Pagi Sore", day: 2, month: "March", amount: Int64(100000))
                        TransactionHistory(title: "KFC", day: 2, month: "March", amount: Int64(20000))
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct ProfileBar: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color("darkBlue"))
            .frame(width: .infinity, height: 55)
            .overlay(
                HStack(spacing: 70){
                    HStack(spacing: 20){
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 42))
                        
                        Text("Balance")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                    Text("Rp500.000")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
            )
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 4)
    }
}

struct StatusInfo: View {
    var body: some View {
        HStack(spacing: 70){
            VStack{
                Text("Income")
                    .font(.system(size: 18, weight: .medium))
                Text("Rp300.000")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.green)
            }
            VStack{
                Text("Expense")
                    .font(.system(size: 18, weight: .medium))
                Text("Rp200.000")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.red)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct TransactionHistory: View {
    
    let title: String
    let day: Int
    let month: String
    let amount: Int64
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "fork.knife.circle.fill")
                .resizable()
                .frame(width: 45, height: 45)
            VStack(alignment: .leading){
                Text("\(title)")
                    .fontWeight(.medium)
                Text("\(day) \(month)")
                    .font(.system(size: 15))
                    .fontWeight(.light)
            }
            Spacer()
            VStack(alignment: .trailing){
                Text("Rp. \(amount),-")
                    .fontWeight(.medium)
                Text("Food")
                    .font(.system(size: 15))
                    .fontWeight(.light)
            }
        }
        .padding(.vertical, 5)
    }
}
