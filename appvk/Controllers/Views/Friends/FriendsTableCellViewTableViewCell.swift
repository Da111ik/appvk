//
//  FriendsTableCellViewTableViewCell.swift
//  appvk
//
//  Created by Дарья Шимко on 10.10.2020.
//

import UIKit

class FriendsTableCellViewTableViewCell: UITableViewCell {

    var avatarImage = UIImageView()
    var avatarView = AvatarView()
    var nameFriend = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAvatarImage(_:)))
        avatarImage.isUserInteractionEnabled = true
        avatarImage.addGestureRecognizer(tapGesture)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    override func updateConstraints() {
        
        
        NSLayoutConstraint.activate([
            nameFriend.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameFriend.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameFriend.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor),
            
            avatarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            avatarView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: 40),
            avatarView.widthAnchor.constraint(equalToConstant: 46),

//            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
//            avatarImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            avatarImage.heightAnchor.constraint(equalToConstant: 40),
//            avatarImage.widthAnchor.constraint(equalToConstant: 40)
            
        ])
        
        super.updateConstraints()
    }
    
    
    func setup() {
       
        nameFriend.translatesAutoresizingMaskIntoConstraints = false
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameFriend)
        contentView.addSubview(avatarView)
        contentView.addSubview(avatarImage)

        setNeedsUpdateConstraints()
    
    }
    
    func config(_ avatarImage: UIImage, name: String) {
        
        self.avatarImage = UIImageView(image: avatarImage)
        nameFriend.text = name
        
    }
    
    @objc func tapAvatarImage(_ sender: UITapGestureRecognizer) {
      
        UIView.animate(withDuration: 2, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.avatarImage.bounds = CGRect(x: 0, y: 0, width: self.avatarImage.bounds.width - 4, height: self.avatarImage.bounds.height - 4)
        })
        

    }
}
