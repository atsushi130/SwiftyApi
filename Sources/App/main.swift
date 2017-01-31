import Vapor
import VaporMySQL

let drop  = Droplet()
let mysql = try VaporMySQL.Provider(host: "localhost", user: "root", password: "password", database: "default schema")
drop.preparations = [User.self]
drop.addProvider(mysql)

drop.get { request in
    return try drop.view.make("welcome", [
    	"message": drop.localization[request.lang, "welcome", "title"]
    ])
}

drop.get("/users") { request in
    let users = try User.all()
    return try JSON(node: users)
}

drop.get("/users", String.self) { request, id in
    guard let user = try User.find(id) else {
        return try JSON(node: ["status_code": "200", "error": ["message": "user is not found."]])
    }
    
    return user
}

drop.post("/users") { request in
    guard let id = request.json?["id"]?.string else {
        return try JSON(node: ["status_code": "400", "error": ["message": "id parse error."]])
    }
   
    guard let name = request.json?["name"]?.string else {
        return try JSON(node: ["status_code": "400", "error": ["message": "name parse error."]])
    }
    
    return try JSON(node: ["status_code": "200", "success": ["message": "post success."]])
}

drop.resource("posts", PostController())
drop.run()
