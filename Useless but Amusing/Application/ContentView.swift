import SwiftUI

struct ContentView: View {
    @AppStorage("tabSelection") var tabSelection: Int = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            CollectionView()
                .tag(0)
                .tabItem {
                    Label("Collection", systemImage: "square.grid.2x2.fill")
                }
            MapView()
                .tag(1)
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
