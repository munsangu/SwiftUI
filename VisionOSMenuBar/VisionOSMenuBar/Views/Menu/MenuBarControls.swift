import SwiftUI

struct MenuBarControls: View {
    @ObservedObject var viewModel: MenuViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 15) {
                ForEach(viewModel.topMenuItems) { item in
                    Button {
                        viewModel.handleAction(for: item)
                    } label: {
                        Image(systemName: item.iconName)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding(
                                .vertical,
                                12
                            )
                    }
                }
            }
            
            Rectangle()
                .fill(.black.opacity(0.1))
                .frame(height: 1)
            
            ForEach(viewModel.mainMenuItems) { item in
                CustomButton(
                    title: item.title,
                    image: item.iconName
                ) {
                    viewModel.handleAction(for: item)
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    MenuBarControls(viewModel: MenuViewModel())
}
