import SwiftUI

struct FloatingButtonView<Label: View>: View {
    @StateObject private var viewModel: FloatingButtonViewModel
    @GestureState private var isDragging: Bool = false
    private var label: (Bool) -> Label
    
    init(
        buttonSize: CGFloat = 50,
        @FloatingActionBuilder actions: @escaping () -> [FloatingActionModel],
        @ViewBuilder label: @escaping (Bool) -> Label
    ) {
        self._viewModel = StateObject(
            wrappedValue: FloatingButtonViewModel(
                buttonSize: buttonSize,
                actions: actions
            )
        )
        self.label = label
    }

    var body: some View {
        Button {
            viewModel.toggleExpanded()
        } label: {
            label(viewModel.isExpanded)
                .frame(
                    width: viewModel.buttonSize,
                    height: viewModel.buttonSize
                )
                .contentShape(.rect)
        }
        .buttonStyle(NoAnimationButtonStyle())
        .simultaneousGesture(longPressDragGesture)
        .background {
            actionsContainerView
        }
        .coordinateSpace(.named(Constants.coordinateSpaceName))
        .animation(
            .snappy(
                duration: 0.4,
                extraBounce: 0
            ),
            value: viewModel.isExpanded
        )
    }
    
    private var longPressDragGesture: some Gesture {
        LongPressGesture(minimumDuration: Constants.longPressMinimumDuration)
            .onEnded { _ in
                viewModel.isExpanded = true
            }
            .sequenced(
                before: DragGesture()
                    .updating(
                        $isDragging,
                        body: { _, out, _ in
                            out = true
                        }
                    )
                    .onChanged { value in
                        viewModel.handleDragChange(location: value.location)
                    }
                    .onEnded { _ in
                        viewModel.handleDragEnded()
                    }
            )
    }
    
    private var actionsContainerView: some View {
        ZStack {
            ForEach(viewModel.actions) { action in
                ActionButtonView(action: action, viewModel: viewModel)
            }
        }
        .frame(
            width: viewModel.buttonSize,
            height: viewModel.buttonSize
        )
    }
}

private struct ActionButtonView: View {
    let action: FloatingActionModel
    @ObservedObject var viewModel: FloatingButtonViewModel

    var body: some View {
        Button {
            viewModel.executeAction(action)
        } label: {
            Image(systemName: action.symbol)
                .font(action.font)
                .foregroundStyle(action.tint)
                .frame(
                    width: viewModel.buttonSize,
                    height: viewModel.buttonSize
                )
                .background(
                    action.background,
                    in: .circle
                )
                .contentShape(.circle)
        }
        .buttonStyle(PressableButtonStyle())
        .disabled(!viewModel.isExpanded)
        .animation(
            .snappy(
                duration: 0.3,
                extraBounce: 0
            )) { content in
                content
                    .scaleEffect(viewModel.selectedAction?.id == action.id ? 1.15 : 1)
            }
        .background {
            actionPositionDetector
        }
        .rotationEffect(.init(degrees: viewModel.progress(action) * -90))
        .offset(x: viewModel.isExpanded ? -viewModel.actionOffset / 2 : 0)
        .rotationEffect(.init(degrees: viewModel.progress(action) * 90))
    }
    
    private var actionPositionDetector: some View {
        GeometryReader {
            let rect = $0.frame(in: .named(Constants.coordinateSpaceName))
            Color.clear
                .onChange(of: viewModel.dragLocation) { oldValue, newValue in
                    viewModel.checkAndSelectAction(
                        actionId: action.id,
                        containsPoint: rect.contains(newValue)
                    )
                }
        }
    }
}

struct NoAnimationButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(
                .snappy(
                    duration: 0.3,
                    extraBounce: 0
                ),
                value: configuration.isPressed
            )
    }
}

private enum Constants {
    static let coordinateSpaceName = "FLOATING_VIEW"
    static let longPressMinimumDuration: TimeInterval = 0.3
}
