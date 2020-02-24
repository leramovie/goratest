import Foundation

//Сюда нужно поместить
// userID("id") и name из https://jsonplaceholder.typicode.com/users
// записать массив всех albumId("id") для конкретного userID из https://jsonplaceholder.typicode.com/albums ИХ МНОГО!
// записать для каждого albumID("id") массив "url" и "title" из https://jsonplaceholder.typicode.com/photos
// Итого должна получиться структура или класс:

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
