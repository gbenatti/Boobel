namespace Boobel

class Dynamic:
	[extension]
	static def send([required] target as object, [required] method as string, params as (object)):
		target.GetType().GetMethod(method).Invoke(target, params)

	[extension]
	static def respondTo([required] target as object, [required] method as string):
		return target.GetType().GetMethod(method) != null
