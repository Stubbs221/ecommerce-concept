//
//  SelectCategoryCollectionView.swift
//  ecommerce-concept
//
//  Created by MAC on 24.08.2022.
//

import UIKit

class SelectCategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let imageNameArray: [String] = ["phonesCategoryButton", "computerCategoryButton", "healthCategoryButton", "booksCategoryButton", "healthCategoryButton"]
    let imagePressedNameArray: [String] = ["phonesCategoryButtonPressed", "computerCategoryButtonTapped", "healthCategoryButtonPressed", "booksCategoryButtonPressed", "healthCategoryButtonPressed"]
    let labelTextArray: [String] = ["Phones", "Computer", "Health", "Books", "Other"]
    var isPressed: [Bool] = [true, false, false, false, false]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = UIColor(named: "backgroundWhiteColor")
        delegate = self
        dataSource = self
        register(SelectCategoryCell.self, forCellWithReuseIdentifier: SelectCategoryCell.identificator)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.selectCategoryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCategoryCell.identificator, for: indexPath) as? SelectCategoryCell else { fatalError() }
        
        cell.categoryImage.image = UIImage(named: self.isPressed[indexPath.row] ? imagePressedNameArray[indexPath.row] : imageNameArray[indexPath.row])
        cell.categoryLabel.text = labelTextArray[indexPath.row]
        cell.categoryLabel.textColor = UIColor(named: self.isPressed[indexPath.row] ? "orangeColor" : "darkBlueColor")
        cell.roundView.backgroundColor = self.isPressed[indexPath.row] ? UIColor(named: "orangeColor") : UIColor.white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.selectCategoryItemWidth, height: frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0..<isPressed.count {
            isPressed[i] = false
        }
        
        isPressed[indexPath.row] = true
        reloadData()
    }
    struct Constants {
        static let leftDistanceToView: CGFloat = 25
        static let rightDistanceToView: CGFloat = 60
        static let selectCategoryMinimumLineSpacing: CGFloat = 10
        static let selectCategoryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.selectCategoryMinimumLineSpacing / 4)) / 4
    }

}
