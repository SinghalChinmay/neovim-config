local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Trigger: cp
  s("cp", {
    t({
      "#include <algorithm>",
      "#include <chrono>",
      "#include <climits>",
      "#include <cstdint>",
      "#include <iostream>",
      "#include <numeric>",
      "#include <unordered_map>",
      "#include <vector>",
      "using namespace std;",
      "typedef long long ll;",
      "typedef pair<int, int> pii;",
      "#define all(x) (x).begin(), (x).end()",
      "",
      "struct custom_hash {",
      "    size_t operator()(uint64_t x) const {",
      "        static const uint64_t R = chrono::steady_clock::now().time_since_epoch().count();",
      "        x += R + 0x9e3779b97f4a7c15;",
      "        x = (x ^ (x >> 30)) * 0xbf58476d1ce4e5b9;",
      "        x = (x ^ (x >> 27)) * 0x94d049bb133111eb;",
      "        return x ^ (x >> 31);",
      "    }",
      "};",
      "// unordered_map<ll,int,custom_hash> mp;",
      "",
      "int main () {",
      "\tios::sync_with_stdio(false);",
      "\tcin.tie(NULL);",
      "",
      "\tint t; cin >> t;",
      "\twhile (t--) {",
      "\t\t"
    }),
    i(0), -- The cursor will land here after expansion so you can immediately start coding inside the loop
    t({
      "",
      "\t}",
      "\treturn 0;",
      "}"
    }),
  }),

  s("bp", {
    t({
	  "#include <bits/stdc++.h>",
      "using namespace std;",
      "typedef long long ll;",
      "typedef pair<int, int> pii;",
      "#define all(x) (x).begin(), (x).end()",
      "",
      "struct custom_hash {",
      "    size_t operator()(uint64_t x) const {",
      "        static const uint64_t R = chrono::steady_clock::now().time_since_epoch().count();",
      "        x += R + 0x9e3779b97f4a7c15;",
      "        x = (x ^ (x >> 30)) * 0xbf58476d1ce4e5b9;",
      "        x = (x ^ (x >> 27)) * 0x94d049bb133111eb;",
      "        return x ^ (x >> 31);",
      "    }",
      "};",
      "// unordered_map<ll,int,custom_hash> mp;",
      "",
      "int main () {",
      "\tios::sync_with_stdio(false);",
      "\tcin.tie(NULL);",
      "",
      "\tint t; cin >> t;",
      "\twhile (t--) {",
      "\t\t"
    }),
    i(0), -- The cursor will land here after expansion so you can immediately start coding inside the loop
    t({
      "",
      "\t}",
      "\treturn 0;",
      "}"
    }),
  }),
}
