namespace Boobel.Attributes

import Boo.Lang.Compiler.Ast

class VarAttribute(LetAttribute):
	def constructor():
		pass

	override protected def DecorateField(klass as ClassDefinition, method as Method, parameter as ParameterDeclaration):
		klass.Members.Insert(0, BuildProperty(parameter))

	private def BuildProperty(parameter as ParameterDeclaration):
		return [|
			$("${Capitalize(parameter.Name)}") as $(parameter.Type):
				get:
					return self.$("_${parameter.Name}")
				set:
					self.$("_${parameter.Name}") = value
		|]
