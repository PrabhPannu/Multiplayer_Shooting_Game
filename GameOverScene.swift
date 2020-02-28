

import Foundation
import SpriteKit



class GameOverScene: SKScene {
  init(size: CGSize, won: [Int]) {
    super.init(size: size)
    // 1
    backgroundColor = SKColor.white
    // 2
    //  let message = won ? "You Won!" : "You Lose :["
    let message = "Player one scored \(won[0]) \n";
    let message2 = "Player two scored \(won[1]) \n";
    // 3
    let label = SKLabelNode(fontNamed: "SavoyeLetPlain")
    label.text = message
    label.fontSize = 40
    label.fontColor = SKColor.black
    label.position = CGPoint(x: size.width/2, y: size.height/2)
    addChild(label)
    let label2 = SKLabelNode(fontNamed: "SavoyeLetPlain")
    label2.text = message2
    label2.fontSize = 40
    label2.fontColor = SKColor.black
    label2.position = CGPoint(x: (size.width/2), y: (size.height/2)-30)
    addChild(label2)
    // 4
    run(SKAction.sequence([
    SKAction.wait(forDuration: 3.0),
    SKAction.run() { [weak self] in
      // 5
      DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Put your code which should be executed with a delay here
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        let homeVC = storyboard.instantiateViewController(withIdentifier: "MainController") as! MainController
                        //Below's navigationController is useful if u want NavigationController in the destination View
                        let navigationController = UINavigationController(rootViewController: homeVC)
                        appDelegate.window!.rootViewController = navigationController
        }
      }
      ]))
   }
  // 6
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
