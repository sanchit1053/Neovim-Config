snippets = {
	s({
			trig = "(%S+)fol",
			desc = "minimal for loop with long long",
			regTrig = true,
		},
		{
			f(
				function(args, snip)
					return "for (long long " ..
						snip.captures[1] .. " = 0; " .. snip.captures[1] .. " < "
				end,
				{}),
			i(1, "n"),
			f(function(args, snip) return "; " .. snip.captures[1] .. "++)" end, {}),
			t({ " {", "\t", }),
			i(2),
			t({ "", "}", }),
		}),
	s(
		{ trig = "template", desc = "competetive Coding Template" },
		fmt([[

				#include <bits/stdc++.h>

				using namespace std;

				#define int long long
				typedef long long ll;
				typedef long double ld;
				typedef pair<int, int> pi;
				typedef pair<ll, ll> pl;
				typedef pair<double, double> pd;
				typedef vector<ll> vl;
				typedef vector<int> vi;
				typedef vector<vector<int>> vvi;
				typedef vector<vector<ll>> vvl;
				ll MOD     = 998244353;
				ll MOD2    = 1000000007; // 10^9 + 7;
				double eps = 1e-12;
				#define fo(i, e) for (ll i = 0; i < e; i++)
				#define Fo(i, s, e) for (ll i = s; i < e; i++)
				#define rfo(i, s) for (ll i = s; i >= 0; i--)
				#define rFo(i, s, e) for (ll i = s; i >= e; i--)
				#define ln "\n"
				#define sp " "

				// clang-format off
				#ifdef HOME_COMPUTER_SANCHIT
					#define debug(...) cerr << "[" << #__VA_ARGS__ << "]:", debug_out(__VA_ARGS__)
					#define here cerr << "here " << __LINE__ << endl
				#else
					#define debug(...) 36
					#define here 2002
				#endif
				// #define debug(x) cout << #x << " = " << x << ln
				template <typename T> std::ostream& operator<<(std::ostream& stream, const vector<T>& vec){ for(size_t i = 0; i < vec.size(); i++){stream << vec[i];if(i != vec.size() - 1)stream << ' ';}; return stream; }
				template <typename T> std::istream& operator>>(std::istream& stream, vector<T>& vec) { for(T &x : vec)stream >> x;return stream; }
				template <typename T,typename U> std::ostream& operator<<(std::ostream& stream, const pair<T,U>& pr){ stream << pr.first << ' ' << pr.second; return stream; }
				template <typename T,typename U> std::istream& operator>>(std::istream& stream, pair<T,U>& pr){ stream >> pr.first >> pr.second; return stream; }

				template <typename A, typename B>string to_string(pair<A, B> p);
				template <typename A, typename B, typename C>string to_string(tuple<A, B, C> p);
				template <typename A, typename B, typename C, typename D>string to_string(tuple<A, B, C, D> p);
				string to_string(const string& s) { return '"' + s + '"'; }
				string to_string(char c) {string s;s += c;return s; }
				string to_string(const char* s) {return to_string((string) s); }
				string to_string(bool b) {return (b ? "1" : "0"); }
				string to_string(vector<bool> v) {bool first = true;string res = "{";for (int i = 0; i < static_cast<int>(v.size()); i++) {if (!first) {res += ", ";}first = false;res += to_string(v[i]);}res += "}";return res;}
				template <size_t N>string to_string(bitset<N> v) {string res = "";for (size_t i = 0; i < N; i++) {res += static_cast<char>('0' + v[i]);}return res;}
				template <typename A>string to_string(A v) {bool first = true;string res = "{";for (const auto &x : v) {if (!first) {res += ", ";}first = false;res += to_string(x);}res += "}";return res;}
				template <typename A, typename B>string to_string(pair<A, B> p) {return "(" + to_string(p.first) + ", " + to_string(p.second) + ")";}
				template<class T> bool ckmin(T& a, const T& b) { return b < a ? a = b, 1 : 0; }
				template<class T> bool ckmax(T& a, const T& b) { return a < b ? a = b, 1 : 0; }

				void debug_out() { cerr << endl; } template <typename Head, typename... Tail>void debug_out(Head H, Tail... T) {cerr << " " << to_string(H);debug_out(T...);}
				// clang-format on

				#define INF 2e18
				#define fast_cin()                                                             \
					ios_base::sync_with_stdio(false);                                          \
					cin.tie(NULL);                                                             \
					cout.tie(NULL)
				#define all(x) (x).begin(), (x).end()
				#define sz(x) ((ll)(x).size())
				#define YES cout << "YES\n";
				#define NO cout << "NO\n";

				void solve() {
					~ans`
				}
				signed main() {
					fast_cin();
					ll t = 1;
					cin >> t;
					for (int it = 1; it <= t; it++) {
						solve();
					}
					return 0;
				}
				]], { ans = i(0) }, { delimiters = "~`" })),

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
