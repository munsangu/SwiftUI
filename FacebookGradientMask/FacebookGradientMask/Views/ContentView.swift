import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    LazyVStack(spacing: 15) {
                        ForEach(messages) { message in
                            MessageCardView(
                                screenProxy: proxy,
                                message: message
                            )
                        }
                    }
                }
                .navigationTitle("Messages")
                .padding(15)
            }
        }
    }
}

struct MessageCardView: View {
    var screenProxy: GeometryProxy
    var message: Message
    var body: some View {
        Text(message.message)
            .padding(10)
            .foregroundStyle(
                message.isReplay ?
                   Color.primary :
                        .white
            )
            .background {
                if message.isReplay {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.gray.opacity(0.3))
                } else {
                    GeometryReader {
                        let actualSize = $0.size
                        let rect = $0.frame(in: .global)
                        let screenSize = screenProxy.size
                        let safeArea = screenProxy.safeAreaInsets
                        
                        Rectangle()
                            .fill(
                                .linearGradient(
                                    colors: [
                                        Color("C1"),
                                        Color("C2"),
                                        Color("C3"),
                                        Color("C3"),
                                        Color("C4"),
                                        Color("C4"),
                                    ],
                                   startPoint: .top,
                                   endPoint: .bottom
                                )
                            )
                            .mask(alignment: .topLeading, {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(
                                        width: actualSize.width,
                                        height: actualSize.height
                                    )
                                    .offset(
                                        x: rect.minX,
                                        y: rect.minY
                                    )
                            })
                            .offset(
                                x: -rect.minX,
                                y: -rect.minY
                            )
                            .frame(
                                width: screenSize.width,
                                height: screenSize.height + safeArea.top + safeArea.bottom
                            )
                    }
                }
            }
            .frame(
                maxWidth: 250,
                alignment:
                    message.isReplay ?
                            .leading :
                            .trailing
            )
            .frame(
                maxWidth: .infinity,
                alignment: message.isReplay ?
                                   .leading :
                                   .trailing
            )
    }
}

#Preview {
    ContentView()
}
