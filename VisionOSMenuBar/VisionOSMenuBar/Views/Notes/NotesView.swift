import SwiftUI

struct NotesView: View {
    @StateObject private var viewModel = NotesViewModel()
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack(spacing: 10) {
            headerView
            
            NoteCardView()
            
            Spacer(minLength: 0)
        }
        .overlay(alignment: .topLeading) {
            menuOverlay
        }
    }
    
    private var menuOverlay: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .foregroundStyle(.clear)
                .contentShape(.rect)
                .onTapGesture {
                    viewModel.toggleMenu(isExpanded: false)
                }
                .allowsHitTesting(viewModel.isMenuExpanded)
            
            ZStack {
                if viewModel.isMenuExpanded {
                    VisionOSStyleView {
                        MenuBarControls(viewModel: viewModel.menuViewModel)
                            .frame(
                                width: Constants.Menu.width,
                                height: Constants.Menu.height
                            )
                    }
                    .transition(.blurReplace)
                }
            }
            .offset(
                x: viewModel.menuPosition.minX - Constants.Menu.width + viewModel.menuPosition.width,
                y: viewModel.menuPosition.maxY + Constants.Menu.offsetY
            )
        }
        .ignoresSafeArea()
    }
    
    private var headerView: some View {
        HStack {
            Text("Notes")
                .font(.largeTitle.bold())
            
            Spacer(minLength: 0)
            
            Button {
                viewModel.toggleMenu(isExpanded: true)
            } label: {
                Image(systemName: "ellipsis")
                    .font(.title3)
                    .foregroundStyle(
                        viewModel.isMenuExpanded ?
                        colorScheme.currentColor :
                        .black
                    )
                    .frame(
                        width: Constants.Header.buttonSize,
                        height: Constants.Header.buttonSize)
                    .background {
                        ZStack {
                            Rectangle()
                                .fill(.ultraThinMaterial)
                            
                            Rectangle()
                                .fill(.black.opacity(viewModel.isMenuExpanded ? 1 : 0.03))
                        }
                        .clipShape(.circle)
                    }
            }
            .onGeometryChange(for: CGRect.self) {
                $0.frame(in: .global)
            } action: { newValue in
                viewModel.updateMenuPosition(newValue)
            }
        }
        .padding(Constants.padding)
    }
}

#Preview {
    NotesView()
}
