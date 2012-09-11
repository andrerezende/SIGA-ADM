// +-----------------------------------------------------------------+
// | MIOLO - Miolo Development Team - UNIVATES Centro Universitário  |
// +-----------------------------------------------------------------+
// | CopyLeft (L) 2001,2002  UNIVATES, Lajeado/RS - Brasil           |
// +-----------------------------------------------------------------+
// | Licensed under GPL: see COPYING.TXT or FSF at www.fsf.org for   |
// |                     further details                             |
// |                                                                 |
// | Site: http://miolo.codigolivre.org.br                           |
// | E-mail: vgartner@univates.br                                    |
// |         ts@interact2000.com.br                                  |
// +-----------------------------------------------------------------+
// | Abstract: This file contains the javascript functions           |
// |                                                                 |
// | Created: 2001/08/14 Vilson Cristiano Gärtner [vg]               |
// |                     Thomas Spriestersbach    [ts]               |
// |                                                                 |
// | History: Initial Revision                                       |
// |          2001/12/14 [ts] Added MultiTextField support functions |
// +-----------------------------------------------------------------+

/**
 * MIOLO Form Validation Handler
 */

var __MIOLO_Validate_Errors = '';

function MIOLO_Validator()
{
}

function MIOLO_Validate_Input(validations)
{
    var error = '';
    var count = 0;
    var field = null;

	for ( var i=0; i<validations.length; i++)
    {   
        var e = MIOLO_Validate(validations[i]);

        if ( e != null && e != '' )
        {
            if ( error != '' )
            {
                error += '\n';
            }
            error += '- ' + e;
            if ( field == null )
            {
                field = MIOLO_GetElementById(validations[i].field);
            }
            count++;
        }
    }

    if ( error != '' )
    {
        if ( count > 1 )
        {
            error = 'Os seguintes erros foram detectados:\n' + error;
        }
        else
        {
            error = 'O seguinte erro foi detectado:\n' + error;
        }

        alert(error);

        if ( field != null )
        {
			try
			{
                field.focus();
			}
			catch (e)
			{
			} 
        }
    }

    return (error == '');
}

function MIOLO_Validate(validator)
{
    if ( validator.type == 'ignore')
    {
        return null;
    }
    var req      = '';
    var field = MIOLO_GetElementById(validator.field);
    var value    = field.value;
    var error    = null;
	var param    = '';
    
    if ( validator.type == 'required' )
    {
        req = 'yes';
    }

	if ( (req != '' && value.length == 0) )
    {
        error = 'O campo "' + validator.label + '" deve ser informado ' ;
    }

	if ( (req != '' || value.length > 0) && value.length < validator.min )
    {
        error = 'O campo "' + validator.label + '" deve conter no mínimo ' +
                validator.min + ' caracteres';
    }
    
    if ( value.length > validator.max )
    {
        error = 'O campo "' + validator.label + '" deve conter no máximo ' +
                validator.max + ' caracteres';
    }
    
    if ( validator.chars != 'ALL')
    {
        for ( var i=0; i<value.length; i++ )
        {
            var c = value.charAt(i);
            
            if ( validator.chars.indexOf(c) == -1 )
            {
                error = 'O carater "' + c + '" é inválido para o campo "' + validator.label + '"';
            }
        }
    }
    
    if ( (value.length > 0 || req != '') && validator.mask != '' )
    {
        if ( value.length != validator.mask.length )
        {
            error = 'O campo "' + validator.label + '" deve conter ' +
                    validator.mask.length + ' caracteres';
        }
        else
        {
            for ( var i=0; i<value.length; i++ )
            {
                var m = validator.mask.charAt(i);
                var c = value.charAt(i);
                
                if ( m == '9' )
                {
                    if ( c < '0' || c > '9' )
                    {
                        error = 'O campo "' + validator.label + '" deve conter um dígito numérico na posição ' + (i+1);
                    }
                }
                else if ( m != 'a' )
                {
                    if ( m != c )
                    {
                        error = 'O campo "' + validator.label + '" deve conter o caractere "' + m + '" na posição ' + (i+1);
                    }
                }
            }
        }
    }
    
    if ( (value.length > 0 ||  req != '') && error == null && validator.checker != null )
    {
        param = '(value)';
		if ( validator.id == 'password')
		{
			param = '(value)';
		}
		if ( validator.id == 'compare')
		{
			param = '(value, validator.operator, validator.value, validator.datatype)';
		}
		if ( validator.id == 'range')
		{
			param = '(value, validator.minvalue, validator.maxvalue, validator.datatype)';
		}
		if ( validator.id == 'regexp')
		{
			param = '(value, validator.regexp)';
		}
		if ( ! eval(validator.checker + param) )
        {
            error = 'O conteúdo do campo "' + validator.label + '" está inválido!';
        }
    }

	if ((error != null) && (validator.msgerr != ''))
	{
		error = validator.msgerr; 
	}
    
    return error;
}

