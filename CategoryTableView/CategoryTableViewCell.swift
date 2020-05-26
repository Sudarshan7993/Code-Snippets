/*

------------------------------------------------------------------------
|                  CategoryTableViewCell.swift                         |
|  CategoryTableViewCell is a custom TableView Cell for mainTableView  |
|  This cell contains a title Label & a SubTitle Label to display data |
|  You can modify the cell according to your requirement.              |
|______________________________________________________________________|

*/

import UIKit

class CategoryTableViewCell:UITableViewCell{
    
    /* Configure the view when subCategory is set through
       tableView: UITableView, cellForRowAt indexPath: IndexPath method
     */
    var subCategory:SubCategory!{
        didSet{
            configureView()
        }
    }
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let subTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    fileprivate func configureView(){
        titleLabel.text = subCategory.title
        subTitle.text = subCategory.subTitle
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitle)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            subTitle.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitle.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subTitle.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)
        ])
    }
}
