import SwiftUI
import Charts

//DUMMY DATA ------------------------------------------------------------------------
struct Transaction: Identifiable {
    let id = UUID()
    var status: String
    var date: Date
    var amount: Double

    init(status: String, day: Int, amount: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.status = status
        self.date = calendar.date(from: DateComponents(year: 2023, month: 1, day: day))!
        self.amount = amount
    }
}

var data: [Transaction] = [

    Transaction(status: "Expense", day: 1, amount: 74),
    Transaction(status: "Expense", day: 2, amount: 174),
    Transaction(status: "Expense", day: 3, amount: 44),
    Transaction(status: "Expense", day: 4, amount: 54),
    Transaction(status: "Expense", day: 5, amount: 64),
    Transaction(status: "Expense", day: 6, amount: 74),
    Transaction(status: "Expense", day: 7, amount: 134),
    Transaction(status: "Expense", day: 8, amount: 50),
    Transaction(status: "Expense", day: 9, amount: 214),
    Transaction(status: "Expense", day: 10, amount: 200),
    Transaction(status: "Expense", day: 11, amount: 133),
    Transaction(status: "Expense", day: 12, amount: 134),
    Transaction(status: "Expense", day: 13, amount: 200),
    Transaction(status: "Expense", day: 14, amount: 300),
    Transaction(status: "Expense", day: 15, amount: 374),
    Transaction(status: "Expense", day: 16, amount: 274),
    Transaction(status: "Expense", day: 17, amount: 123),
    Transaction(status: "Expense", day: 18, amount: 343),
    Transaction(status: "Expense", day: 19, amount: 144),
    Transaction(status: "Expense", day: 20, amount: 256),
    Transaction(status: "Expense", day: 21, amount: 188),
    Transaction(status: "Expense", day: 22, amount: 123),
    Transaction(status: "Expense", day: 23, amount: 321),
    Transaction(status: "Expense", day: 24, amount: 213),
    Transaction(status: "Expense", day: 25, amount: 111),
    Transaction(status: "Expense", day: 26, amount: 222),
    Transaction(status: "Expense", day: 27, amount: 233),
    Transaction(status: "Expense", day: 28, amount: 231),
    Transaction(status: "Expense", day: 29, amount: 124),
    Transaction(status: "Expense", day: 30, amount: 111),
    
    Transaction(status: "Income", day: 1, amount: 374),
    Transaction(status: "Income", day: 2, amount: 174),
    Transaction(status: "Income", day: 3, amount: 454),
    Transaction(status: "Income", day: 4, amount: 114),
    Transaction(status: "Income", day: 5, amount: 90),
    Transaction(status: "Income", day: 6, amount: 274),
    Transaction(status: "Income", day: 7, amount: 234),
    Transaction(status: "Income", day: 8, amount: 230),
    Transaction(status: "Income", day: 9, amount: 214),
    Transaction(status: "Income", day: 10, amount: 290),
    Transaction(status: "Income", day: 11, amount: 125),
    Transaction(status: "Income", day: 12, amount: 334),
    Transaction(status: "Income", day: 13, amount: 300),
    Transaction(status: "Income", day: 14, amount: 174),
    Transaction(status: "Income", day: 15, amount: 174),
    Transaction(status: "Income", day: 16, amount: 224),
    Transaction(status: "Income", day: 17, amount: 123),
    Transaction(status: "Income", day: 18, amount: 300),
    Transaction(status: "Income", day: 19, amount: 374),
    Transaction(status: "Income", day: 20, amount: 234),
    Transaction(status: "Income", day: 21, amount: 146),
    Transaction(status: "Income", day: 22, amount: 174),
    Transaction(status: "Income", day: 23, amount: 230),
    Transaction(status: "Income", day: 24, amount: 320),
    Transaction(status: "Income", day: 25, amount: 120),
    Transaction(status: "Income", day: 26, amount: 174),
    Transaction(status: "Income", day: 27, amount: 274),
    Transaction(status: "Income", day: 28, amount: 374),
    Transaction(status: "Income", day: 29, amount: 454),
    Transaction(status: "Income", day: 30, amount: 374),
]
//------------------------------------------------------------------------------

struct PlanView: View {
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("lightBlue"))
                .ignoresSafeArea(.all)
            
            ScrollView{
                VStack{
                    ProfileBar()
                    
                    StatusInfo()
                    
                    Rectangle()
                        .fill(.black)
                        .frame(height: 1)
                        .opacity(0.3)
                    HStack(spacing: 40){
                        Text("Weekly")
                            .font(.system(size: 12))
                        Text("Monthly")
                            .font(.system(size: 12))
                    }
                    Rectangle()
                        .fill(.black)
                        .frame(height: 1)
                        .opacity(0.3)
                    
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
            VStack{
                Text("Total")
                    .font(.system(size: 18, weight: .medium))
                Text("Rp500.000")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.blue)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
