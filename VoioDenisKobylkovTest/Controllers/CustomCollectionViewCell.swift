
import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let networkService = NetworkService()
    var response: Response? = nil
    var appMovies: [AppMovie] = []
    var favArray: [AppMovie] = []
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        //button
        self.contentView.addSubview(likeButton)
        likeButton.layer.zPosition = 1
        likeButton.snp.makeConstraints{ make in
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        likeButton.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        //setup cell
        self.contentView.layer.cornerRadius = 16
        self.contentView.clipsToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 4.0
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.drawsAsynchronously = true
        self.layer.masksToBounds = false
        
        // Image setup
        self.contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints{ make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.width.equalTo(contentView)
            make.height.equalTo(contentView)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func likeTapped() {
        if likeButton.tag == 0 {
            likeButton.setImage(UIImage(named: "redheart"), for: .normal)
            likeButton.tag = 1
    

        } else {
            likeButton.setImage(UIImage(named: "heart"), for: .normal)
            likeButton.tag = 0
        }
            
        }
}
