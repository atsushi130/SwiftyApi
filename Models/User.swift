//
//  User.swift
//  SwiftyApi
//
//  Created by 三宅　篤史 on 2017/01/30.
//
//

import Foundation
import Vapor
import Fluent

class User: Model, NodeRepresentable {
    
    var id: Node?
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    public required init(node: Node, in context: Context) throws {
        self.id = try node.extract("id")
        self.name = try node.extract("name")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: ["id": self.id, "name": self.name])
    }
    
    // create table
    static func prepare(_ database: Database) throws {
        try database.create("users") { users in
            users.id()
            users.string("name")
        }
    }
    
    // drop table
    static func revert(_ database: Database) throws {
        try database.delete("users")
    }
}
