//
//  CreateChallengeViewModel.swift
//  fitness-increment
//
//  Created by Rick Brown on 15/02/2021.
//

import SwiftUI

final class CreateChallengeViewModel: ObservableObject {
  @Published var dropdowns: [ChallengePartViewModel] = [
    .init(type: .exercise),
    .init(type: .startAmount),
    .init(type: .increase),
    .init(type: .length)
  ]
}

extension CreateChallengeViewModel {
  struct ChallengePartViewModel: DropDownItemProtocol {
    var options: [DropdownOption]
    
    var headerTitle: String {
      type.rawValue
    }
    
    var dropdownTitle: String {
      options.first(where: { $0.isSelected })?.formattedValue ?? ""
    }
    
    var isSelected: Bool = false
    
    private let type: ChallengePartType
    
    init(type: ChallengePartType) {
      switch type {
      case .exercise:
        self.options = ExerciseOption.allCases.map { $0.toDropdownOption }
      case .increase:
        self.options = IncreaseOption.allCases.map { $0.toDropdownOption }
      case .length:
        self.options = LengthOption.allCases.map { $0.toDropdownOption }
      case .startAmount:
        self.options = StartOption.allCases.map { $0.toDropdownOption }
      }
      self.type = type
    }
    
    enum ChallengePartType: String, CaseIterable {
      case exercise = "Exercise"
      case startAmount = "Starting Amount"
      case increase = "Daily Increase"
      case length = "Challenge Length"
    }
    
    enum ExerciseOption: String, CaseIterable, DropdownOptionProtocol {
      case pullups
      case pushups
      case situps
      
      var toDropdownOption: DropdownOption {
        .init(type: .text(rawValue), formattedValue: rawValue.capitalized, isSelected: self == .pullups)
      }
    }
    
    enum StartOption: Int, CaseIterable, DropdownOptionProtocol {
      case one = 1, two, three, four, five
      
      var toDropdownOption: DropdownOption {
        .init(type: .number(rawValue), formattedValue: "\(rawValue)", isSelected: self == .one)
      }
    }
    
    enum IncreaseOption: Int, CaseIterable, DropdownOptionProtocol {
      case one = 1, two, three, four, five
      
      var toDropdownOption: DropdownOption {
        .init(type: .number(rawValue), formattedValue: "+\(rawValue)", isSelected: self == .one)
      }
    }
    
    enum LengthOption: Int, CaseIterable, DropdownOptionProtocol {
      case seven = 1, fourteen = 14, twentyOne = 21, twentyEight = 28
      
      var toDropdownOption: DropdownOption {
        .init(type: .number(rawValue), formattedValue: "\(rawValue) days", isSelected: self == .seven)
      }
    }
  }
}
