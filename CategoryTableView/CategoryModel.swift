/*
 
 -----------------------------------------------------------------
 |                    CategoryModel.swift                        |
 |  This is a dummy static model data to fill collectionView     |
 |  & TableViews. Each Category has a subcategory for header.    |
 |  You can change the Model data according to your requirements.|
 |_______________________________________________________________|
 
 */
import Foundation

struct SubCategory{
    let title:String!
    let subTitle:String!
}

struct Category{
    let name:String!
    let subCategoies:[SubCategory]!
    
    static let categories = [
        Category(name: "Category 1",
                 subCategoies: [
                    SubCategory(title: "Sub Category 1", subTitle: "SubTitle 1"),
                    SubCategory(title: "Sub Category 2", subTitle: "SubTitle 2"),
                    SubCategory(title: "Sub Category 3", subTitle: "SubTitle 3"),
                    SubCategory(title: "Sub Category 4", subTitle: "SubTitle 4"),
                            ]),
        Category(name: "Category 2",
                 subCategoies: [
                    SubCategory(title: "Sub Category 1", subTitle: "SubTitle 1"),
                    SubCategory(title: "Sub Category 2", subTitle: "SubTitle 2"),
                    SubCategory(title: "Sub Category 3", subTitle: "SubTitle 3"),
                    SubCategory(title: "Sub Category 4", subTitle: "SubTitle 4"),
                    SubCategory(title: "Sub Category 5", subTitle: "SubTitle 5"),
                    SubCategory(title: "Sub Category 6", subTitle: "SubTitle 6"),
                    SubCategory(title: "Sub Category 7", subTitle: "SubTitle 7"),
                   ]),
        Category(name: "Category 3",
                 subCategoies: [
                    SubCategory(title: "Sub Category 1", subTitle: "SubTitle 1"),
                    SubCategory(title: "Sub Category 2", subTitle: "SubTitle 2"),
                    SubCategory(title: "Sub Category 3", subTitle: "SubTitle 3"),
                    SubCategory(title: "Sub Category 4", subTitle: "SubTitle 4"),
                    SubCategory(title: "Sub Category 5", subTitle: "SubTitle 5"),
                    SubCategory(title: "Sub Category 6", subTitle: "SubTitle 6"),
                    SubCategory(title: "Sub Category 7", subTitle: "SubTitle 7"),
                    SubCategory(title: "Sub Category 8", subTitle: "SubTitle 8"),
                    SubCategory(title: "Sub Category 9", subTitle: "SubTitle 9"),
                    SubCategory(title: "Sub Category 10", subTitle: "SubTitle 10"),
          ]),
        Category(name: "Category 4",
                 subCategoies: [
                    SubCategory(title: "Sub Category 1", subTitle: "SubTitle 1"),
                    SubCategory(title: "Sub Category 2", subTitle: "SubTitle 2"),
                    SubCategory(title: "Sub Category 3", subTitle: "SubTitle 3"),
          ]),
        Category(name: "Category 5",
               subCategoies: [
                  SubCategory(title: "Sub Category 1", subTitle: "SubTitle 1"),
                  SubCategory(title: "Sub Category 2", subTitle: "SubTitle 2"),
                  SubCategory(title: "Sub Category 3", subTitle: "SubTitle 3"),
                  SubCategory(title: "Sub Category 4", subTitle: "SubTitle 4"),
                  SubCategory(title: "Sub Category 5", subTitle: "SubTitle 5"),
                  SubCategory(title: "Sub Category 6", subTitle: "SubTitle 6"),
                  SubCategory(title: "Sub Category 7", subTitle: "SubTitle 7"),
        ]),
    ]
}


