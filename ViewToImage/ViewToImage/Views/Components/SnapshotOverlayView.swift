import SwiftUI

struct SnapshotOverlayView: View {
    @ObservedObject var viewModel: SnapshotViewModel
    
    var body: some View {
        if let snapshot = viewModel.snapshot, viewModel.showSnapshotOverlay {
            ZStack {
                Rectangle()
                    .fill(Color.black.opacity(0.3))
                    .ignoresSafeArea()
                    .onTapGesture {
                        viewModel.closeSnapshotOverlay()
                    }
                
                Image(uiImage: snapshot)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(15)
            }
        }
    }
}
