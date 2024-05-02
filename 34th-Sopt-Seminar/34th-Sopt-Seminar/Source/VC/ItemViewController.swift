//
//  ItemViewController.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 4/20/24.
//

import UIKit
import SnapKit

final class ItemViewController: UIViewController {
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterLineSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    let chatList = ItemModel.dummy()
    
    private func calculateCellHeight() -> CGFloat {
        let count = 6.0
            let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
        }
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            ItemCollectionViewCell.self,
            forCellWithReuseIdentifier: ItemCollectionViewCell.identifier
        )
    }
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(812)
        }
    }
}

extension ItemViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let screenWidth = UIScreen.main.bounds.width
              let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotLineSpacing
              return CGSize(width: doubleCellWidth / 2, height: 198)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 21
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return carrotInset
  }
}

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(chatList[indexPath.row], itemRow: indexPath.row)
        return cell
    }
}
