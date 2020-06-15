/**
 *  Copyright (C) 2010-2020 The Catrobat Team
 *  (http://developer.catrobat.org/credits)
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as
 *  published by the Free Software Foundation, either version 3 of the
 *  License, or (at your option) any later version.
 *
 *  An additional term exception under section 7 of the GNU Affero
 *  General Public License, version 3, is available at
 *  (http://developer.catrobat.org/license_additional_term)
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see http://www.gnu.org/licenses/.
 */

@objc extension UserDataContainer {

    @objc(allVariablesForProject:)
    static func allVariables(for project: Project) -> [UserVariable] {
        var allVariables = [UserVariable]()
        if let vars = NSMutableArray(array: project.userData.programVariableList) as? [UserVariable] {
            allVariables = vars
        }
        for index in 0..<project.userData.objectVariableList.count() {
            if let variableList = project.userData.objectVariableList.object(at: index) as? [UserVariable] {
                if variableList.isNotEmpty {
                    allVariables.append(contentsOf: variableList)
                }
            }
        }
        return allVariables
    }

    @objc(allListsForProject:)
    static func allLists(for project: Project) -> [UserList] {
        var allLists = [UserList]()
        if let lists = NSMutableArray(array: project.userData.programListOfLists) as? [UserList] {
            allLists = lists
        }

        for index in 0..<project.userData.objectListOfLists.count() {
            if let listOfLists = project.userData.objectListOfLists.object(at: index) as? [UserList] {
                if listOfLists.isNotEmpty {
                    allLists.append(contentsOf: listOfLists)
                }
            }
        }
        return allLists
    }
}