function MIOLO_Validate_Mask(validator, event)
{
    var field = MIOLO_GetElementById(validator.field);
//    var field = eval('document.'+validator.form+'.'+validator.field);
    var value = field.value;
    var mask  = validator.mask;

    if ( value.length == 0 )
    {
        var i = 0;
        
        while ( i < mask.length )
        {
            var m = mask.charAt(i++);
            
            if ( m == '9' || m == 'a' )
            {
                break;
            }
            
            value += m;
        }
    }

    if ( event != null )
    {
        var key   = event.which ? event.which : event.keyCode;
        var chr = String.fromCharCode( key);

        // alert(event.modifiers);
        
        if ( chr != '' && chr >= ' ' && key !=37)
        {
            if ( validator.max > 0 && value.length > validator.max - 1 )
            {
                value = value.substring(0,validator.max - 1);
            }
            
            value += chr;
            
            var i = value.length;
            
            while ( i < mask.length )
            {
                var m = mask.charAt(i++);
                
                if ( m == '9' || m == 'a' )
                {
                    break;
                }
                
                value += m;
            }
        }
        
        else
        {
            return true;
        }
    }
    
    field.value = value;
    
    return false;
}


function isDigit(chr)
{
    return "0123456789".indexOf(chr) != -1;
}

function returnNumbers(str)
{
    var rs='';
    
    for ( var i=0; i<str.length; i++)
    {
        var chr = str.charAt(i);
        if ( isDigit(chr) )
        {
            rs += chr;
        }
    }
    
    return rs;
}

function MIOLO_Validate_Check_PASSWORD(value)
{
	return (value == value.replace(' ',''));
}

function MIOLO_Validate_Check_COMPARE(value, operator, basevalue, datatype)
{
	var exp = '';

	if (datatype == 'i')
	{
		exp = value + ' ' + operator + ' ' + basevalue;
	}
	else
	{
		exp = "'" + value + "' " + operator + " '" + basevalue + "'";
	}
	return eval(exp) ;
}

function MIOLO_Validate_Check_RANGE(value, min, max, datatype)
{
	var exp = 'false';
	var pos1, pos2, sD1, sD2, sD3, sM1, sM2, sM3, sY1, sY2, sY3;

	if (datatype == 'i')
	{
		exp = '(' + value + ' >= ' + min + ') && (' + value + ' <= ' + max + ')';
	}
	else if (datatype == 's')
	{
		exp = "('" + value + "' >= '" + min + "') && ('" + value + "' <= '" + max + "')";
	}
	else if (datatype == 'd')
	{
       pos1 = value.indexOf('/');
	   pos2 = value.indexOf('/', pos1+1);
       sD1 = value.substring(0,pos1);
	   sM1 = value.substring(pos1+1,pos2);
	   sY1 = value.substring(pos2+1);
       if (isDate( sM1 + '/' + sD1 + '/' + sY1 ))
       {
          pos1 = min.indexOf('/');
	      pos2 = min.indexOf('/', pos1+1);
          sD2 = min.substring(0,pos1);
	      sM2 = min.substring(pos1+1,pos2);
	      sY2 = min.substring(pos2+1);
          if (isDate( sM2 + '/' + sD2 + '/' + sY2 ))
          {
             pos1 = max.indexOf('/');
	         pos2 = max.indexOf('/', pos1+1);
             sD3 = max.substring(0,pos1);
	         sM3 = max.substring(pos1+1,pos2);
	         sY3 = max.substring(pos2+1);
             if (isDate( sM3 + '/' + sD3 + '/' + sY3 ))
             {
				 var dt1 = new Date(sY1,sM1-1,sD1);
				 var dt2 = new Date(sY2,sM2-1,sD2);
				 var dt3 = new Date(sY3,sM3-1,sD3);
				 exp = (dt1 >= dt2) && (dt1 <= dt3);
		     }
          }

       }
	}
	return eval(exp) ;
}

