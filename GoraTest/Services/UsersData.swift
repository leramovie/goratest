import Foundation

class UsersData{
    
    var userID: Int?
    var name: String?
    var albumID: [Int?]
    var photos: [(url: String, label: String)]
    
    init(userID: Int, name: String, albumID: [Int], photos: [(url: String, label: String)]) {
        self.userID = userID
        self.name = name
        self.albumID = albumID
        self.photos = photos
    }
}
