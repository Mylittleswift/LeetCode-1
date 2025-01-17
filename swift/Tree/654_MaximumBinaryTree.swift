public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class Q654_Solution {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        guard 0 != nums.count   else {
            return nil
        }
        guard 1 != nums.count else {
            return TreeNode(nums[0])
        }
        var root : TreeNode? = nil
        let maxValue : Int = nums.max()!
        root = TreeNode(maxValue)
        let subTreeNums = nums.split(separator: maxValue)
        guard 1 != subTreeNums.count else {
            let subNums = Array<Int>(subTreeNums[0])
            if nums[0] == maxValue {
                root?.right = constructMaximumBinaryTree(subNums)
            } else {
                root?.left = constructMaximumBinaryTree(subNums)
            }
            return root
        }
        root?.left = constructMaximumBinaryTree(Array<Int>(subTreeNums[0]))
        root?.right = constructMaximumBinaryTree(Array<Int>(subTreeNums[1]))
        return root
    }
}