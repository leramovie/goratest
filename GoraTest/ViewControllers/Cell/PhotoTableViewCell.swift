import UIKit


class PhotoTableViewCell: UITableViewCell {
        
    var titleText: String!
    var imageURL: String!
    
    
    @IBOutlet weak var photoImageView: WebImageView!
    @IBOutlet weak var titleOfPhotoLabel: UILabel!

    @IBOutlet weak var photoLoadingIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state

    }

       
    
}
    
    

