import SwiftUI
import CoreData

struct TestView: View {

    private var element = NumberFromAPI(text: "text for number, text for number, text for number, text for number", found: true, number: 10, type: TypeNumber.trivia.value, date: "", year: 0)
    
    var body: some View {
        VStack {
            Text(String(element.number!))
                .bold()
                .font(.system(size: 40))
                .padding(.bottom)

            Text(element.text ?? "")
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.leading)
                .font(.system(size: 20))
            Text(element.type!)
                .bold()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.top)
                .font(.system(size: 20))
                .foregroundColor(.red)

        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(.gray)
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
