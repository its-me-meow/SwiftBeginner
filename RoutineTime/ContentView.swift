import SwiftUI

struct ContentView: View {
//    @State var routineName : String
    var body: some View {
        NavigationView {
            VStack {
                Text("당신의 루틴을 지켜드릴게요!")
                    .font(.title)
                Text("하나의 루틴을 완성하기 위한 맞춤 알람 설정")
                    .font(.caption)
                    .padding(.top, 2)
                    .padding(.bottom, 50)
                                
                NavigationLink(destination: SetAlarmsView()) {
                    Text("루틴 생성하기")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
