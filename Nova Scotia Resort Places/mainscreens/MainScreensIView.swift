import SwiftUI

struct MainScreensIView: View {
    @State  var selectedTab = 0

    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor(red: 37/255, green: 31/255, blue: 51/255, alpha: 1.0) // Преобразуем #251F33

        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            MainView(selectedTab: $selectedTab)
                .tabItem {
                    Image(selectedTab == 0 ? "home2" : "home1")
                }
                .tag(0)
            
            HotelsAllView()
                .tabItem {
                    Image(selectedTab == 1 ? "hotel2" : "hotel1")
                }
                .tag(1)
            NewsView().tabItem {
                Image(selectedTab == 2 ? "news2" : "news1")
            }
            .tag(2)
            
            FactsView()
                .tabItem {
                    Image(selectedTab == 3 ? "facts2" : "facts1")
                }.tag(3)
            QuizView()
                .tabItem {
                    Image(selectedTab == 4 ? "quiz2" : "quiz1")
                }.tag(4)
        }
        
    }
}

#Preview {
    MainScreensIView()
}
