import UIKit

enum State3 {
    case loading
    case loaded([(photoUrl: String, photoLabel: String, photoId: Int)])
}



class PhotosTableViewController: UITableViewController {
  
    let photoTableViewCell = PhotoTableViewCell()
 
    private var state3 = State3.loading

    var albumId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestPhotos(albumId: albumId, completion: {[weak self] data in
            guard let data = data else {return}
            self?.state3 = .loaded(data)
            print(photosArr)
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 500
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state3 {
        case .loading:
            
            return 0
        case .loaded(let data):
            return photosArr.count
        }
        return photosArr.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoTableViewCell
   
        cell.photoLoadingIndicator?.startAnimating()

        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)
        cell.layer.shadowRadius = 10
        
         switch state3 {
         case .loaded(let albumArr):
  
            
            cell.titleOfPhotoLabel?.text = albumArr[indexPath.row].photoLabel
             let albumArrUrlImage = albumArr[indexPath.row].photoUrl
             cell.photoImageView?.set(imageURL: albumArrUrlImage)
             //cell.photoLoadingIndicator?.stopAnimating()

         case .loading:
            cell.photoLoadingIndicator?.startAnimating()
         }
         return cell
     }
    
}

