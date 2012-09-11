//-------------------- ricoLiveGrid.js

// Rico.LiveGridMetaData -----------------------------------------------------

Rico.LiveGridMetaData = Class.create();

Rico.LiveGridMetaData.prototype = {

   initialize: function( pageSize, totalRows, columnCount, options ) {
      this.pageSize  = pageSize;
      this.totalRows = totalRows;
      this.setOptions(options);
      this.scrollArrowHeight = 16;
      this.columnCount = columnCount;
   },

   setOptions: function(options) {
      this.options = {
         largeBufferSize    : 7.0,   // 7 pages
         nearLimitFactor    : 0.2    // 20% of buffer
      }.extend(options || {});
   },

   getPageSize: function() {
      return this.pageSize;
   },

   getTotalRows: function() {
      return this.totalRows;
   },

   setTotalRows: function(n) {
      this.totalRows = n;
   },

   getLargeBufferSize: function() {
      return parseInt(this.options.largeBufferSize * this.pageSize);
   },

   getLimitTolerance: function() {
      return parseInt(this.getLargeBufferSize() * this.options.nearLimitFactor);
   }
};

// Rico.LiveGridScroller -----------------------------------------------------

Rico.LiveGridScroller = Class.create();

Rico.LiveGridScroller.prototype = {

   initialize: function(liveGrid, viewPort) {
      this.isIE = navigator.userAgent.toLowerCase().indexOf("msie") >= 0;
      this.liveGrid = liveGrid;
      this.metaData = liveGrid.metaData;
      this.createScrollBar();
      this.scrollTimeout = null;
      this.lastScrollPos = 0;
      this.viewPort = viewPort;
      this.rows = new Array();
   },

   isUnPlugged: function() {
      return this.scrollerDiv.onscroll == null;
   },

   plugin: function() {
      this.scrollerDiv.onscroll = this.handleScroll.bindAsEventListener(this);
   },

   unplug: function() {
      this.scrollerDiv.onscroll = null;
   },

   sizeIEHeaderHack: function() {
      if ( !this.isIE ) return;
      var headerTable = $(this.liveGrid.tableId + "_header");
      if ( headerTable )
         headerTable.rows[0].cells[0].style.width =
            (headerTable.rows[0].cells[0].offsetWidth + 1) + "px";
   },

   createScrollBar: function() {
      var visibleHeight = this.liveGrid.viewPort.visibleHeight();
      // create the outer div...
      this.scrollerDiv  = document.createElement("div");
      var scrollerStyle = this.scrollerDiv.style;
      scrollerStyle.borderRight = "1px solid #ababab"; // hard coded color!!!
      scrollerStyle.position    = "relative";
      scrollerStyle.left        = this.isIE ? "-6px" : "-3px";
      scrollerStyle.width       = "19px";
      scrollerStyle.height      = visibleHeight + "px";
      scrollerStyle.overflow    = "auto";

      // create the inner div...
      this.heightDiv = document.createElement("div");
      this.heightDiv.style.width  = "1px";

      this.heightDiv.style.height = parseInt(visibleHeight *
                        this.metaData.getTotalRows()/this.metaData.getPageSize()) + "px" ;
      this.scrollerDiv.appendChild(this.heightDiv);
      this.scrollerDiv.onscroll = this.handleScroll.bindAsEventListener(this);

     var table = this.liveGrid.table;
     table.parentNode.parentNode.insertBefore( this.scrollerDiv, table.parentNode.nextSibling );
   },

   updateSize: function() {
      var table = this.liveGrid.table;
      var visibleHeight = this.viewPort.visibleHeight();
      this.heightDiv.style.height = parseInt(visibleHeight *
                                  this.metaData.getTotalRows()/this.metaData.getPageSize()) + "px";
   },

   rowToPixel: function(rowOffset) {
      return (rowOffset / this.metaData.getTotalRows()) * this.heightDiv.offsetHeight
   },
   
   moveScroll: function(rowOffset) {
      this.scrollerDiv.scrollTop = this.rowToPixel(rowOffset);
      if ( this.metaData.options.onscroll )
         this.metaData.options.onscroll( this.liveGrid, rowOffset );    
   },

   handleScroll: function() {
     if ( this.scrollTimeout )
         clearTimeout( this.scrollTimeout );

      var contentOffset = parseInt(this.scrollerDiv.scrollTop / this.viewPort.rowHeight);
      this.liveGrid.requestContentRefresh(contentOffset);
      this.viewPort.scrollTo(this.scrollerDiv.scrollTop);
      
      if ( this.metaData.options.onscroll )
         this.metaData.options.onscroll( this.liveGrid, contentOffset );

      this.scrollTimeout = setTimeout( this.scrollIdle.bind(this), 1200 );
   },

   scrollIdle: function() {
      if ( this.metaData.options.onscrollidle )
         this.metaData.options.onscrollidle();
   }
};

