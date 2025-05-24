import SwiftUI

struct MenuActionView: View {
    var config: MenuConfig
    var action: MenuAction
    var animateContent: Bool
    var animateLabels: Bool
    var body: some View {
        let sourceLocation = config.sourceLocation
        
        HStack(spacing: 20) {
            Image(systemName: action.symbolImage)
                .font(.title3)
                .frame(
                    width: 40,
                    height: 40
                )
                .background {
                    Circle()
                        .fill(.background)
                        .shadow(radius: 1.5)
                }
                .scaleEffect(animateContent ? 1 : 0.6)
                .opacity(animateContent ? 1 : 0)
                .blur(radius: animateContent ? 0 : 4)
            
            Text(action.text)
                .font(.system(size: 19))
                .fontWeight(.medium)
                .lineLimit(1)
                .opacity(animateLabels ? 1 : 0)
                .blur(radius: animateLabels ? 0 : 4)
        }
        .visualEffect({ [animateContent] content, proxy in
            content
                .offset(
                    x: animateContent ? 0 : sourceLocation.minX - proxy.frame(in: .global).minX,
                    y: animateContent ? 0 : sourceLocation.minY - proxy.frame(in: .global).minY,
                )
        })
        .frame(height: 70)
        .contentShape(.rect)
        .onTapGesture {
            action.action()
        }
    }
}
