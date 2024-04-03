import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Overview", systemImage: "chart.bar.fill")
                }
            FormView()
                .tabItem {
                    Label("Add Expense", systemImage: "plus.circle.fill")
                }
            PlanView()
                .tabItem {
                    Label("Planning", systemImage: "list.bullet.clipboard.fill")
                }
        }
        
    }
}

#Preview {
    MainView()
}
