//
//  ToDoViewModel.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 22/04/25.
//

import Foundation
import CoreData
import Combine

class ToDoViewModel: ObservableObject {
    @Published private(set) var todos: [ToDoItem] = []
    
    //evitar fugas de memorias
    var cancellables = Set<AnyCancellable>()
    var storeContainer: NSPersistentContainer {
        return ToDoPersistenceManager.shared.container
    }
    
    init() {
        fetchToDos()
    }
    
    private func fetchToDos() {
       do {
           let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest()
           let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
           request.sortDescriptors = [sortDescriptor]
           request.returnsObjectsAsFaults = false
           todos = try storeContainer.viewContext.fetch(request)
       } catch {
           print("Error al recuperar datos")
       }
    }
    
    private func saveData() {
        do {
            try storeContainer.viewContext.save()
            fetchToDos()
        }catch {
            print("Error guardando datos")
        }
    }
    
    private func getToDoIndex(_ todo: ToDoItem) -> Int? {
        guard let index = todos.firstIndex(where: {$0.id == todo.id}) else {
            return nil
        }
        return index
    }
    
    private func validateInput(ofText text: String) -> Bool {
        guard text.trimmingCharacters(in: .whitespaces).count > 2 else {
            return false
        }
        return true
    }
    
    public func addToDo() {
        
    }
    
    public func updateToDo() {
        
    }
    
    public func updateStatus() {
        
    }
    
    public func deleteToDo() {
        
    }
    
    public func archiveToDo() {
        
    }
    
    public func unArchiveToDo() {
        
    }
}