function MIOLO_Validate_Check_REGEXP(value, regexp)
{
	return (value.search(regexp) >= 0);
}

/*
** Validador CNPJ
** Baseado no script original no CodigoLivre
** http://codigolivre.org.br/snippet/detail.php?type=snippet&id=22
*/
function MIOLO_Validate_Check_CNPJ(CNPJ)
{
    CNPJ = returnNumbers(CNPJ);
    
    if ( CNPJ.length == 14 && CNPJ != '00000000000000' )
    {
        var g = CNPJ.length - 2;
        
        if ( MIOLO_Validate_Verify_CNPJ(CNPJ,g) == 1 )
        {
            g = CNPJ.length - 1;
            
            if( MIOLO_Validate_Verify_CNPJ(CNPJ,g) == 1 )
            {	
                return true;
            }
        }
    }
    
    return false;
}

function MIOLO_Validate_Verify_CNPJ(CNPJ,g)
{
    var VerCNPJ=0;
    var ind=2;
    var tam;
    
    for( f = g; f > 0; f-- )
    {
        VerCNPJ += parseInt(CNPJ.charAt(f-1)) * ind;
        if(ind>8)
        {
            ind=2;
        }
        else
        {
            ind++;
        }
    }
    
    VerCNPJ%=11;
    
    if( VerCNPJ==0 || VerCNPJ==1 )
    {
        VerCNPJ=0;
    }
    else
    {
        VerCNPJ=11-VerCNPJ;
    }
    if( VerCNPJ!=parseInt(CNPJ.charAt(g)) )
    {
        return(0);
    }
    else
    {
        return(1);
    }
}    
    

function MIOLO_Validate_Check_CPF(value)
{
    var i;
    var c;
    
    var x = 0;
    var soma = 0;
    var dig1 = 0;
    var dig2 = 0;
    var texto = "";
    var numcpf1="";
    var numcpf = "";
    
    var numcpf = returnNumbers(value);

    if ( ( numcpf == '00000000000') ||
         ( numcpf == '11111111111') ||
         ( numcpf == '22222222222') ||
         ( numcpf == '33333333333') ||
         ( numcpf == '44444444444') ||
         ( numcpf == '55555555555') ||
         ( numcpf == '66666666666') ||
         ( numcpf == '77777777777') ||
         ( numcpf == '88888888888') ||
         ( numcpf == '99999999999')  )
    {
        return false;
    }
    
/*    for (i = 0; i < value.length; i++) 
    {
        c = value.substring(i,i+1);
        if ( isDigit(c) )
        {
            numcpf = numcpf + c;
        }
    }
*/    
    if ( numcpf.length != 11 ) 
    {
        return false;
    }
    
    len = numcpf.length; x = len -1;
    
    for ( var i=0; i <= len - 3; i++ ) 
    {
        y     = numcpf.substring(i,i+1);
        soma  = soma + ( y * x);
        x     = x - 1;
        texto = texto + y;
    }
    
    dig1 = 11 - (soma % 11);
    if (dig1 == 10) 
    {
        dig1 = 0 ;
    }
    
    if (dig1 == 11) 
    {
        dig1 = 0 ;
    }
    
    numcpf1 = numcpf.substring(0,len - 2) + dig1 ;
    x = 11; soma = 0;
    for (var i=0; i <= len - 2; i++) 
    {
        soma = soma + (numcpf1.substring(i,i+1) * x);
        x = x - 1;
    }
    
    dig2 = 11 - (soma % 11);
    
    if (dig2 == 10)
    {
        dig2 = 0;
    }
    if (dig2 == 11) 
    {
        dig2 = 0;
    }
    if ( (dig1 + "" + dig2) == numcpf.substring(len,len-2) ) 
    {
        return true;
    }
    
    return false;
}


function MIOLO_Validate_Check_EMAIL(email)
{
    var achou_ponto=false;
    var achou_arroba=false;
    var achou_caracter=false;
    
    for (var i=0; i<email.length; i++) 
    {
        if (email.charAt(i)=="@")
        { 
            if (email.charAt(i+1)==".")
            {
                achou_arroba=false;
            }
            else
            {
                achou_arroba=true;
            }
        }
        else if (email.charAt(i)==".") 
        {
            achou_ponto=true;
        }
        else if (email.charAt(i)!=" ") 
        {
            achou_caracter=true;
        }
    }
    
    if ((email.charAt(0)=="W" || email.charAt(0)=="w") &&
        (email.charAt(1)=="W" || email.charAt(1)=="w") &&
        (email.charAt(2)=="W" || email.charAt(2)=="w") &&
        (email.charAt(3)=="."))
        {
            achou_ponto=false;
            achou_caracter=false;
        }
        
        if(email.charAt(email.length-1)==".")
        {
            achou_ponto=false;
        }	
        
        return (achou_ponto && achou_arroba && achou_caracter);
}

