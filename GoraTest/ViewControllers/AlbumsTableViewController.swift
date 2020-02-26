
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
            self?.state = .loaded(data!)
            print(albumArr)
            self?.tableView.reloadData()
        })
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumsTableViewCell
        switch state2 {
        case .loaded(let albumArr):
            cell.albumIdLabel?.text = albumArr[indexPath.row].albumId
        case .loading:
            sleep(1)
        }         
         return cell
     }
    
            
        
    }
    



