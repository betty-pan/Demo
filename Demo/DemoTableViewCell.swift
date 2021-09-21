//
//  DemoTableViewCell.swift
//  Demo
//
//  Created by Betty Pan on 2021/9/21.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!

    private var colors: [UIColor] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.isScrollEnabled = false
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.contentView.frame = self.bounds
        self.contentView.layoutIfNeeded()
        return collectionView.contentSize
    }

    func setCell(colors: [UIColor]){
        self.colors = colors
        collectionView.register(UINib(nibName: "\(DemoCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(DemoCollectionViewCell.self)")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}
extension DemoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DemoCollectionViewCell.self)", for: indexPath) as? DemoCollectionViewCell else { return UICollectionViewCell() }
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
}

extension DemoTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width/2)-20, height: 80)
    }

}
