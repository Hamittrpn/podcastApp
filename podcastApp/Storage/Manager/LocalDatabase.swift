//
//  LocalDatabase.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 10.12.2024.
//

import RealmSwift

protocol LocalDatabaseProtocol {
    func add<T: Object>(model: T)
    func clearAll<T: Object>(model: T.Type)
    func items<T: Object>() -> [T]
    func delete<T: Object>(model: T)
    func deleteFromId<T: Object>(model: T.Type, id: String)
    func listenChanges<T: Object>(model: T.Type, result: @escaping (LocalDatabaseUpdate, [Int]) -> Void)
}

enum LocalDatabaseUpdate{
    case delete
    case insert
    case modify
}
