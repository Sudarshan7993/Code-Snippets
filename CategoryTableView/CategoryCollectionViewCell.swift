/*

-------------------------------------------------------------------
|             CategoryCollectionViewCell.swift                    |
|  CategoryCollectionViewCell is a custom CollectionView Cell for |
|  CollectionView which displays the categories on the top.       |
|  The cell will get selected on tableView Scroll                 |
|_________________________________________________________________|

*/

import UIKit

class CategoryCollectionViewCell:UICollectionViewCell{
    
    //Set up the view when category is set from (collectionView: UICollectionView, cellForItemAt) method
    var category:Category!{
        didSet{
            configureView()
        }
    }
    
    //Title Label for the category
    private let categoryLabel:UILabel={
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    //setup for view with it's constraints.
    fileprivate func configureView(){
        contentView.layer.cornerRadius = contentView.frame.height/2
        self.contentView.addSubview(categoryLabel)
        
        //Set category name to title
        categoryLabel.text = category.name
        
        //Center the categoryLabel to the contentView
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    //On selection of cell change it's background color & text color to highlight the selected cell
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                contentView.backgroundColor = .init(red: 25.0/255.0,
                                                         green: 25.0/255.0,
                                                         blue: 25.0/255.0,
                                                         alpha: 1.0)
                categoryLabel.textColor = .white
            }else{
                contentView.backgroundColor = .white
                categoryLabel.textColor = .black
            }
        }
    }
}
