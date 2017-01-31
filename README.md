# Description
Sample API with Swift.

## Vapor
```
$ curl -sL check.vapor.sh | bash
Compatible
$ curl -sL toolbox.vapor.sh | bash
Compatible
Downloading...
Compiling...
Installing...
Vapor Toolbox v1.0.3 Installed
```

## Setup

- build
```
$ swift build -Xswiftc -I/usr/local/include/mysql -Xlinker -L/usr/local/lib
Linking CLibreSSL
Compile Swift Module 'TurnstileCrypto' (3 sources)
Compile Swift Module 'Jay' (21 sources)
Compile Swift Module 'SocksCore' (15 sources)
Compile Swift Module 'Polymorphic' (2 sources)
Compile Swift Module 'PathIndexable' (2 sources)
Compile Swift Module 'libc' (1 sources)
Compile Swift Module 'Core' (28 sources)
Compile Swift Module 'Node' (22 sources)
Compile Swift Module 'Socks' (5 sources)
Compile Swift Module 'Fluent' (35 sources)
Compile Swift Module 'Essentials' (2 sources)
Compile Swift Module 'TLS' (7 sources)
Compile Swift Module 'Console' (34 sources)
Compile Swift Module 'Leaf' (34 sources)
Compile Swift Module 'JSON' (8 sources)
Compile Swift Module 'Cipher' (2 sources)
Compile Swift Module 'Random' (3 sources)
Compile Swift Module 'Turnstile' (13 sources)
Compile Swift Module 'MySQL' (11 sources)
Compile Swift Module 'BCrypt' (1 sources)
Compile Swift Module 'Hash' (3 sources)
Compile Swift Module 'HMAC' (2 sources)
Compile Swift Module 'TurnstileWeb' (8 sources)
Compile Swift Module 'FluentTester' (8 sources)
Compile Swift Module 'Transport' (9 sources)
Compile Swift Module 'URI' (10 sources)
Compile Swift Module 'FluentMySQL' (3 sources)
Compile Swift Module 'HTTP' (38 sources)
Compile Swift Module 'SMTP' (21 sources)
Compile Swift Module 'WebSockets' (14 sources)
Compile Swift Module 'Routing' (9 sources)
Compile Swift Module 'HTTPRouting' (5 sources)
Compile Swift Module 'TypeSafeRouting' (3 sources)
Compile Swift Module 'Cache' (3 sources)
Compile Swift Module 'Cookies' (11 sources)
Compile Swift Module 'Settings' (10 sources)
Compile Swift Module 'Auth' (15 sources)
Compile Swift Module 'Sessions' (6 sources)
Compile Swift Module 'Vapor' (90 sources)
Compile Swift Module 'VaporMySQL' (1 sources)
Compile Swift Module 'App' (3 sources)
Linking ./.build/debug/App
```

- generate xcodeproj
```
$ swift package generate-xcodeproj
generated: ./SwiftyApi.xcodeproj
```
 
- mysql
```
$ vapor build --mysql
Fetching Dependencies [Done]
Building Project [Done]
$ vapor xcode --mysql
Fetching Dependencies [Done]
Generating Xcode Project [Done]
Select the `App` scheme to run.
Open Xcode project?
y/n>y
Opening Xcode project...
```

## Database
```[main.swift]
let mysql = try VaporMySQL.Provider(host: "localhost", user: "root", password: "password", database: "default schema")
```

## 📖 Documentation

<table>
<tr><th>Endpoint</th><th>Method</th><th>Request</th><th>Response</th></tr>
<tr>
<td>
/users
</td>
<td>
GET
</td>
<td>
-
</td>
<td>
<pre lang="json">
[
    {
        "id": Int,
        "name": String
    }
]
</pre>
</td>
</tr>
<tr>
<td>
/users/:id
</td>
<td>
GET
</td>
<td>
-
</td>
<td>
<pre lang="json">
{
    "id": Int,
    "name": String
}
</pre>
</td>
</tr>
<tr>
<td>
/users
</td>
<td>
POST
</td>
<td>
<pre lang="json">
{
    "id": Int,
    "name": String
}
</pre>
</td>
<td>
<pre lang="json">
{
    "status_code": 200,
    "error": {
        "message": String
    }
}
</pre>
</td>
</tr>
</table>
