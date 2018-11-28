//
//  ViewController.swift
//  collections
//
//  Created by Adriana González Martínez on 11/26/18.
//  Copyright © 2018 Adriana González Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        
        // Instantiating the UICollectionView, using the default flow layout
        let flow = CustomFlowLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flow)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Setting the datasource & delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Customization
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        //Registering the cell
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        return collectionView
    }()
    
    var data: [Int] = Array(0..<20)
    
    
    override func loadView() {
        super.loadView()
        view.addSubview(collectionView)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Update", style: .done, target: self, action: #selector(showOptions(controller:)))

    }

    @objc func showOptions(controller: UIViewController) {
        let alert = UIAlertController(title: "Options", message: "Choose an update", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Example", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                
                 self.data[3] = 808080
                
                 self.collectionView.reloadItems(at: [IndexPath(item: 3, section: 0)])
            }, completion: nil)
            
            self.collectionView.performBatchUpdates({
                let updated = self.data[3]
                self.data.remove(at: 3)
                self.data.remove(at: 2)
                self.data.insert(updated, at: 0)
                self.collectionView.deleteItems(at: [IndexPath(item: 2, section: 0)])
                self.collectionView.moveItem(at: IndexPath(item: 3, section: 0), to:  IndexPath(item: 0, section: 0))
            }, completion: nil)
        
        }))
        
        alert.addAction(UIAlertAction(title: "Insert 3 at the beginning", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                self.data.insert(3, at: 0)
                self.collectionView.reloadItems(at: [IndexPath(index: 0)])
            }, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Update value at 5", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                self.data[5] = 505050
                self.collectionView.reloadItems(at: [IndexPath(item: 5, section: 0)])
            }, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Delete first 2, insert 3 more at the end", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                self.data.remove(at: 0)
                self.data.remove(at: 0)
                self.data.append(303030)
                self.data.append(303031)
                self.data.append(303032)
                
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                // don't ever forget to use ther reloadItems or else we can't use index 0 for how many eve4r times we want
                self.collectionView.reloadItems(at: [IndexPath(index: 0)])
                
                self.collectionView.insertItems(at: [IndexPath(row: self.data.count - 1, section: 0)])
                self.collectionView.insertItems(at: [IndexPath(row: self.data.count - 1, section: 0)])
                self.collectionView.insertItems(at: [IndexPath(row: self.data.count - 1, section: 0)])
            }, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Insert 3 more at the end, delete first 2", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                self.data.append(404040)
                self.data.append(404041)
                self.data.append(404042)
                self.collectionView.insertItems(at: [IndexPath(row: self.data.count - 3, section: 0)])
                self.collectionView.insertItems(at: [IndexPath(row: self.data.count - 3, section: 0)])
                self.collectionView.insertItems(at: [IndexPath(row: self.data.count - 3, section: 0)])
                
                self.data.remove(at: 0)
                self.data.remove(at: 0)
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                self.collectionView.reloadItems(at: [IndexPath(index: 0)])
            }, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Delete 3 at the beginning, insert 1 at the beginning", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                // deletes the first 3 datas
                self.data.remove(at: 0)
                self.data.remove(at: 0)
                self.data.remove(at: 0)
                // deletes the collection view items
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                
                // insert 10000 as the first item
                self.data.insert(10000, at: 0)
                self.collectionView.reloadItems(at: [IndexPath(index: 0)])
            }, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Delete 3 at the beginning, insert 1 at end", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                // delete in the data
                self.data.remove(at: 0)
                self.data.remove(at: 0)
                self.data.remove(at: 0)
                // delete the actual cells in the cellection view
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                // we reload the items so we can keep using index: 0
                self.collectionView.reloadItems(at: [IndexPath(index: 0)])
                
                // insert 2000 at the last index
                self.data.insert(2000, at: self.data.count)
            }, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Insert 3 at the beginning, delete the first one", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                // remove the first object first before we insert the '3' at the first element
                self.data.remove(at: 0)
                self.collectionView.deleteItems(at: [IndexPath(item: 0, section: 0)])
                
                self.data.insert(3, at: 0)
                self.collectionView.reloadItems(at: [IndexPath(index: 0)])
            }, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.data = Array(0..<20)
            self.collectionView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        let data = self.data[indexPath.item]
        cell.textLabel.text = String(data)
        cell.textLabel.textColor = UIColor.white
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.collectionView.bounds.width/4, height: self.collectionView.bounds.width/4)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 20, bottom: 5, right: 20)
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//
//
//}

