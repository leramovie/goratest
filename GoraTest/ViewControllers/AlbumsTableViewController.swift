
import UIKit

enum State2 {
    case loading
    case loaded([(userId: Int, albumId: Int)])
}

class AlbumsTableViewController: UITableViewController {

    
    private var state2 = State2.loading

    var userId: Int!
    var album: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestAlbums(userId: userId, completion: {[weak self] data in
            self?.state2 = .loaded(data!)
            print(albumArr)
            self?.tableView.reloadData()
        })
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state2 {
        case .loading:
            sleep(1)
        case .loaded(let data):
            return albumArr.count
        }
        return albumArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumsTableViewCell
        switch state2 {
        case .loaded(let albumArr):
            var indexAlbumNumber = albumArr[indexPath.row].albumId
            cell.albumIdLabel?.text = String(indexAlbumNumber)
        case .loading:
            sleep(1)
        }         
         return cell
     }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let indexPath = self.tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            let pvc = segue.destination as! PhotosTableViewController
            pvc.albumId = albumArr[selectedRow].albumId
        }
    }
            
        
    }
    



