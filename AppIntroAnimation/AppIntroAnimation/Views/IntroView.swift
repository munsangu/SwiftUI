import SwiftUI

struct IntroView: View {
    @ObservedObject var viewModel: IntroViewModel
    let size: CGSize
    
    var body: some View {
        if let activeIntro = viewModel.activeIntro {
            Rectangle()
                .fill(activeIntro.bgColor)
                .padding(
                    .bottom,
                    -30
                )
                .overlay {
                    Circle()
                        .fill(activeIntro.circleColor)
                        .frame(
                            width: 38,
                            height: 38
                        )
                        .background(alignment: .leading) {
                            Capsule()
                                .fill(activeIntro.bgColor)
                                .frame(width: size.width)
                        }
                        .background(alignment: .leading) {
                            Text(activeIntro.text)
                                .font(.largeTitle)
                                .foregroundStyle(activeIntro.textColor)
                                .frame(width: viewModel.textSize(activeIntro.text))
                                .offset(x: 10)
                                .offset(x: activeIntro.textOffset)
                        }
                        .offset(x: -activeIntro.circleOffset)
                }
        } else {
            Rectangle()
                .fill(Color.black.opacity(0.8))
        }
    }
}

#Preview {
    GeometryReader { geometry in
        let viewModel = IntroViewModel()
        IntroView(viewModel: viewModel, size: geometry.size)
            .onAppear {
                viewModel.startAnimation()
            }
    }
}
