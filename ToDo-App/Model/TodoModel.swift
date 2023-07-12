//
//  TodoModel.swift
//  ToDo-App
//
//  Created by Bahittin on 12.07.2023.
//

import Foundation
struct TodoModel: Codable {
    var taskName: String
    var status: Int
    var priorty: Int
}
