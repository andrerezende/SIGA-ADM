// ===================================================================
// Based on work from: Matt Kruse <matt@mattkruse.com>
// WWW: http://www.mattkruse.com/
//
// Adapted to use the X Library (http://www.cross-browser.com)
// Simplified to use only one level of frame (iframe inside a document, not iframe inside iframe)
//
// Variables used for "Draggable IFrame" (DIF) functions
var DIF_dragging=false;
var DIF_iframeBeingDragged="";
var DIF_iframeObjects=new Object();
var DIF_iframeWindows=new Object();
var DIF_iframeMouseDownLeft = new Object();
var DIF_iframeMouseDownTop = new Object();
var DIF_pageMouseDownLeft = new Object();
var DIF_pageMouseDownTop = new Object();
var DIF_handles = new Object();
var DIF_highestZIndex=99;
var DIF_raiseSelectedIframe=false;
var DIF_allowDragOffScreen=false;
var DIF_objectDragging=null;

// Set to true to always raise the dragged iframe to top zIndex
function bringSelectedIframeToTop(val) {
	DIF_raiseSelectedIframe = val;
}
	
// Set to try to allow iframes to be dragged off the top/left of the document
function allowDragOffScreen(val) {
	DIF_allowDragOffScreen=val;
}

function _mOnMouseUpHandler(evt){ 
	var e = new xEvent(evt);
//	alert('a');
    xPreventDefault(e);
	window.parent.DIF_enddrag(e,window);
}

function _mOnMouseDownHandler(evt){ 
	var e = new xEvent(evt);
//	alert('b');
    xPreventDefault(e);
	window.parent.DIF_begindrag(e,window);
}

function _mOnMouseMoveHandler(evt){ 
	var e = new xEvent(evt);
    xPreventDefault(e);
	window.parent.DIF_iframemove(e,window);
}

function _mOnMouseMoveHandlerWindow(evt){ 
	var e = new xEvent(evt);
    xPreventDefault(e);
	window.DIF_mousemove(e,window);
}

// Method to be used by iframe content document to specify what object can be draggable in the window
function mEnableDragIFrame(ele, win) {
	if (arguments.length==2  && win==window) {
		// JS is included in the iframe who has a handle, search up the chain to find a parent window that this one is dragged in
        var ele = xGetElementById(ele);
		var p=win;
		while (p=p.parent)
        {
			if (p.mEnableDragIFrame) { p.mEnableDragIFrame(ele, win, true); return; }
			if (p==win.top) { return; } // Already reached the top, stop looking
		}
		return; // If it reaches here, there is no parent with the addHandle function defined, so this frame can't be dragged!
	}
	// Add handlers to child window
	if (typeof(win.DIF_mainHandlersAdded)=="undefined" || !win.DIF_mainHandlersAdded) {
        xAddEventListener(win.document, 'mouseup', win._mOnMouseUpHandler, false);
        xAddEventListener(win.document, 'mousedown', win._mOnMouseDownHandler, false);
        xAddEventListener(win.document, 'mousemove', win._mOnMouseMoveHandler, false);
		win.DIF_handlersAdded = true;
		win.DIF_mainHandlersAdded = true;
	}
	// Add handler to this window
	if (typeof(window.DIF_handlersAdded)!="undefined" || !window.DIF_handlersAdded) {
//        xAddEventListener(document, 'mousemove', _mOnMouseMoveHandlerWindow, false);
//		window.DIF_handlersAdded=true;
	}
	var name = DIF_getIframeId(win);
//	alert('name = ' + name);
	if (DIF_handles[name]==null) {
		// Initialize relative positions for mouse down events
		DIF_handles[name] = new Array();
		DIF_iframeMouseDownLeft[name] = 0;
		DIF_iframeMouseDownTop[name] = 0;
		DIF_pageMouseDownLeft[name] = 0;
		DIF_pageMouseDownTop[name] = 0;
	}
	DIF_objectDragging = ele;
	DIF_handles[name][DIF_handles[name].length] = ele;
}

// Generalized function to get position of an event (like mousedown, mousemove, etc)
function DIF_getEventPosition(evt) {
	var pos=new Object();
	pos.x=0;
	pos.y=0;
	if (!evt) {
		evt = window.event;
		}
	if (typeof(evt.pageX) == 'number') {
		pos.x = evt.pageX;
		pos.y = evt.pageY;
	}
	else {
		pos.x = evt.clientX;
		pos.y = evt.clientY;
		if (!top.opera) {
			if ((!window.document.compatMode) || (window.document.compatMode == 'BackCompat')) {
				pos.x += window.document.body.scrollLeft;
				pos.y += window.document.body.scrollTop;
			}
			else {
				pos.x += window.document.documentElement.scrollLeft;
				pos.y += window.document.documentElement.scrollTop;
			}
		}
	}
	return pos;
}

