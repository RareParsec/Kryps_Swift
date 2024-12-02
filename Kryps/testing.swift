import SwiftUI

struct ContentView: View {
    @State private var scrollPosition: ScrollPosition = ScrollPosition(y: 0)
    
    var body: some View {
        VStack {
            // Second ScrollView (synchronized)
            ScrollView {
                Button {
                    withAnimation {
                        scrollPosition.scrollTo(y:200)

                    }
                } label: {
                    Rectangle()
                        .frame(width: 100, height: 100)
                }
                
                VStack(spacing: 20) {
                    ForEach(0..<50) { index in
                        Text("Item \(index + 1)")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .scrollPosition($scrollPosition)
            
        }
    }
}

// Helper PreferenceKey to track scroll offset
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    ContentView()
}
