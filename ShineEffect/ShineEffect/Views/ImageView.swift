import SwiftUI

struct ImageView: View {
    @ObservedObject var viewModel: ShineViewModel
    
    var body: some View {
        Image(.pic)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
                width: 200,
                height: 200
            )
            .shine(
                viewModel.isShining,
                duration: viewModel.shineModel.duration,
                clipShape: .rect(cornerRadius: 20),
                rightToLeft: viewModel.shineModel.rightToLeft
            )
            .onTapGesture {
                viewModel.toggleShine()
            }
    }
}
