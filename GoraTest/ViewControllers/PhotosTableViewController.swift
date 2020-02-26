import UIKit

enum State3 {
    case loading
    case loaded([(url:String, label: String)])
}



class PhotosTableViewController: UITableViewController {
  
    private var state3 = State3.loading

    var albumId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestPhotos(albumId: albumId, completion: {[weak self] data in
            self?.state3 = .loaded(data!)
            print(photosArr)
            self?.tableView.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state3 {
        case .loading:
            sleep(1)
        case .loaded(let data):
            return photosArr.count
        }
        return photosArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoTableViewCell
         switch state3 {
         case .loaded(let albumArr):
             cell.titleOfPhotoLabel?.text = albumArr[indexPath.row].label
             let albumArrUrlImage = albumArr[indexPath.row].url
             //cell.photoImageView?.set(imageURL: albumArrUrlImage)
         case .loading:
             sleep(1)
         }
         return cell
     }
    
}

