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
                .foregroundColor(Color.red.opacity(0.7))
            
            HStack {
                TextField("New task", text: $newTask)
                    .padding(.all)
                    .background(Color.pink.opacity(0.4))
                    .cornerRadius(25)
                    .accentColor(.red)
                Button(action: addTask) {
                    Text("Add")
                        .foregroundColor(Color.red.opacity(0.7))
                }
                
            }
                .padding()
            
            VStack{
                List(items) { item in
                    HStack {
                        Text(item.task)
                            .foregroundColor(Color.red)
                        Spacer()
                        Button(action: { removeTask(item) }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
                
            }
        }
        .background(Color.red.opacity(0.3))
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
