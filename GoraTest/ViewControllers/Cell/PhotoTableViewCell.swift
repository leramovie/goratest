import UIKit


class PhotoTableViewCell: UITableViewCell {
        
    var titleText: String!
    var imageURL: String!
    
    
    @IBOutlet weak var photoImageView: WebImageView!
    @IBOutlet weak var titleOfPhotoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        let myCell = UITableViewCell()

        myCell.layer.cornerRadius = 10
        myCell.layer.masksToBounds = true
        myCell.layer.shadowOpacity = 1
        myCell.layer.shadowOffset = CGSize(width: 0, height: 5)
        myCell.layer.shadowRadius = 10
    }

       
    
}
    
    

