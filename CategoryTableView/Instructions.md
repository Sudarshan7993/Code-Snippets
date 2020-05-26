# Category Table View
![Platform](https://img.shields.io/cocoapods/p/GZUILibrary.svg)

A UITableView connected to UICollectionView. Based on visible top headerView collection view selects it's item

## Getting Started

Create new Xcode project or open existing project & Copy all the files to your project.

### Prerequisites

Xcode: 10.2+     Swift: 4.2+

#### How to Use?

##### CategoryModel.swift
CategoryModel has two demo models for UICollectionView & UITableView on main screen.
the Category model contains static dummy data of Category array.
``` swift
struct Category{
  let name:String!
  let subCategories:[SubCategory]!
}
struct SubCategory{
  let title:String!
  let subTitle:String!
}
```
##### CategoryCollectionViewCell.swift
CategoryCollectionViewCell is custom UICollectionViewCell for collection view of Categories.
```swift
class CategoryCollectionViewCell:UICollectionViewCell{
    
    //Set up the view when category is set from (collectionView: UICollectionView, cellForItemAt) method
    var category:Category!{
        didSet{
            configureView()
        }
    }
 }
```

##### CategoryTableViewCell.swift
CategoryTableViewCell is custom UITableViewCell to display subCategories on main TableView
```swift
class CategoryTableViewCell:UITableViewCell{
    
    /* Configure the view when subCategory is set through
       tableView: UITableView, cellForRowAt indexPath: IndexPath method
     */
    var subCategory:SubCategory!{
        didSet{
            configureView()
        }
    }
}
```
##### CategoryTableViewController.swift
CategoryTableViewController contains a collectionView which changes it's selection based on top visible header of TableView.
```swift
class CategoryTableViewController: UIViewController {
/**
# Note: #
Base logic of scrolling & collectionViewCell selection can be found in scrollViewDidScroll
*/
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
        /**
         #Notes:#
            When scrolling starts on the tableView select the top section of the visible Rows by mapping it and sorting out the first element.
            When the top section is found then create an Index path with first item on section 0 to select the item on collectionView
            After getting the indexPath notify _categoryCollectionView to select the item on indexPath.
         */
        if scrollView == _mainTableView{
            let topSection = _mainTableView.indexPathsForVisibleRows?
                                           .map{$0.section}.sorted().first ?? 0
            let indexPath = IndexPath(item: topSection, section: 0)
            _categoryCollectionView.selectItem(at: indexPath,
                                               animated: true, scrollPosition: .left)
            
        }
    }
}
```
## Contributors
### Mayur Mane :  https://github.com/Sudarshan7993
