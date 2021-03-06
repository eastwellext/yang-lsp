/*
 * Copyright (C) 2020 TypeFox and others.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at http://www.apache.org/licenses/LICENSE-2.0
 */
package io.typefox.yang.diagram

import org.eclipse.sprotty.xtext.DiagramServerFactory

class YangDiagramServerFactory extends DiagramServerFactory {
	
	override getDiagramTypes() {
		#['yang-diagram']
	}
	
}