import Foundation

var nameArr = [(id: Int, name: String)]()
var albomIDArr = [Int]()
var photosArr = [(url: String, label: String)]()

func downloadJSON(){
    
}


func requestName(){
       
       let url1 = URL(string: "https://jsonplaceholder.typicode.com/users")

       guard let downloadURL = url1 else {return}
       
       let session = URLSession.shared
       session.dataTask(with: downloadURL) { data, response, error in
                  guard let data = data else {return}
           
                   do{
                    let namesJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]

                        for item in namesJson {
                            let name = item["name"] as? String
                            let id = item["id"] as? Int
                            let albomsId = reuestAlboms(id: id!)
                            let photos = reuestPhotos(albomsId: albomsId)
                            nameArr.append((id: id!, name: name!))
                        }
                       
                       } catch{
                           print(error)
                       }
                   }.resume()
               }


func requestAlboms(id: Int) -> [Int] {

    let url = URL(string: "https://jsonplaceholder.typicode.com/albums")

    guard let downloadURL = url else { return [] }
    
    let session = URLSession.shared
    session.dataTask(with: downloadURL) { data, response, error in
               guard let data = data else {return}
        
                do{
                 let requestAlboms = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                    for item in requestAlboms {
                        let userId = item["userId"] as? Int
                        let albomId = item["id"] as? Int
                        if id == userId {
                            albomIDArr.append(albomId!)
                        }
                    }
                } catch {
                        print("JSONSerialization error:", error)
                }
    }
    return albomIDArr
}

func requestPhotos(albomsId: [Int]) -> [(url: String, label: String)] {

    let url = URL(string: "https://jsonplaceholder.typicode.com/photos")

    guard let downloadURL = url else { return [(url: "", label: "")] }
    
    let session = URLSession.shared
    session.dataTask(with: downloadURL) { data, response, error in
               guard let data = data else {return}
                do{
                 let requestPhotos = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                    for albomId in albomsId {
                        for item in requestPhotos {
                            let photoLabel = item["title"] as? String
                            let photoUrl = item["url"] as? String
                            let id = item["albumId"] as? Int
                            if albomId == id {
                                photosArr.append((url: photoUrl!, label: photoLabel!))
                            }
                        }
                    }
                } catch {
                        print("JSONSerialization error:", error)
                }
    }
    return photosArr
}

func parseData() {
    for item in nameArr {
        requestAlboms(id: item.id)
        for albumId in albomIDArr {
            requestPhotos(albomsId: [albumId])
        }
    }

}
