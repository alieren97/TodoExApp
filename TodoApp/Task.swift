//
//  Task.swift
//  TodoApp
//
//  Created by Ali Eren on 16.01.2022.
//

import Foundation
import RealmSwift

class Task : Object,ObjectKeyIdentifiable {
    @Persisted(primaryKey :true) var id : ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