// Rico.LiveGridBuffer -----------------------------------------------------

Rico.LiveGridBuffer = Class.create();

Rico.LiveGridBuffer.prototype = {

   initialize: function(metaData, viewPort) {
      this.startPos = 0;
      this.size     = 0;
      this.metaData = metaData;
      this.rows     = new Array();
      this.updateInProgress = false;
      this.viewPort = viewPort;
      this.maxBufferSize = metaData.getLargeBufferSize() * 2;
      this.maxFetchSize = metaData.getLargeBufferSize();
      this.lastOffset = 0;
   },

   getBlankRow: function() {
      if (!this.blankRow ) {
         this.blankRow = new Array();
         for ( var i=0; i < this.metaData.columnCount ; i++ ) 
            this.blankRow[i] = "&nbsp;";
     }
     return this.blankRow;
   },
   
   loadRows: function(ajaxResponse) {
      var rowsElement = ajaxResponse.getElementsByTagName('rows')[0];
      this.updateUI = rowsElement.getAttribute("update_ui") == "true"
      var newRows = new Array()
      var trs = rowsElement.getElementsByTagName("tr");
      for ( var i=0 ; i < trs.length; i++ ) {
         var row = newRows[i] = new Array(); 
         var cells = trs[i].getElementsByTagName("td");
         for ( var j=0; j < cells.length ; j++ ) {
            var cell = cells[j];
            var convertSpaces = cell.getAttribute("convert_spaces") == "true";
            var cellContent = RicoUtil.getContentAsString(cell);
            row[j] = convertSpaces ? this.convertSpaces(cellContent) : cellContent;
            if (!row[j]) 
               row[j] = '&nbsp;';
         }
      }
      return newRows;
   },
      
   update: function(ajaxResponse, start) {
     var newRows = this.loadRows(ajaxResponse);
      if (this.rows.length == 0) { // initial load
         this.rows = newRows;
         this.size = this.rows.length;
         this.startPos = start;
         return;
      }
      if (start > this.startPos) { //appending
         if (this.startPos + this.rows.length < start) {
            this.rows =  newRows;
            this.startPos = start;//
         } else {
              this.rows = this.rows.concat( newRows.slice(0, newRows.length));
            if (this.rows.length > this.maxBufferSize) {
               var fullSize = this.rows.length;
               this.rows = this.rows.slice(this.rows.length - this.maxBufferSize, this.rows.length)
               this.startPos = this.startPos +  (fullSize - this.rows.length);
            }
         }
      } else { //prepending
         if (start + newRows.length < this.startPos) {
            this.rows =  newRows;
         } else {
            this.rows = newRows.slice(0, this.startPos).concat(this.rows);
            if (this.rows.length > this.maxBufferSize) 
               this.rows = this.rows.slice(0, this.maxBufferSize)
         }
         this.startPos =  start;
      }
      this.size = this.rows.length;
   },
   
   clear: function() {
      this.rows = new Array();
      this.startPos = 0;
      this.size = 0;
   },

   isOverlapping: function(start, size) {
      return ((start < this.endPos()) && (this.startPos < start + size)) || (this.endPos() == 0)
   },

   isInRange: function(position) {
      return (position >= this.startPos) && (position + this.metaData.getPageSize() <= this.endPos()); 
             //&& this.size()  != 0;
   },

   isNearingTopLimit: function(position) {
      return position - this.startPos < this.metaData.getLimitTolerance();
   },

   endPos: function() {
      return this.startPos + this.rows.length;
   },
   
   isNearingBottomLimit: function(position) {
      return this.endPos() - (position + this.metaData.getPageSize()) < this.metaData.getLimitTolerance();
   },

   isAtTop: function() {
      return this.startPos == 0;
   },

   isAtBottom: function() {
      return this.endPos() == this.metaData.getTotalRows();
   },

   isNearingLimit: function(position) {
      return ( !this.isAtTop()    && this.isNearingTopLimit(position)) ||
             ( !this.isAtBottom() && this.isNearingBottomLimit(position) )
   },

   getFetchSize: function(offset) {
      var adjustedOffset = this.getFetchOffset(offset);
      var adjustedSize = 0;
      if (adjustedOffset >= this.startPos) { //apending
         var endFetchOffset = this.maxFetchSize  + adjustedOffset;
         if (endFetchOffset > this.metaData.totalRows)
            endFetchOffset = this.metaData.totalRows;
         adjustedSize = endFetchOffset - adjustedOffset;   
      } else {//prepending
         var adjustedSize = this.startPos - adjustedOffset;
         if (adjustedSize > this.maxFetchSize)
            adjustedSize = this.maxFetchSize;
      }
      return adjustedSize;
   }, 

   getFetchOffset: function(offset) {
      var adjustedOffset = offset;
      if (offset > this.startPos)  //apending
         adjustedOffset = (offset > this.endPos()) ? offset :  this.endPos(); 
      else { //prepending
         if (offset + this.maxFetchSize >= this.startPos) {
            var adjustedOffset = this.startPos - this.maxFetchSize;
            if (adjustedOffset < 0)
               adjustedOffset = 0;
         }
      }
      this.lastOffset = adjustedOffset;
      return adjustedOffset;
   },

   getRows: function(start, count) {
      var begPos = start - this.startPos
      var endPos = begPos + count

      // er? need more data...
      if ( endPos > this.size )
         endPos = this.size

      var results = new Array()
      var index = 0;
      for ( var i=begPos ; i < endPos; i++ ) {
         results[index++] = this.rows[i]
      }
      return results
   },

   convertSpaces: function(s) {
      return s.split(" ").join("&nbsp;");
   }

};


