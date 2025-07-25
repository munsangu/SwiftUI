import SwiftUI

struct Example2View: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ResizableHeaderScrollView(
            minimumHeight: 70,
            maximumHeight: 200,
            ignoreSafeAreaTop: true,
            isSticky: false
        ) { progress, safeArea in
            HeaderView(progress)
        } content: {
            VStack(spacing: 15) {
                VStack(spacing: 10) {
                    VStack(spacing: 6) {
                        Text("Install to +")
                            .foregroundStyle(.white)
                        
                        Text("XBox Series X|S")
                            .font(.caption)
                            .foregroundStyle(.white.secondary)
                    }
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(
                        Color(UIColor.systemGreen),
                        in: .rect(cornerRadius: 10)
                    )
                    
                    HStack(spacing: 10) {
                        Button {
                            
                        } label: {
                            VStack(spacing: 6) {
                                Text("Buy")
                                    .foregroundStyle(.white)
                                
                                Text("Some Amount...")
                                    .font(.caption)
                                    .foregroundStyle(.orange)
                            }
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(
                                .gray.opacity(0.2),
                                in: .rect(cornerRadius: 10)
                            )
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .frame(
                                    width: 80,
                                    height: 60
                                )
                                .background(
                                    .gray.opacity(0.2),
                                    in: .rect(cornerRadius: 10)
                                )
                        }
                    }
                }
                
                DummyContent()
            }
            .padding(15)
        }
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    func HeaderView(_ progress: CGFloat) -> some View {
        VStack(
            alignment: .leading,
            spacing: 15)
        {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .frame(
                        width: 35,
                        height: 35
                    )
                    .background(
                        .bar,
                        in: .rect(cornerRadius: 10)
                    )
            }
            .offset(y: 58 * progress)
            
            HStack(spacing: 12) {
                let size: CGFloat = 120 - (progress * 80)
                
                Image(.header)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: size,
                        height: size
                    )
                    .clipShape(.rect(cornerRadius: 10))
                
                VStack(
                    alignment: .leading,
                    spacing: 6
                ) {
                    Text("Ironman")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("Marvel CO., LTD.")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
                .compositingGroup()
                .scaleEffect(
                    1 - (0.2 * progress),
                    anchor: .leading
                )
            }
            .offset(x: 45 * progress)
        }
        .padding(
            .horizontal,
            15
        )
        .padding(
            .vertical,
            10
        )
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .bottomLeading
        )
        .background {
            let opacity = (progress - 0.7) / 0.3
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(opacity)
        }
    }
}

#Preview {
    Example2View()
}
