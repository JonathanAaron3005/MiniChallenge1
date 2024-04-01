import SwiftUI
import Charts

//DUMMY DATA ------------------------------------------------------------------------
struct MonthlyHoursOfSunshine: Identifiable {
    let id = UUID()
    var city: String
    var date: Date
    var hoursOfSunshine: Double

    init(city: String, month: Int, hoursOfSunshine: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.city = city
        self.date = calendar.date(from: DateComponents(year: 2023, month: month))!
        self.hoursOfSunshine = hoursOfSunshine
    }
}

var data: [MonthlyHoursOfSunshine] = [

    MonthlyHoursOfSunshine(city: "Seattle", month: 1, hoursOfSunshine: 74),
    MonthlyHoursOfSunshine(city: "Seattle", month: 2, hoursOfSunshine: 80),
    MonthlyHoursOfSunshine(city: "Seattle", month: 3, hoursOfSunshine: 90),
    MonthlyHoursOfSunshine(city: "Seattle", month: 4, hoursOfSunshine: 110),
    MonthlyHoursOfSunshine(city: "Seattle", month: 5, hoursOfSunshine: 130),
    MonthlyHoursOfSunshine(city: "Seattle", month: 6, hoursOfSunshine: 140),
    MonthlyHoursOfSunshine(city: "Seattle", month: 7, hoursOfSunshine: 160),
    MonthlyHoursOfSunshine(city: "Seattle", month: 8, hoursOfSunshine: 150),
    MonthlyHoursOfSunshine(city: "Seattle", month: 9, hoursOfSunshine: 140),
    MonthlyHoursOfSunshine(city: "Seattle", month: 10, hoursOfSunshine: 120),
    MonthlyHoursOfSunshine(city: "Seattle", month: 11, hoursOfSunshine: 100),
    MonthlyHoursOfSunshine(city: "Seattle", month: 12, hoursOfSunshine: 80),
    
    MonthlyHoursOfSunshine(city: "Cupertino", month: 1, hoursOfSunshine: 196),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 2, hoursOfSunshine: 180),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 3, hoursOfSunshine: 220),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 4, hoursOfSunshine: 240),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 5, hoursOfSunshine: 260),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 6, hoursOfSunshine: 170),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 7, hoursOfSunshine: 280),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 8, hoursOfSunshine: 290),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 9, hoursOfSunshine: 280),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 10, hoursOfSunshine: 260),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 11, hoursOfSunshine: 240),
    MonthlyHoursOfSunshine(city: "Cupertino", month: 12, hoursOfSunshine: 60)
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
                            x: .value("Month", $0.date),
                            y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                        )
                        .foregroundStyle(by: .value("City", $0.city))
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
