import SwiftUI

#if os(iOS)
struct BlurView: View {
    var body: some View {
        Text("iOS View")
    }
}
#else
struct BlurView: View {
    var body: some View {
        Text("macOS View")
    }
}
#endif


