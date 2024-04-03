import SwiftUI

var budgetData = BudgetModel.createDummyData()

enum ReportType: String, CaseIterable {
    case monthly = "Monthly"
    case weekly = "Weekly"
}

let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "id_ID")
    return formatter
}()

func formatCurrency(_ amount: Double) -> String {
    return numberFormatter.string(from: NSNumber(value: amount)) ?? ""
}

struct ContentView: View {
    
    @State private var selectedOverviewType = ReportType.monthly
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(Color("lightYellow"))
                    .ignoresSafeArea(.all)
                
                ScrollView{
                    VStack {
                        HStack{
                            Text("Overview")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        }
                        
                        HStack {
                            Picker("Select Time", selection: $selectedOverviewType){
                                ForEach(ReportType.allCases, id: \.rawValue){ type in
                                    Text(type.rawValue).tag(type)
                                }
                            }
                            .pickerStyle(.segmented)
                            .frame(width: 150)
                            Spacer()
                        }
                        
                        ExpensesAndBalances(selectedOverviewType: $selectedOverviewType)
                        
                        VStack{
                            Text("Category")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: -1, trailing: 0))
                            
                            ForEach(budgetData.categories) {c in
                                Category(categoryName: c.category.rawValue,
                                         expense: selectedOverviewType == .monthly
                                         ? c.expense
                                         : c.weeklyExpense, 
                                         budget: selectedOverviewType == .monthly
                                         ? c.monthlyBudget
                                         : c.weeklyBudget,
                                         icon: c.icon,
                                         selectedOverviewType: $selectedOverviewType)
                            }
                        }
                        .padding(.vertical, 10)
                        
                        Spacer()
                    }
                    .padding()
                }
                
            }
        }
    }
}


#Preview {
    ContentView()
}


struct ExpensesAndBalances: View {
    
    @Binding var selectedOverviewType: ReportType
    
    var body: some View {
        NavigationLink(destination: DetailView()) {
            VStack(spacing: 2){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("darkBlue"))
                    .frame(width: .infinity, height: 100)
                    .overlay(
                        HStack{
                            VStack{
                                HStack {
                                    Image(systemName: "flame")
                                        .foregroundColor(Color("customYellow"))
                                    Text("Expense")
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("customYellow"))
                                        .frame(maxWidth: .infinity ,alignment: .leading)
                                }
                                
                                Text(selectedOverviewType == .monthly
                                     ? formatCurrency(budgetData.expense)
                                     : formatCurrency(budgetData.weeklyExpense))
                                    .font(.system(size: 37))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("customYellow"))
                                    .frame(maxWidth: .infinity ,alignment: .leading)
                            }
                            .padding()
                        }
                    )
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("darkBlue"))
                    .frame(width: .infinity, height: 100)
                    .overlay(
                        HStack{
                            VStack{
                                HStack {
                                    Image(systemName: "wallet.pass")
                                        .foregroundColor(Color("lightRed"))
                                    Text("Balance Left")
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("lightRed"))
                                        .frame(maxWidth: .infinity ,alignment: .leading)
                                }
                                
                                Text(selectedOverviewType == .monthly
                                     ? formatCurrency(budgetData.monthlyBudget - budgetData.expense)
                                     : formatCurrency(budgetData.weeklyBudget - budgetData.weeklyExpense))
                                    .font(.system(size: 37))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("lightRed"))
                                    .frame(maxWidth: .infinity ,alignment: .leading)
                            }
                            .padding()
                        }
                    )
            }
        }
    }
}


struct Category: View {
    
    let categoryName: String
    let expense: Double
    let budget: Double
    let icon: String
    @Binding var selectedOverviewType: ReportType
    
    var body: some View {
        NavigationLink(destination: DetailView()) {
            HStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: .infinity, height: 85)
                    .foregroundColor(Color("darkBlue"))
                    .overlay(
                        HStack{
                            Text("\(icon)")
                                .font(.system(size: 40))
                            VStack(alignment: .leading){
                                Text("\(categoryName)")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                BarIndicator(ratio: expense/budget)
                                HStack {
                                    Text("\(formatCurrency(expense))")
                                        .font(.system(size: 12))
                                        .fontWeight(.light)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("\(formatCurrency(budget))")
                                        .font(.system(size: 12))
                                        .fontWeight(.light)
                                        .foregroundColor(.white)
                                }
                            }
                            
                        }
                            .padding()
                    )
                    .shadow(color: .black.opacity(0.13), radius: 3, x: 0, y: 3)
            }
        }
    }
}

struct BarIndicator: View {
    
    var ratio: Double
    
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.gray.opacity(0.3))
                .frame(height: 20)
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(getColor())
                .frame(width: (ratio) * (UIScreen.main.bounds.width-135),
                       height: 20)
        }
    }
    
    func getColor() -> Color {
        if (ratio < 0.5) {
            return .green
        } else if (ratio < 0.75) {
            return Color("customYellow")
        } else {
            return Color("darkRed")
        }
    }
}

//struct Reminders: View {
//    var body: some View {
//        HStack{
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color("darkBlue"))
//                .frame(width: 200, height: 150)
//                .overlay(
//                    VStack(alignment: .leading, spacing: 8){
//                        Text("Reminders")
//                            .font(.system(size: 30))
//                            .fontWeight(.bold)
//                            .foregroundStyle(Color("customYellow"))
//                        Text("You've already spent 90% on food.")
//                            .font(.system(size: 15))
//                            .foregroundStyle(.white)
//                        Button{
//                            print("test")
//                        } label : {
//                            Text("+ Add Reminders")
//                                .font(.system(size: 12, weight: .bold, design: .default))
//                                .foregroundColor(.white)
//                                .frame(width: 120, height: 25)
//                                .background(Color("customYellow"))
//                                .cornerRadius(7)
//                                .frame(maxWidth: .infinity ,alignment: .leading)
//
//
//                        }
//
//                    }
//                        .padding()
//                )
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color("darkBlue"))
//                .frame(width: 160, height: 150)
//                .overlay(
//                    VStack(alignment: .leading, spacing: 5){
//                        Text("Keep it up!")
//                            .font(.system(size: 25))
//                            .fontWeight(.bold)
//                            .foregroundStyle(Color("blue"))
//                        Text("You've already spent 90% on food.")
//                            .font(.system(size: 15))
//                            .foregroundStyle(.white)
//                        Text("😽")
//                            .font(.system(size: 30))
//                    }
//                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
//                )
//        }
//    }
//}