function MIOLO_Validate_Check_DATEDMY(date)
{
    var pos1 = date.indexOf('/');
	var pos2 = date.indexOf('/', pos1+1);

	var strD = date.substring(0,pos1);
	var strM = date.substring(pos1+1,pos2);
	var strY = date.substring(pos2+1);
    
    return ( isDate( strM + '/' + strD + '/' + strY ) == true);
}


function MIOLO_Validate_Check_DATEYMD(date)
{
    var pos1 = date.indexOf('/');
	var pos2 = date.indexOf('/', pos1+1);

	var strY = date.substring(0,pos1);
	var strM = date.substring(pos1+1,pos2);
	var strD = date.substring(pos2+1);
    
    return ( isDate( strM + '/' + strD + '/' + strY ) == true );
}


function MIOLO_Validate_Check_TIME(time)
{
    var h = parseInt( time.substring(0,2) );
    var m = parseInt( time.substring(3,5) );
    
    return ( h >= 0 && h < 24 ) && ( m >= 0 && m < 60 );
}

 /*
 ** DHTML date validation script. 
 ** Courtesy of SmartWebby.com (http://www.smartwebby.com/dhtml/)
 */
 function isInteger(s)
 {
	var i;
    for ( i = 0; i < s.length; i++ )
    {   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9")))
        {
            return false;
        }
    }
    // All characters are numbers.
    return true;
}


function stripCharsInBag(s, bag)
{
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++)
    {   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year)
{
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}

function DaysArray(n)
{
	for ( var i = 1; i <= n; i++ ) 
    {
		this[i] = 31;
		if ( i==4 || i==6 || i==9 || i==11 ) 
        {
            this[i] = 30;
        }
		if ( i == 2 )
        {
            this[i] = 29;
        }
   } 
   return this;
}

function isDate(dtStr)
{
    dtCh= "/";
    minYear=1900;
    maxYear=2100;

	var daysInMonth = DaysArray(12);
	var pos1        = dtStr.indexOf(dtCh);
	var pos2        = dtStr.indexOf(dtCh,pos1+1);
	var strMonth    = dtStr.substring(0,pos1);
	var strDay      = dtStr.substring(pos1+1,pos2);
	var strYear     = dtStr.substring(pos2+1);
	var strYr       = strYear;
    
	if ( strDay.charAt(0) == "0" && strDay.length>1 ) 
    {
        strDay=strDay.substring(1);
    }
	
    if ( strMonth.charAt(0) == "0" && strMonth.length>1 ) 
    {
        strMonth=strMonth.substring(1);
    }
    
	for ( var i = 1; i <= 3; i++ )
    {
		if ( strYr.charAt(0) == "0" && strYr.length>1 ) 
        {
            strYr=strYr.substring(1);
        }
	}
	
    var month = parseInt(strMonth);
	var day   = parseInt(strDay);
	var year  = parseInt(strYr);
    
	if ( pos1==-1 || pos2==-1 )
    {
		return "The date format should be : mm/dd/yyyy";
	}
    
  	if ( strDay.length < 1 || day < 1 || day > 31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month] )
    {
		return "O Dia informado é inválido. \n(Please enter a valid day.)";
	}
    
	if ( strMonth.length < 1 || month < 1 || month > 12 )
    {
		return "O Mês informado é inválido. \n(Please enter a valid month.)";
	}
    
	if ( strYear.length != 4 || year==0 || year<minYear || year>maxYear )
    {
		return "O Ano deve conter 4 dígitos e estar entre "+minYear+" e "+maxYear+"\n(Please enter a valid 4 digit year between "+minYear+" and "+maxYear+")";
	}
    
	if ( dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false )
    {
		return "Informe uma data válida.";
	}
    
    return true;
}

function MIOLO_Validate_Check_Required(value)
{
	if ( value.length > 0 )
    {
        return true;
    }
    return false;
}