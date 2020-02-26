import UIKit

enum State {
    case loading
    case loaded([(id: Int, name: String)])
}

class TableViewController: UITableViewController {

    private var state = State.loading

    
    override func viewDidLoad() {
        super.viewDidLoad()

        requestName(completion: {[weak self] data in
            self?.state = .loaded(data!)
            print(nameArr)
            self?.tableView.reloadData()
        })
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch state {
            case .loading:
                sleep(1)
            case .loaded(let data):
                return nameArr.count
            }
            return nameArr.count
        }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserNameCell", for: indexPath) as! UserTableViewCell
        switch state {
        case .loaded(let nameArr):
            cell.usernameLabel?.text =  nameArr[indexPath.row].name
        case .loading:
            sleep(1)
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let indexPath = self.tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            let dvc = segue.destination as! AlbumsTableViewController
      //      dvc.id = self.nameArr[indexPath.row].userId
        }
    }
}



