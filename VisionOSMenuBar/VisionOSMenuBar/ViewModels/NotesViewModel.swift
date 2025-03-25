import SwiftUI

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = [Note.sampleNote]
    @Published var selectedNote: Note?
    @Published var isMenuExpanded: Bool = false
    @Published var menuPosition: CGRect = .zero
    
    let menuViewModel = MenuViewModel()
    
    func toggleMenu(isExpanded: Bool) {
        withAnimation(isExpanded ? .smooth : .snappy(duration: 0.3, extraBounce: 0)) {
            isMenuExpanded = isExpanded
        }
    }
    
    func updateMenuPosition(_ position: CGRect) {
        menuPosition = position
    }
    
    func selectNote(_ note: Note) {
        selectedNote = note
    }
    
    func addNote(_ note: Note) {
        notes.append(note)
    }
    
    func deleteNote(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes.remove(at: index)
        }
    }
    
    func updateNote(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
        }
    }
}
