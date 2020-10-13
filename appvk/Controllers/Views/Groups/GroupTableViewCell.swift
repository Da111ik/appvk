//
//  GroupTableViewCell.swift
//  appvk
//
//  Created by Дарья Шимко on 10.10.2020.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    var imageGroup = UIImageView()
    var nameGroup = UILabel()
    
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
        
//            imageGroup.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            imageGroup.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameGroup.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameGroup.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            nameGroup.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor)
        ])
        
        super.updateConstraints()
    }
    
    private func setup() {
        
        imageGroup.translatesAutoresizingMaskIntoConstraints = false
        nameGroup.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageGroup)
        contentView.addSubview(nameGroup)
        
        setNeedsUpdateConstraints()
        
    }
    
    func config(_ name: String, image: UIImage) {
        
        nameGroup.text = name
        imageGroup = UIImageView(image: image, highlightedImage: nil)
        
    }
}