// Gets the ID of a frame given a reference to a window object.
// Also stores a reference to the IFRAME object and it's window object
function DIF_getIframeId(win) {
	// Loop through the window's IFRAME objects looking for a matching window object
	var iframes = document.getElementsByTagName("IFRAME");
	for (var i=0; i<iframes.length; i++) {
		var o = iframes.item(i);
		var w = null;
		if (o.contentWindow) {
			// For IE5.5 and IE6
			w = o.contentWindow;
		}
		else if (window.frames && window.frames[o.id].window) {
			w = window.frames[o.id];
		}
		if (w == win) {
			DIF_iframeWindows[o.id] = win;
			DIF_iframeObjects[o.id] = o;
			return o.id; 
		}
	}
	return null;
}

// Gets the page x, y coordinates of the iframe (or any object)
function DIF_getObjectXY(o) {
	var res = new Object();
	res.x=0; res.y=0;
	if (o != null) {
		res.x = o.style.left.substring(0,o.style.left.indexOf("px"));
		res.y = o.style.top.substring(0,o.style.top.indexOf("px"));
		}
	return res;
	}

// Function to get the src element clicked for non-IE browsers
function getSrcElement(e) {
	var tgt = e.target;
	while (tgt.nodeType != 1) { tgt = tgt.parentNode; }
	return tgt;
	}

// Check if object clicked is a 'handle' - walk up the node tree if required
function isHandleClicked(handle, objectClicked) {
	if (handle==objectClicked) { return true; }
	while (objectClicked.parentNode != null) {
		if (objectClicked==handle) {
			return true;
			}
		objectClicked = objectClicked.parentNode;
		}
	return false;
	}
	
// Called when user clicks an iframe that has a handle in it to begin dragging
function DIF_begindrag(e, win) {
	// Get the IFRAME ID that was clicked on
	var iframename = DIF_getIframeId(win);
	if (iframename==null) { return; }
	// Make sure that this IFRAME has a handle and that the handle was clicked
	if (DIF_handles[iframename]==null || DIF_handles[iframename].length<1) {
		return;
	}
	var isHandle = false;
	var t = e.target;
	for (var i=0; i<DIF_handles[iframename].length; i++) {
		if (isHandleClicked(DIF_handles[iframename][i],t)) {
			isHandle=true;
			break;
		}
	}
	if (!isHandle) { return false; }
	DIF_iframeBeingDragged = iframename;
	if (DIF_raiseSelectedIframe) {
		DIF_iframeObjects[DIF_iframeBeingDragged].style.zIndex=DIF_highestZIndex++;
	}
	DIF_dragging=true;
//	DIF_objectDragging.style.cursor="move";
	var pos = {x: e.pageX, y: e.pageY};
	DIF_iframeMouseDownLeft[DIF_iframeBeingDragged] = pos.x;
	DIF_iframeMouseDownTop[DIF_iframeBeingDragged] = pos.y;
	var o = {x: xPageX(DIF_iframeObjects[DIF_iframeBeingDragged]), y: xPageY(DIF_iframeObjects[DIF_iframeBeingDragged])};
//	alert(o.x + ' - ' + o.y);
//	alert(pos.x + ' - ' + pos.y);
	DIF_pageMouseDownLeft[DIF_iframeBeingDragged] = o.x - 0 + pos.x;
	DIF_pageMouseDownTop[DIF_iframeBeingDragged] = o.y - 0 + pos.y;
}

// Called when mouse button is released after dragging an iframe
function DIF_enddrag(e) {
	DIF_dragging=false;
//	DIF_objectDragging.style.cursor="auto";
	DIF_iframeBeingDragged="";
}

// Called when mouse moves in the main window
function DIF_mousemove(e) {
	if (DIF_dragging) {
		var pos = {x: e.pageX, y: e.pageY};
		DIF_drag(pos.x - DIF_pageMouseDownLeft[DIF_iframeBeingDragged] , pos.y - DIF_pageMouseDownTop[DIF_iframeBeingDragged]);
	}
}

// Called when mouse moves in the IFRAME window
function DIF_iframemove(e) {
	if (DIF_dragging) {
		var pos = {x: e.pageX, y: e.pageY};
		DIF_drag(pos.x - DIF_iframeMouseDownLeft[DIF_iframeBeingDragged] , pos.y - DIF_iframeMouseDownTop[DIF_iframeBeingDragged]);
	}
}

// Function which actually moves of the iframe object on the screen
function DIF_drag(x,y) {
	var o = DIF_getObjectXY(DIF_iframeObjects[DIF_iframeBeingDragged]);
	// Don't drag it off the top or left of the screen?
	var newPositionX = o.x-0+x;
	var newPositionY = o.y-0+y;
	if (!DIF_allowDragOffScreen) {
		if (newPositionX < 0) { newPositionX=0; }
		if (newPositionY < 0) { newPositionY=0; }
		}
	xMoveTo(DIF_iframeObjects[DIF_iframeBeingDragged], newPositionX, newPositionY);
	DIF_pageMouseDownLeft[DIF_iframeBeingDragged] += x;
	DIF_pageMouseDownTop[DIF_iframeBeingDragged] += y;
}