//Rico.GridViewPort --------------------------------------------------
Rico.GridViewPort = Class.create();

Rico.GridViewPort.prototype = {

   initialize: function(table, rowHeight, visibleRows, buffer, liveGrid) {
      this.lastDisplayedStartPos = 0;
      this.div = table.parentNode;
      this.table = table
      this.rowHeight = rowHeight;
      this.div.style.height = this.rowHeight * visibleRows;
      this.div.style.overflow = "hidden";
      this.buffer = buffer;
      this.liveGrid = liveGrid;
      this.visibleRows = visibleRows + 1;
      this.lastPixelOffset = 0;
      this.startPos = 0;
   },

   populateRow: function(htmlRow, row) {
      for (var j=0; j < row.length; j++) {
         htmlRow.cells[j].innerHTML = row[j]
      }
   },
   
   bufferChanged: function() {
      this.refreshContents( parseInt(this.lastPixelOffset / this.rowHeight));
   },
   
   clearRows: function() {
      if (!this.isBlank) {
         for (var i=0; i < this.visibleRows; i++)
            this.populateRow(this.table.rows[i], this.buffer.getBlankRow());
         this.isBlank = true;
      }
   },
   
   clearContents: function() {   
      this.clearRows();
      this.scrollTo(0);
      this.startPos = 0;
      this.lastStartPos = -1;   
   },
   
   refreshContents: function(startPos) {
      if (startPos == this.lastRowPos && !this.isPartialBlank && !this.isBlank) {
         return;
      }
      if ((startPos + this.visibleRows < this.buffer.startPos)  
          || (this.buffer.startPos + this.buffer.size < startPos) 
          || (this.buffer.size == 0)) {
         this.clearRows();
         return;
      }
      this.isBlank = false;
      var viewPrecedesBuffer = this.buffer.startPos > startPos
      var contentStartPos = viewPrecedesBuffer ? this.buffer.startPos: startPos;
   
      var contentEndPos = (this.buffer.startPos + this.buffer.size < startPos + this.visibleRows) 
                                 ? this.buffer.startPos + this.buffer.size
                                 : startPos + this.visibleRows;       
      var rowSize = contentEndPos - contentStartPos;
      var rows = this.buffer.getRows(contentStartPos, rowSize ); 
      var blankSize = this.visibleRows - rowSize;
      var blankOffset = viewPrecedesBuffer ? 0: rowSize;
      var contentOffset = viewPrecedesBuffer ? blankSize: 0;

      for (var i=0; i < rows.length; i++) {//initialize what we have
        this.populateRow(this.table.rows[i + contentOffset], rows[i]);
      }       
      for (var i=0; i < blankSize; i++) {// blank out the rest 
        this.populateRow(this.table.rows[i + blankOffset], this.buffer.getBlankRow());
      }
      this.isPartialBlank = blankSize > 0;
      this.lastRowPos = startPos;   
   },

   scrollTo: function(pixelOffset) {      
      if (this.lastPixelOffset == pixelOffset)
         return;

      this.refreshContents(parseInt(pixelOffset / this.rowHeight))
      this.div.scrollTop = pixelOffset % this.rowHeight        
      
      this.lastPixelOffset = pixelOffset;
   },
   
   visibleHeight: function() {
      return parseInt(this.div.style.height);
   }
   
};


