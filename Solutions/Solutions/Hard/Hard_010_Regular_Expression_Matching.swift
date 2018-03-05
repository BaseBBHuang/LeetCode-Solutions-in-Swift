/*

https://oj.leetcode.com/problems/regular-expression-matching/

#10 Regular Expression Matching

Level: hard

Implement regular expression matching with support for '.' and '*'.

'.' Matches any single character.
'*' Matches zero or more of the preceding element.

The matching should cover the entire input string (not partial).

The function prototype should be:
bool isMatch(const char *s, const char *p)

Some examples:
isMatch("aa","a") → false
isMatch("aa","aa") → true
isMatch("aaa","aa") → false
isMatch("aa", "a*") → true
isMatch("aa", ".*") → true
isMatch("ab", ".*") → true
isMatch("aab", "c*a*b") → true

Inspired by @xiaohui7 at https://leetcode.com/discuss/18970/concise-recursive-and-dp-solutions-with-full-explanation-in

*/

// Helper
private extension String {
    subscript (index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
    subscript (range: Range<Int>) -> String {
        return String(self[self.index(self.startIndex, offsetBy: range.lowerBound)..<self.index(self.startIndex, offsetBy: range.upperBound)])
    }
}

class Hard_010_Regular_Expression_Matching {
    // recursion
    class func isMatch_recursion(s: String, p: String) -> Bool {
        if p.count == 0 {
            return s.count == 0
        }
        if p.count > 1 && p[1] == "*" {
            return isMatch_recursion(s: s, p: p[2..<p.count]) || s.count != 0 && (s[0] == p[0] || p[0] == ".") && isMatch_recursion(s: s[1..<s.count], p: p)
        } else {
            return s.count != 0 && (s[0] == p[0] || p[0] == ".") && isMatch_recursion(s: s[1..<s.count], p: p[1..<p.count])
        }
    }
    // dp
    class func isMatch(s: String, p: String) -> Bool {
        let m: Int = s.count
        let n: Int = p.count
        var f: [[Bool]] = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: n + 1), count: m + 1)
        f[0][0] = true
        for i in 1 ... m {
            f[i][0] = false
        }
        for i in 1 ... n {
            f[0][i] = i > 1 && "*" == p[i-1] && f[0][i-2]
        }
        for i in 1 ... m {
            for j in 1 ... n {
                if p[j-1] != "*" {
                    f[i][j] = f[i - 1][j - 1] && (s[i - 1] == p[j - 1] || "." == p[j - 1])
                } else {
                     f[i][j] = f[i][j - 2] || (s[i - 1] == p[j - 2] || "." == p[j - 2]) && f[i - 1][j]
                }
            }
        }
        return f[m][n]
    }
}
