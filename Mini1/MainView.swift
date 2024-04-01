import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Overview", systemImage: "house.fill")
                }
            FormView()
                .tabItem {
                    Label("", systemImage: "plus.circle.fill")
                }
            PlanView()
                .tabItem {
                    Label("Plan", systemImage: "list.bullet.clipboard.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
