/*
 * $Id$
 */

/*
 * Harbour Project source code:
 *
 *
 * Copyright 2012 Pritpal Bedi <bedipritpal@hotmail.com>
 * www - http://harbour-project.org
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307 USA (or visit the web site http://www.gnu.org/).
 *
 * As a special exception, the Harbour Project gives permission for
 * additional uses of the text contained in its release of Harbour.
 *
 * The exception is that, if you link the Harbour libraries with other
 * files to produce an executable, this does not by itself cause the
 * resulting executable to be covered by the GNU General Public License.
 * Your use of that executable is in no way restricted on account of
 * linking the Harbour library code into it.
 *
 * This exception does not however invalidate any other reasons why
 * the executable file might be covered by the GNU General Public License.
 *
 * This exception applies only to the code released by the Harbour
 * Project under the name Harbour.  If you copy code from other
 * Harbour Project or Free Software Foundation releases into a copy of
 * Harbour, as the General Public License permits, the exception does
 * not apply to the code that you add in this way.  To avoid misleading
 * anyone as to the status of such modified files, you must delete
 * this exception notice from them.
 *
 * If you write modifications of your own for Harbour, it is your choice
 * whether to permit this exception to apply to your modifications.
 * If you do not wish that, delete this exception notice.
 *
 */

#include "hbqtgui.ch"
#include "hbclass.ch"
#include "hbtrace.ch"


CLASS HbQtGetList INHERIT HbGetList

   METHOD goNext( oGet )
   METHOD goPrevious( oGet )
   METHOD goTop( oGet )
   METHOD goBottom( oGet )
   METHOD isFirstGet( oGet )
   METHOD isLastGet( oGet )
   METHOD nextGet( oGet )
   METHOD previousGet( oGet )
   METHOD getIndex( oGet )

   ENDCLASS

/*----------------------------------------------------------------------*/

METHOD HbQtGetList:getIndex( oGet )
   RETURN AScan( ::aGetList, {|o| o == oGet } )

/*----------------------------------------------------------------------*/

METHOD HbQtGetList:goNext( oGet )

   LOCAL n := ::getIndex( oGet )

   IF n > 0
      IF n < Len( ::aGetList )
         ::aGetList[ n + 1 ]:setFocus( Qt_TabFocusReason )
         RETURN ::aGetList[ n + 1 ]
      ELSE
         ::aGetList[ 1 ]:setFocus( Qt_TabFocusReason )
         RETURN ::aGetList[ 1 ]
      ENDIF
   ENDIF

   RETURN oGet

/*----------------------------------------------------------------------*/

METHOD HbQtGetList:goPrevious( oGet )

   LOCAL n := ::getIndex( oGet )

   IF n > 0
      IF n > 1
         ::aGetList[ n - 1 ]:setFocus( Qt_BacktabFocusReason )
         RETURN ::aGetList[ n - 1 ]
      ELSE
         ATail( ::aGetList ):setFocus( Qt_BacktabFocusReason )
         RETURN ATail( ::aGetList )
      ENDIF
   ENDIF

   RETURN oGet

/*----------------------------------------------------------------------*/

METHOD HbQtGetList:goTop( oGet )

   LOCAL n := ::getIndex( oGet )

   IF n > 0
      IF n > 1
         ::aGetList[ 1 ]:setFocus( Qt_TabFocusReason )
         RETURN ::aGetList[ 1 ]
      ENDIF
   ENDIF

   RETURN oGet

/*----------------------------------------------------------------------*/

METHOD HbQtGetList:goBottom( oGet )

   LOCAL n := ::getIndex( oGet )

   IF n > 0
      IF n < Len( ::aGetList )
         ::aGetList[ Len( ::aGetList ) ]:setFocus( Qt_BacktabFocusReason )
         RETURN ::aGetList[ Len( ::aGetList ) ]
      ENDIF
   ENDIF

   RETURN oGet

/*----------------------------------------------------------------------*/

METHOD HbQtGetList:isFirstGet( oGet )
   RETURN ::getIndex( oGet ) == 1

/*----------------------------------------------------------------------*/

METHOD HbQtGetList:isLastGet( oGet )
   RETURN ::getIndex( oGet ) == Len( ::aGetList )

/*----------------------------------------------------------------------*/

METHOD HbQtGetList:nextGet( oGet )

   LOCAL n := ::getIndex( oGet )

   IF n > 0
      IF n == Len( ::aGetList )
         RETURN ::aGetList[ 1 ]
      ELSE
         RETURN ::aGetList[ n + 1 ]
      ENDIF
   ENDIF

   RETURN oGet

/*----------------------------------------------------------------------*/

METHOD HbQtGetList:previousGet( oGet )

   LOCAL n := ::getIndex( oGet )

   IF n > 0
      IF n == 1
         RETURN ATail( ::aGetList )
      ELSE
         RETURN ::aGetList[ n - 1 ]
      ENDIF
   ENDIF

   RETURN oGet

/*----------------------------------------------------------------------*/
