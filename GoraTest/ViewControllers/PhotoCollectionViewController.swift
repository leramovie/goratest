
import UIKit

enum State3 {
    case loading
    case loaded([(photoUrl: String, photoLabel: String, photoId: Int)])
}

let reuseIdentifier = "photoCell"


class PhotoCollectionViewController: UICollectionViewController {

    var albumId: Int!
    
    private var state3 = State3.loading

    override func viewDidLoad() {
        super.viewDidLoad()

        requestPhotos(albumId: albumId, completion: {[weak self] data in
            guard let data = data else {return}
            self?.state3 = .loaded(data)
            print(photosArr)
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        })
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowRadius = 10
 
        cell.photoActivityIndicator.startAnimating()

           switch state3 {
           case .loaded(let albumArr):
    
            DispatchQueue.main.async {
                cell.titleLabel?.text = albumArr[indexPath.row].photoLabel
                let albumArrUrlImage = albumArr[indexPath.row].photoUrl
                cell.photoImage?.set(imageURL: albumArrUrlImage)
            }

           case .loading:
              sleep (1)
           }
           return cell
    }

}
