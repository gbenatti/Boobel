namespace Boobel.Attributes

import Boo.Lang.Compiler.Ast

class ValAttribute(LetAttribute):
	def constructor():
		pass

	override protected def DecorateField(klass as ClassDefinition, method as Method, parameter as ParameterDeclaration):
		klass.Members.Insert(0, BuildGetter(parameter))

	private def BuildGetter(parameter as ParameterDeclaration):
		return [|
			$("${Capitalize(parameter.Name)}") as $(parameter.Type):
				get:
					return self.$("_${parameter.Name}")
		|]
