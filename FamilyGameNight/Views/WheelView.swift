import SwiftUI
import FortuneWheel

struct WheelView: View {
    
    var names : [String]
    @State var disableWheel = false
    @State var winner = "John Doe"
    @State var hideAlert = true
    
    var body: some View {
        let model = FortuneWheelModel(
            titles: names, size: 320,
            onSpinEnd: onSpinEnd,
            getWheelItemIndex: getWheelItemIndex
        )
        
        VStack {
            ZStack {
                FortuneWheel(model: model)
                    .disabled(disableWheel ? true : false)
                WheelAlert(name: winner)
                    .offset(x: 0, y: hideAlert ? -6000 : 0)
            }
            .padding(100)
            
            Image(systemName: "hand.draw.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75.0, height: 75.0)
            Text("Swipe to spin!")
                .font(.headline)
                .fontWeight(.bold)
            Spacer()
        }
    }
    
    private func onSpinEnd(index: Int) {
        winner = names[index]
        disableWheel = false
        hideAlert = false
    }

    private func getWheelItemIndex() -> Int {
        disableWheel = true
        hideAlert = true
        //The ultimate winner is determined by the id given heres
        //returns a random number between 0 and the length of the array -1
        return Int(arc4random_uniform(UInt32(names.count)))
    }
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView(names: ["Sam", "Mette"])
    }
}
