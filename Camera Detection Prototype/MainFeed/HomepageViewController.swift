//  HomepageViewController.swift
//  Beauty Blend
//  Created by Amy Wichelow on 26/02/2018.
//  Copyright © 2018 Amy Wichelow. All rights reserved.

import UIKit
import Firebase

class HomepageViewController: UICollectionViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating, UICollectionViewDelegateFlowLayout {
    func updateSearchResults(for searchController: UISearchController) {

    }
    var tutorials = [Tutorial]()
        
    @IBAction func UploadButton(_ sender: UIBarButtonItem) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TutorialUploadViewController")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    var filtered:[String] = []
    var searchActive : Bool = false
    let searchController = UISearchController(searchResultsController: nil)
    
        let reuseIdentifier = "collCell"
        let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    override func viewDidLoad() {
            super.viewDidLoad()

        _ = Database.database().reference().child("tutorials")
        
        
        
//        ref.observeSingleEvent(of: .value, with: { snapshot in
//
//            for tutorial in snapshot.children {
//                if let data = tutorial as? DataSnapshot {
//                    if let tutorial = Tutorial(snapshot: data) {
//                        self.tutorials.append(tutorial)
//                    }
//                }
//            }
//        })
        
        
        
            let nib = UINib(nibName: "CustomCell", bundle: nil)
            collectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
            collectionView?.reloadData()
        }
    
    
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
        
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            print(tutorials.count)
            return tutorials.count
        }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCell
        
        let tutorial = tutorials[indexPath.row]
        
        cell.tutorialName?.text = tutorial.tutorialName
        cell.animate()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //send over info to next view controller...
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        let title = titles[indexPath.row]
//        print(title)
//        collectionView.deselectItem(at: indexPath, animated: true)
//    }
    
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
