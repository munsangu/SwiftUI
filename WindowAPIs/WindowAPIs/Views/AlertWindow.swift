import SwiftUI

struct AlertWindow: View {
    @State private var showAlert: Bool = false
    @Environment(\.dismissWindow) private var dismissWindow
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(.ultraThinMaterial)
            
            VStack(spacing: 10) {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundStyle(.primary.secondary)
                
                Text("Saved Successfully")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
        }
        .frame(
            width: 200,
            height: 200
        )
        .opacity(showAlert ? 1 : 0)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.25)) {
                showAlert = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(
                    .easeInOut(duration: 0.25),
                    completionCriteria: .logicallyComplete
                ) {
                    showAlert = false
                } completion: {
                    dismissWindow()
                }
            }
        }
    }
}

#Preview {
    AlertWindow()
}