Rico.LiveGridRequest = Class.create();
Rico.LiveGridRequest.prototype = {
   initialize: function( requestOffset, options ) {
      this.requestOffset = requestOffset;
   }
};

// Rico.LiveGrid -----------------------------------------------------

Rico.LiveGrid = Class.create();

Rico.LiveGrid.prototype = {

   initialize: function( tableId, visibleRows, totalRows, url, options ) {
      if ( options == null )
         options = {};

      this.tableId     = tableId; 
      this.table       = $(tableId);
      var columnCount  = this.table.rows[0].cells.length
      this.metaData    = new Rico.LiveGridMetaData(visibleRows, totalRows, columnCount, options);
      this.buffer      = new Rico.LiveGridBuffer(this.metaData);

      var rowCount = this.table.rows.length;
      this.viewPort =  new Rico.GridViewPort(this.table, 
                                            this.table.offsetHeight/rowCount,
                                            visibleRows,
                                            this.buffer, this);
      this.scroller    = new Rico.LiveGridScroller(this,this.viewPort);
      
      this.additionalParms       = options.requestParameters || [];
      
      options.sortHandler = this.sortHandler.bind(this);

      if ( $(tableId + '_header') )
         this.sort = new Rico.LiveGridSort(tableId + '_header', options)

      this.processingRequest = null;
      this.unprocessedRequest = null;

      this.initAjax(url);
      if ( options.prefetchBuffer || options.prefetchOffset > 0) {
         var offset = 0;
         if (options.offset ) {
            offset = options.offset;            
            this.scroller.moveScroll(offset);
            this.viewPort.scrollTo(this.scroller.rowToPixel(offset));            
         }
         if (options.sortCol) {
             this.sortCol = options.sortCol;
             this.sortDir = options.sortDir;
         }
         this.requestContentRefresh(offset);
      }
   },

   resetContents: function() {
      this.scroller.moveScroll(0);
      this.buffer.clear();
      this.viewPort.clearContents();
   },
   
   sortHandler: function(column) {
      this.sortCol = column.name;
      this.sortDir = column.currentSort;

      this.resetContents();
      this.requestContentRefresh(0) 
   },
   
   setRequestParams: function() {
      this.additionalParms = [];
      for ( var i=0 ; i < arguments.length ; i++ )
         this.additionalParms[i] = arguments[i];
   },

   setTotalRows: function( newTotalRows ) {
      this.resetContents();
      this.metaData.setTotalRows(newTotalRows);
      this.scroller.updateSize();
   },

   initAjax: function(url) {
      ajaxEngine.registerRequest( this.tableId + '_request', url );
      ajaxEngine.registerAjaxObject( this.tableId + '_updater', this );
   },

   invokeAjax: function() {
   },

   handleTimedOut: function() {
      //server did not respond in 4 seconds... assume that there could have been
      //an error or something, and allow requests to be processed again...
      this.processingRequest = null;
      this.processQueuedRequest();
   },

   fetchBuffer: function(offset) {
      if ( this.buffer.isInRange(offset) &&
         !this.buffer.isNearingLimit(offset)) {
         return;
      }
      if (this.processingRequest) {
          this.unprocessedRequest = new Rico.LiveGridRequest(offset);
         return;
      }
      var bufferStartPos = this.buffer.getFetchOffset(offset);
      this.processingRequest = new Rico.LiveGridRequest(offset);
      this.processingRequest.bufferOffset = bufferStartPos;   
      var fetchSize = this.buffer.getFetchSize(offset);
      var partialLoaded = false;
      var callParms = []; 
      callParms.push(this.tableId + '_request');
      callParms.push('id='        + this.tableId);
      callParms.push('page_size=' + fetchSize);
      callParms.push('offset='    + bufferStartPos);
      if ( this.sortCol) {
         callParms.push('sort_col='    + this.sortCol);
         callParms.push('sort_dir='    + this.sortDir);
      }
      
      for( var i=0 ; i < this.additionalParms.length ; i++ )
         callParms.push(this.additionalParms[i]);
      ajaxEngine.sendRequest.apply( ajaxEngine, callParms );
        
      this.timeoutHandler = setTimeout( this.handleTimedOut.bind(this), 20000 ); //todo: make as option
   },

   requestContentRefresh: function(contentOffset) {
      this.fetchBuffer(contentOffset);
   },

   ajaxUpdate: function(ajaxResponse) {
      try {
         clearTimeout( this.timeoutHandler );
         this.buffer.update(ajaxResponse,this.processingRequest.bufferOffset);
         this.viewPort.bufferChanged();
      }
      catch(err) {}
      finally {this.processingRequest = null; }
      this.processQueuedRequest();
   },

   processQueuedRequest: function() {
      if (this.unprocessedRequest != null) {
         this.requestContentRefresh(this.unprocessedRequest.requestOffset);
         this.unprocessedRequest = null
      }  
   }
 
};


