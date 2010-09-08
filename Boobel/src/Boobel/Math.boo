namespace Boobel

class Math:
	[extension]
	static def max[of T(System.IComparable)](value as T, other as T) as T:
		return (value if value.CompareTo(other) > 0 else other)

	[extension]
	static def min[of T(System.IComparable)](value as T, other as T) as T:
		return (value if value.CompareTo(other) < 0 else other)
