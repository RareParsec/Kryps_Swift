import SwiftUI


struct ContentView: View {
    
    @State var selection: TabItem = .home
    
    var body: some View {
        VStack{
            CustomTabView(selection: $selection) {
                Color.red.customTabItem(.home, selection: $selection)
                
                Color.blue.customTabItem(.book, selection: $selection)
            }
            
            NavigationView {
                HStack{
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
