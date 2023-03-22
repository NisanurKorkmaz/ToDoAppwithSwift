//
//  ContentView.swift
//  todo
//
//  Created by Nisanur Korkmaz on 22/03/2023.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    let task: String
}

struct TodoList: View {
    @State var items = [TodoItem]()
    @State var newTask = ""

    
    var body: some View {
        VStack {
            Text("My To-Do List")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
            
            HStack {
                TextField("New task", text: $newTask)
                Button(action: addTask) {
                    Text("Add")
                }
            }.padding()

            List(items) { item in
                HStack {
                    Text(item.task)
                    Spacer()
                    Button(action: { removeTask(item) }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }

    func addTask() {
        if !newTask.isEmpty {
            items.append(TodoItem(task: newTask))
            newTask = ""
        }
    }

    func removeTask(_ item: TodoItem) {
        items.removeAll { $0.id == item.id }
    }
}

struct ContentView: View {
    var body: some View {
        TodoList()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
