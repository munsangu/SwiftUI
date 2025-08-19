import SwiftUI

struct ContentView: View {
    @State private var fontSize: Int = 34
    
    var body: some View {
        VStack {
            WebView(
                htmlString: htmlContent,
                fontSize: fontSize
            )
            .edgesIgnoringSafeArea(.all)
            
            HStack {
                Text("Font Size")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundStyle(.white)
                
                Button {
                    if fontSize < 44 {
                        fontSize += 2
                    }
                } label: {
                    Text("+")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundStyle(.white)
                        .offset(y: -1)
                }
                .padding(
                    .horizontal,
                    10
                )
                .padding(
                    .vertical,
                    3
                )
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.orange)
                }
                
                Button {
                    if fontSize > 26 {
                        fontSize -= 2
                    }
                } label: {
                    Text("-")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundStyle(.white)
                        .offset(y: -1)
                }
                .padding(
                    .horizontal,
                    12
                )
                .padding(
                    .vertical,
                    4
                )
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.orange)
                }
            }
            .padding()
        }
        .background(Color.cyan)
    }
}

#Preview {
    ContentView()
}
