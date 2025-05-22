import SwiftUI

struct TaskRowView: View {
    var isEmpty: Bool = false
    var body: some View {
        Group {
            if isEmpty {
                VStack(spacing: 8) {
                    Text("No Task's Found on this Day!")
                    
                    Text("Try Adding some New Tasks!")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
                .frame(height: 100)
                .frame(maxWidth: .infinity)
            } else {
                VStack(
                    alignment: .leading,
                    spacing: 8
                ) {
                    Circle()
                        .fill(.red)
                        .frame(
                            width: 5,
                            height: 5
                        )
                    
                    Text("Some Random Task")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                    
                    HStack {
                        Text("16:00 - 17:00")
                        
                        Spacer(minLength: 0)
                        
                        Text("Some place, Seoul")
                    }
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(
                        .top,
                        5
                    )
                }
                .lineLimit(1)
                .padding(15)
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
                .shadow(
                    color: .black.opacity(0.35),
                    radius: 1
                )
        }
    }
}

#Preview {
    TaskRowView()
}
