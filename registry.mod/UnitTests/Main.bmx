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

SuperStrict

Import bah.maxunit
Import muttley.registry

Include "TTestObject.bmx"

New TTestSuite.run()

Type RegistryTestSuite Extends TTest

	Method CanInstantiateRegistry() {test}
		AssertNotNull (TRegistry.GetInstance())
	End Method

	Method CannotCreateTwoInstancesOfRegistry() {test}
		TRegistry.GetInstance()

		Local errorThrown:Int = False

		Try
			New TRegistry
		Catch o:Object
			errorThrown = True
		End Try

		assertTrue (errorThrown, "Exception not thrown when trying to create more than one instance.")
	End Method

	Method CanAddObject() {test}
		TRegistry.GetInstance().Add ("entry1", New TTestObject)
		AssertTrue (TRegistry.GetInstance().IsRegistered ("entry1"))
	End Method

	Method CanRetrieveObject() {test}
		TRegistry.GetInstance().Add ("entry2", New TTestObject)
		AssertNotNull (TRegistry.GetInstance().Get ("entry2"))
	End Method

	Method CorrectObjectRetrieved() {test}
		Local newObject:TTestObject = New TTestObject
		TRegistry.GetInstance().Add ("entry3", newObject)
		AssertSame (newObject, TRegistry.GetInstance().Get ("entry3"))
	End Method

	Method CanRemoveObject() {test}
		TRegistry.GetInstance().Remove ("entry3")
		AssertFalse (TRegistry.GetInstance().IsRegistered ("entry3"))
	End Method

End Type
