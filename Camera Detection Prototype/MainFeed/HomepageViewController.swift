//  HomepageViewController.swift
//  Beauty Blend
//  Created by Amy Wichelow on 26/02/2018.
//  Copyright © 2018 Amy Wichelow. All rights reserved.

import UIKit

class HomepageViewController: UICollectionViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating, UICollectionViewDelegateFlowLayout {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    @IBAction func UploadButton(_ sender: UIBarButtonItem) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UploadFormViewController")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    
    var filtered:[String] = []
    var searchActive : Bool = false
    let searchController = UISearchController(searchResultsController: nil)
    
        let reuseIdentifier = "collCell"
    
        let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        let titles = ["Smokey Eye","Natural Look","Bold Lip","Perfect Brows","Winged Liner", "How to Contour"]
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            let nib = UINib(nibName: "CustomCell", bundle: nil)
            collectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
       // self.navigationController?.navigationBar.isTranslucent = false
        
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
        
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return titles.count
        }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCell
        
        let title = titles[indexPath.row]
        
        cell.title.text = title
        cell.animate()
        
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //send over info to next view controller...
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = titles[indexPath.row]
        print(title)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 170, height: 300)
        }
        
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
        }
        
    }
