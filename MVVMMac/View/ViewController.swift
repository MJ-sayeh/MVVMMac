//
//  ViewController.swift
//  MVVMMac
//
//  Created by Macbook on 11/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var selectedImageView: NSImageView!
    @IBOutlet weak var selectedUserName: NSTextField!
    
    @IBOutlet weak var mainView: NSTabView!
    @IBOutlet weak var tabView: NSTabView!
    @IBOutlet weak var comboBox: NSPopUpButton!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var collectionView: NSCollectionView!
    var selectedUser:User!{
        didSet{
            selectedUserName.stringValue = selectedUser.name
        }
    }
    
    var selectedImage:Image!{
        didSet{
            Utilities.getImage(selectedImage.url) {[weak self] (nsImage) in
                DispatchQueue.main.async {
                    self?.selectedImageView.image = nsImage
                }
            }
            
        }
    }
    var usersViewModel = ListViewModel(service: UsersService())
    var imagesViewModel = GridViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        usersViewModel.fetchData {[weak self] in
            self?.tableView.reloadData()
            
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        imagesViewModel.delegate = self
        imagesViewModel.getData()
        
        
    }
    
    
    
    
    @IBAction func changedView(_ sender: Any) {
        tabView.selectTabViewItem(at: comboBox.indexOfSelectedItem)
        mainView.selectTabViewItem(at: comboBox.indexOfSelectedItem)
    }
    
    @IBAction func selectUser(_ sender: Any) {
        selectedUser =  usersViewModel.data[tableView.clickedRow]
    }
}

extension ViewController:NSTableViewDataSource,NSTableViewDelegate{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "tableCell"), owner: nil) as? TableCellView  {
            cell.setUser(usersViewModel.data[row],showBottom: row % 2 == 0 )
            return cell
        }
        return nil
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return usersViewModel.data.count
    }
    
    
    
}

extension ViewController : NSCollectionViewDataSource , NSCollectionViewDelegate,GridViewModelDelegate{
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesViewModel.data.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        let index = indexPaths.first!.item
        selectedImage = imagesViewModel.data[index]
        
    }
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let imageCell = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewImage"), for: indexPath) as! CollectionViewImage
        imageCell.setImage(imagesViewModel.data[indexPath.item])
        
        return imageCell
        
    }
    
    func onGridDataUpdate(){
        collectionView.reloadData()
    }
    
    
    
    
}

