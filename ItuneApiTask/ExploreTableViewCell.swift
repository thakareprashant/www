//
//  ExploreTableViewCell.swift
//  ItuneApiTask
//
//  Created by prashant thakare on 15/04/21.
//

import UIKit
import moa

class ExploreTableViewCell: UITableViewCell,SendData {
    func sendImage(Url: String) {
        print(Url)
    }
    
    var result:[ResultElement]?
    var imageArray:ResultElement?
    var md:String?
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var cillectionV: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cillectionV.dataSource = self
        cillectionV.delegate = self
        DispatchQueue.main.async {
            self.cillectionV.reloadData()
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ExploreTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (imageArray?.artistName.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.Img.moa.url = imageArray?.artworkUrl100
        cell.title.text = imageArray?.artistName
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 90)
    }
    
    
    
}
