import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    ForEach(
                        1...3,
                        id: \.self
                    ) { index in
                        let size = CGSize(
                                            width: 150,
                                            height: 150
                                        )
                        DownsizedImageView(
                            image: UIImage(named: "Pic\(index)"),
                            size: size
                        ) { image in
                            GeometryReader {
                                let size = $0.size
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(
                                        width: size.width,
                                        height: size.height
                                    )
                                    .clipShape(.rect(cornerRadius: 10))
                            }
                            .frame(height: 150)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Downsized Image View")
        }
    }
}

#Preview {
    ContentView()
}
