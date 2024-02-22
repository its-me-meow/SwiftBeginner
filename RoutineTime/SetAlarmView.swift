import SwiftUI

struct SetAlarmsView: View {
    @State private var numberOfAlarmsText: String = ""
    @State private var alarmTimes: [Date] = []
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("몇 개의 알람을 설정할까요?")
                .font(.title3)
                .padding()
            
            TextField("설정할 알람 개수를 입력하세요.", text: $numberOfAlarmsText)
                .textFieldStyle(.roundedBorder)
                .padding()
                .keyboardType(.numberPad)
            
            Button(action: {
                createAlarms()
            }) {
                Text("알람 생성하기!")
            }
            .padding()
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(alarmTimes.indices, id: \.self) { index in
                        DatePicker("알람 \(index + 1)", selection: $alarmTimes[index], displayedComponents: .hourAndMinute)
                            .padding(10)
                    }
                }
            }
        }
        .padding()
        .navigationBarTitle("알람 개수 설정")
        
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("경고"), message: Text("0이 아닌 자연수를 입력해주세요."), dismissButton: .default(Text("확인")))
        }
    }
    
    private func createAlarms() {
        if let numberOfAlarms = Int(numberOfAlarmsText), numberOfAlarms > 0 {
            alarmTimes = Array(repeating: Date(), count: numberOfAlarms)
        } else {
            showingAlert = true
        }
    }
}

#Preview {
    SetAlarmsView()
}
