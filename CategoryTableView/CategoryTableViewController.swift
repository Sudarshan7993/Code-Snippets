/*

--------------------------------------------------------------------------------
|                 CategoryTableViewController.swift                            |
|  CategoryTableViewController contains a CollectionView & Tableview.          |
|  The collectionView on Top changes according to visible header of TableView. |
|  You can modify the View according to your requirement.                      |
|______________________________________________________________________________|

*/

import UIKit

class CategoryTableViewController: UIViewController {

    //CollectionView for visible Category of TableView Header
    let _categoryCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.indicatorStyle = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    //TableView which contains subCategories.
    let _mainTableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        _categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "colCell")
        _mainTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "cell")
        
        _categoryCollectionView.delegate = self
        _categoryCollectionView.dataSource = self
        _mainTableView.delegate = self
        _mainTableView.dataSource = self
    }
    
    /**
     #NOTE:#
        Select the first item on Collection view on start.
    */
    override func viewWillAppear(_ animated: Bool) {
        _categoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .left)
    }

    /**
     The method confgures the constraints of the view
     # Notes: #
     1. The first part of constraint set the collectionView on the top with the height of 60
     2. The second part of constraint set the tableView to remaining part of the screen with 5 padding.
     */
    fileprivate func configureView(){
        view.backgroundColor = .white
        view.addSubview(_categoryCollectionView)
        view.addSubview(_mainTableView)
        
        NSLayoutConstraint.activate([
            _categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            _categoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            _categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            _categoryCollectionView.heightAnchor.constraint(equalToConstant: 60),
            
            _mainTableView.leadingAnchor.constraint(equalTo: _categoryCollectionView.leadingAnchor),
            _mainTableView.trailingAnchor.constraint(equalTo: _categoryCollectionView.trailingAnchor),
            _mainTableView.topAnchor.constraint(equalTo: _categoryCollectionView.bottomAnchor, constant: 5),
            _mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
    
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

extension CategoryTableViewController:UITableViewDelegate,UITableViewDataSource{
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.categories[section].subCategoies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell
        cell.subCategory = Category.categories[indexPath.section].subCategoies[indexPath.row]
        return cell
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
              headerView.backgroundColor = .white
              let categoryLabel = UILabel()
              categoryLabel.translatesAutoresizingMaskIntoConstraints = false
              categoryLabel.text = Category.categories[section].name
              categoryLabel.font = .systemFont(ofSize: 25, weight: .semibold)
              headerView.addSubview(categoryLabel)
              NSLayoutConstraint.activate([
                  categoryLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
                  categoryLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
                  categoryLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
                  categoryLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10)
              ])
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension CategoryTableViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return Category.categories.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colCell", for: indexPath) as! CategoryCollectionViewCell
           cell.category = Category.categories[indexPath.row]
           return cell
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 120, height: 40)
       }
}
