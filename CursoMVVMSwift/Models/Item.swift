//
//  Item.swift
//  CursoMVVMSwift
//
//  Created by Julian González on 22/04/25.
//
import Foundation

struct Item: Identifiable, Equatable {
    let id: String = UUID().uuidString
    var title: String
    var note: String?
    var date: Date
    var isCompleted: Bool
    var isArchive: Bool
    var isFavorite: Bool
}
