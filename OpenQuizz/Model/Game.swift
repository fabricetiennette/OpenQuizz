//
//  Game.swift
//  OpenQuizz
//
//  Created by Fabrice Etiennette on 01/08/2019.
//  Copyright © 2019 Fabrice Etiennette. All rights reserved.
//

import Foundation

class Game {
	var score = 0
	private var questions = [Question]()
	private var currentIndex = 0
	var state: State = .ongoing
	var currentQuestion: Question {
		return questions[currentIndex]
	}
	
	enum State {
		case ongoing, over
	}
	func refresh() {
		score = 0
		currentIndex = 0
		state = .over
		//on utilise ci-dessous une fermeture (closure) plutôt qu'une fonction mais le comportement est le même
		QuestionManager.shared.get{ (questions) in
			self.questions = questions
			self.state = .ongoing
			
			let name = Notification.Name(rawValue: "QuestionsLoaded")
			let notification = Notification(name: name)
			NotificationCenter.default.post(notification)
			
		}
	}
	
	private func receiveQuestion(_ questions: [Question]){ //obsolete
		self.questions = questions
		state = .ongoing
	}//cette fontion n'est plus utile car on utilise une fermeture juste au dessus et dans lequel il manque des fonctionnalitées
	
	func answerCurrentQuestion(with answer: Bool) {
		if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
			score += 1
		}
		goToNextQuestion()
	}
	
	private func goToNextQuestion() {
		if currentIndex < questions.count - 1 {
			currentIndex += 1
		} else {
			finishGame()
		}
	}
	
	private func finishGame() {
		state = .over
	}
}