//-------------------- ricoLiveGridSort.js
Rico.LiveGridSort = Class.create();

Rico.LiveGridSort.prototype = {

   initialize: function(headerTableId, options) {
      this.headerTableId = headerTableId;
      this.headerTable   = $(headerTableId);
      this.setOptions(options);
      this.applySortBehavior();

      if ( this.options.sortCol ) {
         this.setSortUI( this.options.sortCol, this.options.sortDir );
      }
   },

   setSortUI: function( columnName, sortDirection ) {
      var cols = this.options.columns;
      for ( var i = 0 ; i < cols.length ; i++ ) {
         if ( cols[i].name == columnName ) {
            this.setColumnSort(i, sortDirection);
            break;
         }
      }
   },

   setOptions: function(options) {
      this.options = {
         sortAscendImg:    'images/sort_asc.gif',
         sortDescendImg:   'images/sort_desc.gif',
         imageWidth:       9,
         imageHeight:      5,
         ajaxSortURLParms: []
      }.extend(options);

      // preload the images...
      new Image().src = this.options.sortAscendImg;
      new Image().src = this.options.sortDescendImg;

      this.sort = options.sortHandler;
      if ( !this.options.columns )
         this.options.columns = this.introspectForColumnInfo();
      else {
         // allow client to pass { columns: [ ["a", true], ["b", false] ] }
         // and convert to an array of Rico.TableColumn objs...
         this.options.columns = this.convertToTableColumns(this.options.columns);
      }
   },

   applySortBehavior: function() {
      var headerRow   = this.headerTable.rows[0];
      var headerCells = headerRow.cells;
      for ( var i = 0 ; i < headerCells.length ; i++ ) {
         this.addSortBehaviorToColumn( i, headerCells[i] );
      }
   },

   addSortBehaviorToColumn: function( n, cell ) {
      if ( this.options.columns[n].isSortable() ) {
         cell.id            = this.headerTableId + '_' + n;
         cell.style.cursor  = 'pointer';
         cell.onclick       = this.headerCellClicked.bindAsEventListener(this);
         cell.innerHTML     = cell.innerHTML + '<span id="' + this.headerTableId + '_img_' + n + '">'
                           + '&nbsp;&nbsp;&nbsp;</span>';
      }
   },

   // event handler....
   headerCellClicked: function(evt) {
      var eventTarget = evt.target ? evt.target : evt.srcElement;
      var cellId = eventTarget.id;
      var columnNumber = parseInt(cellId.substring( cellId.lastIndexOf('_') + 1 ));
      var sortedColumnIndex = this.getSortedColumnIndex();
      if ( sortedColumnIndex != -1 ) {
         if ( sortedColumnIndex != columnNumber ) {
            this.removeColumnSort(sortedColumnIndex);
            this.setColumnSort(columnNumber, Rico.TableColumn.SORT_ASC);
         }
         else
            this.toggleColumnSort(sortedColumnIndex);
      }
      else
         this.setColumnSort(columnNumber, Rico.TableColumn.SORT_ASC);

      if (this.options.sortHandler) {
         this.options.sortHandler(this.options.columns[columnNumber]);
      }
   },

   removeColumnSort: function(n) {
      this.options.columns[n].setUnsorted();
      this.setSortImage(n);
   },

   setColumnSort: function(n, direction) {
      this.options.columns[n].setSorted(direction);
      this.setSortImage(n);
   },

   toggleColumnSort: function(n) {
      this.options.columns[n].toggleSort();
      this.setSortImage(n);
   },

   setSortImage: function(n) {
      var sortDirection = this.options.columns[n].getSortDirection();

      var sortImageSpan = $( this.headerTableId + '_img_' + n );
      if ( sortDirection == Rico.TableColumn.UNSORTED )
         sortImageSpan.innerHTML = '&nbsp;&nbsp;';
      else if ( sortDirection == Rico.TableColumn.SORT_ASC )
         sortImageSpan.innerHTML = '&nbsp;&nbsp;<img width="'  + this.options.imageWidth    + '" ' +
                                                     'height="'+ this.options.imageHeight   + '" ' +
                                                     'src="'   + this.options.sortAscendImg + '"/>';
      else if ( sortDirection == Rico.TableColumn.SORT_DESC )
         sortImageSpan.innerHTML = '&nbsp;&nbsp;<img width="'  + this.options.imageWidth    + '" ' +
                                                     'height="'+ this.options.imageHeight   + '" ' +
                                                     'src="'   + this.options.sortDescendImg + '"/>';
   },

   getSortedColumnIndex: function() {
      var cols = this.options.columns;
      for ( var i = 0 ; i < cols.length ; i++ ) {
         if ( cols[i].isSorted() )
            return i;
      }

      return -1;
   },

   introspectForColumnInfo: function() {
      var columns = new Array();
      var headerRow   = this.headerTable.rows[0];
      var headerCells = headerRow.cells;
      for ( var i = 0 ; i < headerCells.length ; i++ )
         columns.push( new Rico.TableColumn( this.deriveColumnNameFromCell(headerCells[i],i), true ) );
      return columns;
   },

   convertToTableColumns: function(cols) {
      var columns = new Array();
      for ( var i = 0 ; i < cols.length ; i++ )
         columns.push( new Rico.TableColumn( cols[i][0], cols[i][1] ) );
   },

   deriveColumnNameFromCell: function(cell,columnNumber) {
      var cellContent = cell.innerText != undefined ? cell.innerText : cell.textContent;
      return cellContent ? cellContent.toLowerCase().split(' ').join('_') : "col_" + columnNumber;
   }
};

