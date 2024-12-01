import SwiftUI


struct testing: View {
    @State var position = 0
    var body: some View {
        ZStack{
            ScrollView{
                LazyVStack(spacing:100){
                    ForEach (0..<100) {_ in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 100, height: 150)
                    }
                }
            }
            
            Text("\(position)")
        }
    }
}





#Preview {
    testing()
}
