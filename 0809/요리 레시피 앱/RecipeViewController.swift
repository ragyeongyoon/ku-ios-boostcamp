//
//  RecipeViewController.swift
//  요리 레시피 앱
//
//  Created by cscoi025 on 2019. 8. 9..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var indegrantLable: UILabel!
    @IBOutlet var recipeTextView: UITextView!
    
    var recipe: RecipeInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        indegrantLable.text = recipe.ingredient
        recipeTextView.text = recipe.recipe
        
        self.navigationItem.title = recipe.title
        let image = UIImage(named: recipe.image_name)
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
