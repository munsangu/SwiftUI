import SwiftUI

struct SlideToConfirm: View {
    @StateObject private var viewModel: SlideToConfirmViewModel
    
    init(
        config: Config,
        onSwiped: @escaping () -> ()
    ) {
        _viewModel = StateObject(wrappedValue: SlideToConfirmViewModel(config: config, onSwiped: onSwiped))
    }

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let knobSize = size.height
            let maxLimit = size.width - knobSize
            let progress: CGFloat = viewModel.isCompleted ? 1 : (viewModel.offsetX / maxLimit)
            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(.gray.opacity(0.25)
                        .shadow(.inner(color: .black.opacity(0.2), radius: 10))
                    )
                
                Capsule()
                    .fill(viewModel.config.tint.gradient)
                    .frame(
                        width: knobSize + (size.width - knobSize) * progress,
                        height: knobSize
                    )
                
                leadingTextView(size, progress: progress)
                
                HStack(spacing: 0) {
                    knobView(
                        size, progress: progress,
                        maxLimit: maxLimit
                    )
                        .zIndex(1)
                    shimmerTextView(
                        size,
                        progress: progress
                    )
                }
            }
        }
        .frame(height: viewModel.isCompleted ? 50 : viewModel.config.height)
        .containerRelativeFrame(.horizontal) { value, _ in
            let ratio: CGFloat = viewModel.isCompleted ? 0.5 : 0.8
            return value * ratio
        }
        .frame(maxWidth: 300)
        .allowsHitTesting(!viewModel.isCompleted)
    }

    private func knobView(
        _ size: CGSize,
        progress: CGFloat,
        maxLimit: CGFloat
    ) -> some View {
        Circle()
            .fill(.background)
            .padding(6)
            .frame(
                width: size.height,
                height: size.height
            )
            .overlay {
                ZStack {
                    Image(systemName: "chevron.right")
                        .opacity(1 - progress)
                        .blur(radius: progress * 10)
                    Image(systemName: "checkmark")
                        .opacity(progress)
                        .blur(radius: (1 - progress) * 10)
                }
                .font(.title3.bold())
            }
            .scaleEffect(viewModel.isCompleted ? 0.6 : 1)
            .offset(x: viewModel.isCompleted ? maxLimit : viewModel.offsetX)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        viewModel.handleDragChange(value, maxLimit: maxLimit)
                    }
                    .onEnded { _ in
                        viewModel.handleDragEnd(maxLimit)
                    }
            )
    }
    
    private func shimmerTextView(
        _ size: CGSize,
        progress: CGFloat
    ) -> some View {
        Text(viewModel.isCompleted ? viewModel.config.confirmationText : viewModel.config.idleText)
            .foregroundStyle(.gray.opacity(0.6))
            .overlay {
                Rectangle()
                    .frame(height: 15)
                    .rotationEffect(.init(degrees: 90))
                    .visualEffect { [animate = viewModel.animateText] content, proxy in
                        content
                            .offset(x: -proxy.size.width / 1.8)
                            .offset(x: animate ? proxy.size.width * 1.2 : 0)
                    }
                    .mask(alignment: .leading) {
                        Text(viewModel.config.idleText)
                    }
                    .blendMode(.softLight)
            }
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding(.trailing, size.height / 2)
            .mask {
                Rectangle().scale(x: 1 - progress, anchor: .trailing)
            }
            .frame(height: size.height)
            .task {
                withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: false)) {
                    viewModel.animateText = true
                }
            }
    }
    
    private func leadingTextView(
        _ size: CGSize,
        progress: CGFloat
    ) -> some View {
        ZStack {
            Text(viewModel.config.onSwipeText)
                .opacity(viewModel.isCompleted ? 0 : 1)
                .blur(radius: viewModel.isCompleted ? 10 : 0)
            Text(viewModel.config.confirmationText)
                .opacity(!viewModel.isCompleted ? 0 : 1)
                .blur(radius: !viewModel.isCompleted ? 10 : 0)
        }
        .fontWeight(.semibold)
        .foregroundStyle(viewModel.config.foregroundColor)
        .frame(maxWidth: .infinity)
        .padding(.trailing, (size.height * (viewModel.isCompleted ? 0.6 : 1)) / 2)
        .mask {
            Rectangle()
                .scale(x: progress, anchor: .leading)
        }
    }
}
