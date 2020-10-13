//
//  NewsTableViewCell.swift
//  appvk
//
//  Created by Дарья Шимко on 11.10.2020.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    var avatarImage = UIImageView()
    var heartImage = UIImageView()
    var heardLabel = UILabel()
    var commentImage = UIImageView()
    var commentLabel = UILabel()
    var watchImage = UIImageView()
    var watchLabel = UILabel()
    
    var heardStackView: UIStackView!
    var commentStackView: UIStackView!
    var watchStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
    
        NSLayoutConstraint.activate([
            avatarImage.widthAnchor.constraint(equalTo: avatarImage.heightAnchor),
            avatarImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            
            heardStackView.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 8),
            heardStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            heardStackView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: 10),
            
            commentStackView.centerYAnchor.constraint(equalTo: heardStackView.centerYAnchor, constant: 8),
            commentStackView.leadingAnchor.constraint(equalTo: heardStackView.trailingAnchor, constant: 6),
            
            watchStackView.trailingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 0),
            watchStackView.centerYAnchor.constraint(equalTo: commentStackView.centerYAnchor)
            
        ])
        
        super.updateConstraints()
    
    }
    
    private func setup() {
        
    
        heartImage = UIImageView(image: UIImage(systemName: "heart.fill"))
        commentImage = UIImageView(image: UIImage(systemName: "captions.bubble.fill"))
        watchImage = UIImageView(image: UIImage(systemName: "eye"))
        
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        heardLabel.translatesAutoresizingMaskIntoConstraints = false
        commentImage.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        watchImage.translatesAutoresizingMaskIntoConstraints = false
        watchLabel.translatesAutoresizingMaskIntoConstraints = false
                
        heardStackView = UIStackView(arrangedSubviews: [heartImage, heardLabel])
        commentStackView = UIStackView(arrangedSubviews: [commentImage, commentLabel])
        watchStackView = UIStackView(arrangedSubviews: [watchImage, watchLabel])
        
        heardStackView.axis = .horizontal
        commentStackView.axis = .horizontal
        watchStackView.axis = .horizontal
        
        heardStackView.distribution = .fillEqually
        commentStackView.distribution = .fillEqually
        watchStackView.distribution = .fillEqually
        
        heardStackView.spacing = 0
        commentStackView.spacing = 4
        watchStackView.spacing = 0
        
        heardStackView.translatesAutoresizingMaskIntoConstraints = false
        commentStackView.translatesAutoresizingMaskIntoConstraints = false
        watchStackView.translatesAutoresizingMaskIntoConstraints = false
        
        setNeedsUpdateConstraints()
    }
    
    
}
