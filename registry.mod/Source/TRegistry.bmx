Rem
'
' Copyright (c) 2012-2015 Paul Maskelyne <muttley@muttleyville.org>.
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the LICENSE file
' distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'
EndRem

Rem
	bbdoc: A simple class for storing and retrieving objects
EndRem
Type TRegistry

	' This holds the singleton instance of this Type
	Global _instance:TRegistry

	' The map used by the registry for storing objects
	Field _registry:TMap

	Rem
		bbdoc: Adds an object to the registry indexed by the provided string
		about: An index string can only be used once, any subsequent attempts to
		add objects to the registry using the same index value will be silently
		ignored
	EndRem
	Method Add (index:String, value:Object)
		If Not IsRegistered (index)
			_registry.Insert (index, value)
		End If
	End Method

	Rem
		bbdoc: Gets the object referenced by the specified index string
	EndRem
	Method Get:Object (index:String)
		Local value:Object = Null

		If IsRegistered (index)
			value = _registry.ValueForKey (index)
		EndIf

		Return value
	End Method

	Rem
		bbdoc: Get the instance of the registry
		returns: The Singleton instance TRegistry
		about: The registry is a singleton class and this function should be used
		to access it
	EndRem
	Function GetInstance:TRegistry()
		If Not _instance
			Return New TRegistry
		Else
			Return _instance
		EndIf
	End Function

	Rem
		bbdoc: Returns whether an object is registered with the specified index string
	EndRem
	Method IsRegistered:Int (index:String)
		Return _registry.Contains (index)
	End Method

	Rem
		bbdoc: Default constructor
	EndRem
	Method New()
		If _instance Throw "Cannot create multiple instances of Singleton Type"
		_instance = Self
		_registry = New TMap
	End Method

	Rem
		bbdoc: Removes the object referenced by the specified index string
	EndRem
	Method Remove (index:String)
		If IsRegistered (index)
			_registry.Remove (index)
		End If
	End Method

EndType