Rico.TableColumn = Class.create();

Rico.TableColumn.UNSORTED  = 0;
Rico.TableColumn.SORT_ASC  = "ASC";
Rico.TableColumn.SORT_DESC = "DESC";

Rico.TableColumn.prototype = {
   initialize: function(name, sortable) {
      this.name        = name;
      this.sortable    = sortable;
      this.currentSort = Rico.TableColumn.UNSORTED;
   },

   isSortable: function() {
      return this.sortable;
   },

   isSorted: function() {
      return this.currentSort != Rico.TableColumn.UNSORTED;
   },

   getSortDirection: function() {
      return this.currentSort;
   },

   toggleSort: function() {
      if ( this.currentSort == Rico.TableColumn.UNSORTED || this.currentSort == Rico.TableColumn.SORT_DESC )
         this.currentSort = Rico.TableColumn.SORT_ASC;
      else if ( this.currentSort == Rico.TableColumn.SORT_ASC )
         this.currentSort = Rico.TableColumn.SORT_DESC;
   },

   setUnsorted: function(direction) {
      this.setSorted(Rico.TableColumn.UNSORTED);
   },

   setSorted: function(direction) {
      // direction must by one of Rico.TableColumn.UNSORTED, .SORT_ASC, or .SET_DESC...
      this.currentSort = direction;
   }

};


