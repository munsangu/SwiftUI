import SwiftUI

struct MemoryBoxView: View {
    let box: ObjectBox
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            Text(box.name)
                .font(.headline)
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(
                    color,
                    lineWidth: 3
                )
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color.opacity(0.2))
                )
                .frame(
                    width: 150,
                    height: 100
                )
                .overlay(
                    VStack(spacing: 4) {
                        Text("Value: \(box.value)")
                        
                        Text("Memory: \(box.kind == .structType ? "Stack" : "Heap")")
                    }
                    .foregroundColor(.black)
                )
        }
    }
}
