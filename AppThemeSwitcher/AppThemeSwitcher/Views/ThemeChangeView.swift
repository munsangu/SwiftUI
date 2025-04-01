import SwiftUI

struct ThemeChangeView: View {
    @ObservedObject var viewModel: ThemeViewModel
    var scheme: ColorScheme
    @Namespace private var animation
    @State private var circleOffset: CGSize
    
    init(viewModel: ThemeViewModel, scheme: ColorScheme) {
        self.viewModel = viewModel
        self.scheme = scheme
        self._circleOffset = .init(initialValue: viewModel.getCircleOffset(for: scheme))
    }
    
    var body: some View {
        VStack(spacing: 15) {
            themeCircleView
            titleView
            descriptionView
            themeSelectorView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 410)
        .background(.themeBG)
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 15)
        .environment(\.colorScheme, scheme)
        .onChange(of: scheme, initial: false) { _, newValue in
            withAnimation(.bouncy) {
                circleOffset = viewModel.getCircleOffset(for: newValue)
            }
        }
    }
    
    private var themeCircleView: some View {
        Circle()
            .fill(viewModel.getThemeColor(for: scheme).gradient)
            .frame(width: 150, height: 150)
            .mask {
                Rectangle()
                    .overlay {
                        Circle()
                            .offset(circleOffset)
                            .blendMode(.destinationOut)
                    }
            }
    }
    
    private var titleView: some View {
        Text("Choose a Style")
            .font(.title2.bold())
            .padding(.top, 25)
    }
    
    private var descriptionView: some View {
        Text("Pop or subtle, Day or night. \nCustomize your interface.")
            .multilineTextAlignment(.center)
    }
    
    private var themeSelectorView: some View {
        HStack(spacing: 0) {
            ForEach(Theme.allCases, id: \.rawValue) { theme in
                themeButton(for: theme)
            }
        }
        .padding(3)
        .background(.primary.opacity(0.06), in: .capsule)
        .padding(.top, 20)
    }
    
    private func themeButton(for theme: Theme) -> some View {
        Text(theme.rawValue)
            .padding(.vertical, 10)
            .frame(width: 100)
            .background {
                ZStack {
                    if viewModel.userTheme == theme {
                        Capsule()
                            .fill(.themeBG)
                            .matchedGeometryEffect(id: "ACTIVETAP", in: animation)
                    }
                }
                .animation(.snappy, value: viewModel.userTheme)
            }
            .contentShape(.rect)
            .onTapGesture {
                viewModel.selectTheme(theme)
            }
    }
}

#Preview {
    ThemeChangeView(viewModel: ThemeViewModel(), scheme: .light)
}
