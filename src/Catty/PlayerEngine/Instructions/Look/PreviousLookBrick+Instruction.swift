/**
 *  Copyright (C) 2010-2021 The Catrobat Team
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

@objc extension PreviousLookBrick: CBInstructionProtocol {

    @nonobjc func instruction() -> CBInstruction {
        .action { _ in SKAction.run(self.actionBlock()) }
    }

    @objc func actionBlock() -> () -> Void {
        guard let object = self.script?.object,
            let spriteNode = object.spriteNode
            else { fatalError("This should never happen!") }
        return {
            guard let look = spriteNode.previousLook() else { return }
            let cache = RuntimeImageCache.shared()
            var image = cache?.cachedImage(forPath: self.path(for: look))

            if image == nil {
                print("LoadImageFromDisk")
                cache?.loadImageFromDisk(withPath: self.path(for: look))
                guard let imageFromDisk = UIImage(contentsOfFile: self.path(for: look)) else { return }
                image = imageFromDisk
            }

            spriteNode.currentLook = look
            spriteNode.executeFilter(image)
        }
    }
}
