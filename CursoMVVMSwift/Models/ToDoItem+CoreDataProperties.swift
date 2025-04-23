//
//  ToDoItem+CoreDataProperties.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 22/04/25.
//
//

import Foundation
import CoreData


extension ToDoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoItem> {
        return NSFetchRequest<ToDoItem>(entityName: "ToDoItem")
    }

    @NSManaged public var isArchive: Bool
    @NSManaged public var isFavorite: Bool
    @NSManaged public var date: Date?
    @NSManaged public var note: String?
    @NSManaged public var title: String?
    @NSManaged public var id: String?

}

extension ToDoItem : Identifiable {

}
