//
//  ContentView.swift
//  ToDoList
//
//  Created by Abyl on 4/1/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems: FetchedResults<ToDoItem>
    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Next task")){
                    HStack{
                        TextField("New item", text: self.$newTodoItem)
                        Button(action: {
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            
                            toDoItem.title = self.newTodoItem
                            //toDoItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            self.newTodoItem = ""
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("Tasks")){
                    ForEach(self.toDoItems) { todoItem in
                        ToDoItemView(title: todoItem.title!/*, createdAt: "\(todoItem.createdAt!)"*/)
                    }.onDelete { indexSet in
                        let deleteItem = self.toDoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("To Do List"))
            .navigationBarItems(trailing: EditButton())
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
