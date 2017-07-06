/*
 * generated by Xtext 2.13.0-SNAPSHOT
 */
package io.typefox.yang.tests

import com.google.inject.Inject
import io.typefox.yang.yang.AbstractModule
import org.eclipse.xtext.diagnostics.Diagnostic
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.eclipse.xtext.util.EmfFormatter
import org.junit.Test
import org.junit.runner.RunWith

import static org.junit.Assert.*

@RunWith(XtextRunner)
@InjectWith(YangInjectorProvider)
class YangParsingTest {

	@Inject extension ParseHelper<AbstractModule> parser
	@Inject ValidationTestHelper helper
	
	@Test def void testCustom() {
		val model = '''
			foo:bar 43tg3g3;
		'''.wrapModule.parse
		helper.assertNoErrors(model, Diagnostic.SYNTAX_DIAGNOSTIC)
	}

	@Test def void testParse() {
		val model = '''
			module example-system {
			       yang-version 1.1;
			       namespace "urn:example:system";
			       prefix "sys";
			
			       import ietf-yang-types {
			         prefix "yang";
			         reference "RFC 6991: Common YANG Data Types";
			       }
			
			       include example-types;
			
			       organization "Example Inc.";
			       contact
			         "Joe L. User
			
			          Example Inc.
			          42 Anywhere Drive
			          Nowhere, CA 95134
			          USA
			
			          Phone: +1 800 555 0100
			          EMail: joe@example.com";
			
			       description
			         "The module for entities implementing the Example system.";
			
			       revision 2007-06-09 {
			         description "Initial revision.";
			       }
			
			       my:custom rule {
			       		other:strange rf3-4.5345we2;
			       }
			     }
		'''.parse
		helper.assertNoErrors(model, Diagnostic.SYNTAX_DIAGNOSTIC)

		assertEquals('''
		Module {
		    cref Statement substatements [
		        0 : YangVersion {
		            attr EString yangVersion '1.1'
		        }
		        1 : Namespace {
		            attr EString uri 'urn:example:system'
		        }
		        2 : Prefix {
		            attr EString prefix 'sys'
		        }
		        3 : Import {
		            cref Statement substatements [
		                0: Prefix {
		                    attr EString prefix 'yang'
		                }
		                1: Reference {
		                    attr EString reference 'RFC 6991: Common YANG Data Types'
		                }
		            ]
		            ref AbstractModule module ref: AbstractModule@(unresolved proxy __synthetic0.yang#|0)
		        }
		        4 : Include {
		            ref AbstractModule module ref: AbstractModule@(unresolved proxy __synthetic0.yang#|1)
		        }
		        5 : Organization {
		            attr EString organization 'Example Inc.'
		        }
		        6 : Contact {
		            attr EString contact 'Joe L. User
		
		          Example Inc.
		          42 Anywhere Drive
		          Nowhere, CA 95134
		          USA
		
		          Phone: +1 800 555 0100
		          EMail: joe@example.com'
		        }
		        7 : Description {
		            attr EString description 'The module for entities implementing the Example system.'
		        }
		        8 : Revision {
		            cref Statement substatements [
		                0: Description {
		                    attr EString description 'Initial revision.'
		                }
		            ]
		            attr EString revision '2007-06-09'
		        }
		        9 : Unknown {
		            cref Statement substatements [
		                0: Unknown {
		                    ref Extension extension ref: Extension@(unresolved proxy __synthetic0.yang#|3)
		                    attr EString name 'rf3-4.5345we2'
		                }
		            ]
		            ref Extension extension ref: Extension@(unresolved proxy __synthetic0.yang#|2)
		            attr EString name 'rule'
		        }
		    ]
		    attr EString name 'example-system'
		}'''.toString, EmfFormatter.objToStr(model))
	}
	
	@Test
	def void testParseRange_01() {
		'''
		typedef foo {
		  type int32 {
		    range 1;
		  }
		}'''.wrapModule.assertNoParserErrors;
	}

	@Test
	def void testParseRange_02() {
		'''
		typedef foo {
		  type int32 {
		    range '1';
		  }
		}'''.wrapModule.assertNoParserErrors;
	}

	@Test
	def void testParseRange_03() {
		'''
		typedef foo {
		  type int32 {
		    range "1";
		  }
		}'''.wrapModule.assertNoParserErrors;
	}
	
	@Test
	def void testParseRange_04() {
		'''
		typedef foo {
		  type int32 {
		    range '1 | 2';
		  }
		}'''.wrapModule.assertNoParserErrors;
	}

	@Test
	def void testParseRange_05() {
		'''
		typedef foo {
		  type int32 {
		    range "1 | 2..4";
		  }
		}'''.wrapModule.assertNoParserErrors;
	}
	
	@Test
	def void testParseRange_06() {
		'''
		typedef foo {
		  type int32 {
		    range '1 | 2..4';
		  }
		}'''.wrapModule.assertNoParserErrors;
	}
	
	@Test
	def void testParseRange_07() {
		'''
		typedef foo {
		  type int32 {
		    range "1 | 2..4 | 5";
		  }
		}'''.wrapModule.assertNoParserErrors;
	}
	
	@Test
	def void testParseRange_08() {
		'''
		typedef foo {
		  type int32 {
		    range "1 | 2..max | 5";
		  }
		}'''.wrapModule.assertNoParserErrors;
	}


	@Test
	def void testParseRange_09() {
		'''
		typedef foo {
		  type int32 {
		    range "1 | min..4 | 5";
		  }
		}'''.wrapModule.assertNoParserErrors;
	}
	
	@Test
	def void testParseRange_10() {
		'''
		typedef foo {
		  type int32 {
		    range "1 | min..max | 5";
		  }
		}'''.wrapModule.assertNoParserErrors;
	}
	
	@Test
	def void testParseRange_11() {
		'''
		typedef foo {
		  type int32 {
		    range '1 | min  ..  max | 5';
		  }
		}'''.wrapModule.assertNoParserErrors;
	}
	
	@Test
	def void testParseRange_12() {
		'''
		typedef foo {
		  type int32 {
		    range '1 | 2 ..  3|4 ..  5      | 6 | 7..  max';
		  }
		}'''.wrapModule.assertNoParserErrors;
	}

	private def wrapModule(CharSequence it) '''
		module foo {
			«it»
		}
	'''
	private def assertNoParserErrors(CharSequence it) {
		helper.assertNoErrors(parse, Diagnostic.SYNTAX_DIAGNOSTIC);
	}
}