//-------------------- ricoUtil.js

var RicoUtil = {

   getElementsComputedStyle: function ( htmlElement, cssProperty, mozillaEquivalentCSS) {
      if ( arguments.length == 2 )
         mozillaEquivalentCSS = cssProperty;

      var el = $(htmlElement);
      if ( el.currentStyle )
         return el.currentStyle[cssProperty];
      else
         return document.defaultView.getComputedStyle(el, null).getPropertyValue(mozillaEquivalentCSS);
   },

   createXmlDocument : function() {
      if (document.implementation && document.implementation.createDocument) {
         var doc = document.implementation.createDocument("", "", null);

         if (doc.readyState == null) {
            doc.readyState = 1;
            doc.addEventListener("load", function () {
               doc.readyState = 4;
               if (typeof doc.onreadystatechange == "function")
                  doc.onreadystatechange();
            }, false);
         }

         return doc;
      }

      if (window.ActiveXObject)
          return Try.these(
            function() { return new ActiveXObject('MSXML2.DomDocument')   },
            function() { return new ActiveXObject('Microsoft.DomDocument')},
            function() { return new ActiveXObject('MSXML.DomDocument')    },
            function() { return new ActiveXObject('MSXML3.DomDocument')   }
          ) || false;

      return null;
   },

   getContentAsString: function( parentNode ) {
      return parentNode.xml != undefined ? 
         this._getContentAsStringIE(parentNode) :
         this._getContentAsStringMozilla(parentNode);
   },

   _getContentAsStringIE: function(parentNode) {
      var contentStr = "";
      for ( var i = 0 ; i < parentNode.childNodes.length ; i++ )
         contentStr += parentNode.childNodes[i].xml;
      return contentStr;
   },

   _getContentAsStringMozilla: function(parentNode) {
      var xmlSerializer = new XMLSerializer();
      var contentStr = "";
      for ( var i = 0 ; i < parentNode.childNodes.length ; i++ )
         contentStr += xmlSerializer.serializeToString(parentNode.childNodes[i]);
      return contentStr;
   },

   toViewportPosition: function(element) {
      return this._toAbsolute(element,true);
   },

   toDocumentPosition: function(element) {
      return this._toAbsolute(element,false);
   },

   /**
    *  Compute the elements position in terms of the window viewport
    *  so that it can be compared to the position of the mouse (dnd)
    *  This is additions of all the offsetTop,offsetLeft values up the
    *  offsetParent hierarchy, ...taking into account any scrollTop,
    *  scrollLeft values along the way...
    *
    * IE has a bug reporting a correct offsetLeft of elements within a
    * a relatively positioned parent!!!
    **/
   _toAbsolute: function(element,accountForDocScroll) {

      if ( navigator.userAgent.toLowerCase().indexOf("msie") == -1 )
         return this._toAbsoluteMozilla(element,accountForDocScroll);

      var x = 0;
      var y = 0;
      var parent = element;
      while ( parent ) {

         var borderXOffset = 0;
         var borderYOffset = 0;
         if ( parent != element ) {
            var borderXOffset = parseInt(this.getElementsComputedStyle(parent, "borderLeftWidth" ));
            var borderYOffset = parseInt(this.getElementsComputedStyle(parent, "borderTopWidth" ));
            borderXOffset = isNaN(borderXOffset) ? 0 : borderXOffset;
            borderYOffset = isNaN(borderYOffset) ? 0 : borderYOffset;
         }

         x += parent.offsetLeft - parent.scrollLeft + borderXOffset;
         y += parent.offsetTop - parent.scrollTop + borderYOffset;
         parent = parent.offsetParent;
      }

      if ( accountForDocScroll ) {
         x -= this.docScrollLeft();
         y -= this.docScrollTop();
      }

      return { x:x, y:y };
   },

   /**
    *  Mozilla did not report all of the parents up the hierarchy via the
    *  offsetParent property that IE did.  So for the calculation of the
    *  offsets we use the offsetParent property, but for the calculation of
    *  the scrollTop/scrollLeft adjustments we navigate up via the parentNode
    *  property instead so as to get the scroll offsets...
    *
    **/
   _toAbsoluteMozilla: function(element,accountForDocScroll) {
      var x = 0;
      var y = 0;
      var parent = element;
      while ( parent ) {
         x += parent.offsetLeft;
         y += parent.offsetTop;
         parent = parent.offsetParent;
      }

      parent = element;
      while ( parent &&
              parent != document.body &&
              parent != document.documentElement ) {
         if ( parent.scrollLeft  )
            x -= parent.scrollLeft;
         if ( parent.scrollTop )
            y -= parent.scrollTop;
         parent = parent.parentNode;
      }

      if ( accountForDocScroll ) {
         x -= this.docScrollLeft();
         y -= this.docScrollTop();
      }

      return { x:x, y:y };
   },

   docScrollLeft: function() {
      if ( window.pageXOffset )
         return window.pageXOffset;
      else if ( document.documentElement && document.documentElement.scrollLeft )
         return document.documentElement.scrollLeft;
      else if ( document.body )
         return document.body.scrollLeft;
      else
         return 0;
   },

   docScrollTop: function() {
      if ( window.pageYOffset )
         return window.pageYOffset;
      else if ( document.documentElement && document.documentElement.scrollTop )
         return document.documentElement.scrollTop;
      else if ( document.body )
         return document.body.scrollTop;
      else
         return 0;
   }

};
