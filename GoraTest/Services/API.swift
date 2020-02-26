import Foundation

var userData = [UsersData]()
var nameArr = [(id: Int, name: String)]()
var albumArr = [(userId: Int, albumId: Int)]()
var photosArr = [(albumId: Int, url: String, label: String)]()

func requestName(completion: @escaping ([(id: Int, name: String)]?) -> Void){
       
        let url1 = URL(string: "https://jsonplaceholder.typicode.com/users")

        guard let downloadURL = url1 else {return}
       
        let session = URLSession.shared
        session.dataTask(with: downloadURL) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
           
                   do{
                    let namesJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]

                        for item in namesJson {
                            let name = item["name"] as? String
                            let id = item["id"] as? Int
                            nameArr.append((id: id!, name: name!))
        
                        }
                       completion(nameArr)
                       } catch{
                           print(error)
                           completion(nil)
                       }
                   }.resume()
               }

func requestAlbums(userId:Int, completion: @escaping ([(userId: Int, albumId: Int)]?) -> Void) {

    let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userId)/albums")

    guard let downloadURL = url else {return}

    let session = URLSession.shared
    session.dataTask(with: downloadURL) { data, response, error in
        guard let data = data else {
            completion(nil)
            return
            
        }

        do{
            var ids = [Int]()
            let requestAlbums = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
            for item in requestAlbums {
                let userId = item["userId"] as? Int
                let albumId = item["id"] as? Int
                if userId == userId {
                    albumArr.append((userId: userId!, albumId: albumId!))
                    
                }
                completion(albumArr)
            }
        } catch {
            print("JSONSerialization error:", error)
            completion(nil)

        }
    }.resume()
}


func requestPhotos(albumId: Int, completion: @escaping ([(url: String, label: String)]?) -> Void) {

    let url = URL(string: "https://jsonplaceholder.typicode.com/album/\(albumId)/photos")

    guard let downloadURL = url else {return}

    let session = URLSession.shared
    session.dataTask(with: downloadURL) { data, response, error in
        guard let data = data else {
            completion(nil)
            return
        }
        
        do{
            var photosArr = [(url: String, label: String)]()
            let requestPhotos = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                for item in requestPhotos {
                    let photoLabel = item["title"] as? String
                    let photoUrl = item["url"] as? String
                    let id = item["albumId"] as? Int
                    if albumId == id {
                        photosArr.append((url: photoUrl!, label: photoLabel!))
                        
                    }
                    completion(photosArr)
            }
        } catch {
            print("JSONSerialization error:", error)
            completion(nil)
            
        }
        
    }.resume()
    
}




//
//
//final class NetworkService{
//
//    func requestAll(completion: @escaping (_ name: String) -> Void){
//
//               let url1 = URL(string: "https://jsonplaceholder.typicode.com/users")
//
//               guard let downloadURL = url1 else {
//                return
//               }
//
//                let session = URLSession.shared
//                session.dataTask(with: downloadURL) { data, response, error in
//                guard let data = data else {
//                    return
//                }
//                       do{
//                            let namesJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
//
//                            for item in namesJson {
//                                let name = item["name"] as? String
//                                let id = item["id"] as? Int
//                                self.requestAlbums(id: id!) { ids in
//                                    guard let albums = ids else {return}
//
//                                    self.requestPhotos(albumsId: albums) { photosArr in
//                                        guard let photos = photosArr else {return}
//                                        userData.append(UsersData(userID: id!, name: name!, albumID: albums, photos: photos))
//
//                                    }
//                                }
//                            }
//                       } catch{
//                        print(error)
//                    }
//                }.resume()
//        }
//
//
//        private func requestAlbums(id: Int, completion: @escaping ([Int]?) -> Void) {
//
//            let url = URL(string: "https://jsonplaceholder.typicode.com/albums")
//
//            guard let downloadURL = url else {
//                completion(nil)
//                return
//            }
//
//            let session = URLSession.shared
//            session.dataTask(with: downloadURL) { data, response, error in
//                guard let data = data else {
//                    completion(nil)
//                    return
//                }
//
//                do{
//                    var ids = [Int]()
//                    let requestAlbums = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
//                    for item in requestAlbums {
//                        let userId = item["userId"] as? Int
//                        let albumId = item["id"] as? Int
//                        if id == userId {
//                            ids.append(albumId!)
//                        }
//                    }
//                    completion(ids)
//                } catch {
//                    print("JSONSerialization error:", error)
//                    completion(nil)
//                }
//            }.resume()
//        }
//
//        private func requestPhotos(albumsId: [Int], completion: @escaping ([(url: String, label: String)]?) -> Void) {
//
//            let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
//
//            guard let downloadURL = url else {
//                completion([("", "")])
//                return
//            }
//
//            let session = URLSession.shared
//            session.dataTask(with: downloadURL) { data, response, error in
//                       guard let data = data else {
//                            completion([("", "")])
//                            return
//                       }
//                        do{
//                            var photosArr = [(url: String, label: String)]()
//                            let requestPhotos = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
//                            for albumId in albumsId {
//                                for item in requestPhotos {
//                                    let photoLabel = item["title"] as? String
//                                    let photoUrl = item["url"] as? String
//                                    let id = item["albumId"] as? Int
//                                    if albumId == id {
//                                        photosArr.append((url: photoUrl!, label: photoLabel!))
//                                    }
//                                }
//                            }
//                            completion(photosArr)
//                        } catch {
//                                print("JSONSerialization error:", error)
//                                completion([("", "")])
//                        }
//            }.resume()
//        }
//
//
//}
