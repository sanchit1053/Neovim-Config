snippets = {
	s({
			trig = "(%S+)fol",
			desc = "minimal for loop with long long",
			regTrig = true,
		},
		{
			f(
				function(args, snip)
					return "for ( long long " ..
						snip.captures[1] .. " = 0;" .. snip.captures[1] .. " < "
				end,
				{}),
			i(1, "n"),
			f(function(args, snip) return "; " .. snip.captures[1] .. "++)" end, {}),
			t({ "{", "\t", }),
			i(2),
			t({ "", "}", "" }),
		}),

	s(
		{ trig = "template", desc = "competetive Coding Template" },
		{
			t({
				"#include <bits/stdc++.h>",
				"",
				"using namespace std;",
				"",
				"typedef long long ll;",
				"typedef long double ld;",
				"typedef pair<int, int> pi;",
				"typedef pair<ll, ll> pl;",
				"typedef pair<double, double> pd;",
				"typedef vector<ll> vl;",
				"typedef vector<int> vi;",
				"typedef vector<vector<int>> vvi;",
				"typedef vector<vector<ll>> vvl;",
				"#define int long long",
				"ll MOD     = 998244353;",
				"ll MOD2    = 1000000007; // 10^9 + 7;",
				"double eps = 1e-12;",
				"#define fo(i, e) for (ll i = 0; i < e; i++)",
				"#define Fo(i, s, e) for (ll i = s; i < e; i++)",
				"#define rfo(i, s) for (ll i = s; i >= 0; i--)",
				"#define rFo(i, s, e) for (ll i = s; i >= e; i--)",
				"#define ln \"\\n\"",
				"#define sp \" \"",
				"#define debug(x) cout << #x << \" = \" << x << ln",
				"#define mp make_pair",
				"#define pb push_back",
				"#define f first",
				"#define s second",
				"#define INF 2e18",
				"#define fast_cin()                                                             \\",
				"\tios_base::sync_with_stdio(false);                                          \\",
				"\tcin.tie(NULL);                                                             \\",
				"cout.tie(NULL)",
				"#define all(x) (x).begin(), (x).end()",
				"#define sz(x) ((ll)(x).size())",
				"#define YES cout << \"YES\\n\";",
				"#define NO cout << \"NO\\n\";",
				"",
				"void solve() {",
				"\t",
			}),
			i(0),
			t({ "",
				"}",
				"signed main() {",
				"fast_cin();",
				"/* #ifndef ONLINE_JUDGE */",
				"/*    freopen(\"input.txt\", \"r\", stdin); */",
				"/*    freopen(\"output.txt\", \"w\", stdout); */",
				"/* #endif */",
				"ll t = 1;",
				"cin >> t;",
				"for (int it = 1; it <= t; it++) {",
				"solve();",
				"}",
				"return 0;",
				"}",
			})
		}
	),

	s({
			trig = 'gcd',
			desc = "The GCD function",
		},
		{
			t({

				"ll gcd(ll x, ll y) {",
				"\tif (x < y) {",
				"\t\treturn gcd(y, x);",
				"\t}",
				"\tif (x % y == 0)",
				"\treturn y;",
				"\treturn gcd(y, x % y);",
				"}",
			})
		}
	),

	s("cins", {
		t("long long "),
		i(1, "n"),
		t({ ";", "cin >> " }),
		-- lambda nodes accept an l._1,2,3,4,5, which in turn accept any string transformations.
		-- This list will be applied in order to the first node given in the second argument.
		l(l._1:gsub(",", " >> "), 1),
		t({ ";", "" }),
	}),

	s({
			trig = '(%S+)vec',
			desc = "Define and Read in an vector<long long>",
			regTrig = true,
		},
		{
			f(function(args, snip)
				return "vector<long long> " .. snip.captures[1] .. "("
			end),
			i(1, "n"),
			t(");"),
			t({ "", "for(long long i = 0; i < " }),
			extras.rep(1),
			t({ "; i++){", "\t" }),
			f(function(args, snip)
				return "cin >> " .. snip.captures[1] .. "["
			end),
			t("i];"),
			t({ "", "}", "" }),
		}
	),
}


return snippets
