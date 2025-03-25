import SwiftUI

struct NoteDetailView: View {
    let note: Note
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 5
        ) {
            if let imageName = note.imageNamed {
                GeometryReader { geometry in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height
                        )
                        .clipped()
                }
                .frame(height: Constants.DummyContent.imageHeight)
            }
            
            VStack(
                alignment: .leading,
                spacing: 12
            ) {
                Text(note.title)
                    .font(.title.bold())
                
                Text(note.content)
                    .font(.body)
                    .foregroundStyle(.secondary)
                
                HStack {
                    if note.isPinned {
                        Image(systemName: "pin.fill")
                            .foregroundStyle(.blue)
                    }
                    
                    if note.isLocked {
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.blue)
                    }
                    
                    Spacer()
                    
                    Text(note.dateCreated, style: .date)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 8)
            }
            .padding(Constants.padding)
        }
    }
}

#Preview {
    NoteDetailView(note: Note.sampleNote)
}
