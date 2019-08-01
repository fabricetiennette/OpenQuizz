//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by Fabrice Etiennette on 01/08/2019.
//  Copyright © 2019 Fabrice Etiennette. All rights reserved.
//

import UIKit

class QuestionView: UIView {
	
	@IBOutlet private var label: UILabel!
	@IBOutlet private var icon: UIImageView!
	
	enum Style {
		case correct, incorrect, standard
	}
	var style: Style = .standard{
		didSet{
			setStyle(style)
		}
	}
	
	private func setStyle(_ style: Style){
		switch style {
		case .correct:
			backgroundColor = #colorLiteral(red: 0.7842472196, green: 0.9260502458, blue: 0.6268314719, alpha: 1)
			icon.image = UIImage(named: "Icon Correct")
			icon.isHidden = false
		case .incorrect:
			backgroundColor = #colorLiteral(red: 0.9313799739, green: 0.5266035199, blue: 0.5792709589, alpha: 1)
			icon.image = UIImage(named: "Icon Error")
			icon.isHidden = false
		case .standard:
			backgroundColor = #colorLiteral(red: 0.7487187982, green: 0.7688382268, blue: 0.7867640853, alpha: 1)
			icon.isHidden = true
			
		}
	}
	
	var title = "" {
		didSet {
			label.text = title
		}
	}
}
