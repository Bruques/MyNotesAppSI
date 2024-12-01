//
//  MyNotesListView.swift
//  MY_NOTES_APP_SI
//
//  Created by Bruno Marques on 30/11/24.
//

import SwiftUI
import SwiftData

struct MyNotesListView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var myNotes: [NoteItem]
    @State var search: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 40)
                input
                    .padding(.horizontal)
                listContent
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .top)
            .navigationTitle("Minhas notas")
        }
        
    }
    
    var input: some View {
        HStack(spacing: 16) {
            TextField("Digite aqui", text: $search)
                .font(.headline)
                .padding()
                .border(.black)
            Button {
                newNote()
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
    }
    
    var listContent: some View {
        VStack {
            if myNotes.isEmpty {
                emptyView
                    .padding(.top, 150)
            } else {
                list
            }
        }
    }
    
    var emptyView: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
            Text("Lista vazia")
                .font(.largeTitle)
        }
    }
    
    var list: some View {
        List {
            ForEach(myNotes, id: \.id) { note in
                HStack {
                    Text(note.name)
                    Spacer()
                    Button(action: {
                        note.isCompleted.toggle()
                    }, label: {
                        Image(systemName: note.isCompleted ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                    })
                }
            }
            .onDelete(perform: deleteItem)
        }
    }
    
    private func newNote() {
        let note = NoteItem(name: search, 
                            noteDescription: "",
                            isCompleted: false)
        modelContext.insert(note)
        clearInput()
    }
    
    public func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            let note = myNotes[index]
            modelContext.delete(note)
        }
    }
    
    private func clearInput() {
        search = ""
    }
}

#Preview {
    MyNotesListView()
        .modelContainer(for: NoteItem.self, inMemory: true)
}
