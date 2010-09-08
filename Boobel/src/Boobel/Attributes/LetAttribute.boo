namespace Boobel.Attributes

import Boo.Lang.Compiler.Ast

class LetAttribute(Boo.Lang.Compiler.AbstractAstAttribute):
	def constructor():
		pass

	override def Apply(node as Boo.Lang.Compiler.Ast.Node):
		parameter = node as ParameterDeclaration
		if parameter is not null:
			method = parameter.ParentNode as Method
			klass = method.ParentNode as ClassDefinition
			method.Body.Insert(0, BuildAssignment(parameter))
			klass.Members.Insert(0, BuildField(parameter))
			DecorateField(klass, method, parameter)
			
	private def BuildAssignment(parameter as ParameterDeclaration):
		return [|
			self.$("_${parameter.Name}") = $(parameter)
		|]
		
	private def BuildField(parameter as ParameterDeclaration):
		return [|
			$("_${parameter.Name}") as $(parameter.Type)
		|]
		
	virtual protected def DecorateField(klass as ClassDefinition, method as Method, parameter as ParameterDeclaration):
		pass		

	protected def Capitalize([required] name as string):
		return name if len(name) == 0
		return name[0:1].ToUpper() + name[1:]
