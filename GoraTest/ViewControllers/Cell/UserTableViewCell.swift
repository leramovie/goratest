import UIKit

class UserTableViewCell: UITableViewCell {
    

    @IBOutlet weak var usernameLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
