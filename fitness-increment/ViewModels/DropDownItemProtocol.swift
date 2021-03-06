//
//  DropDownItemProtocol.swift
//  fitness-increment
//
//  Created by Rick Brown on 15/02/2021.
//

import Foundation

protocol DropDownItemProtocol {
  var options: [DropdownOption] { get }
  var headerTitle: String { get }
  var dropdownTitle: String { get }
  var isSelected: Bool { get set }
}

protocol DropdownOptionProtocol {
  var toDropdownOption: DropdownOption { get }
}

struct DropdownOption {
  enum DropdownOptionType {
    case text(String)
    case number(Int)
  }
  
  let type: DropdownOptionType
  let formattedValue: String
  let isSelected: Bool
}
