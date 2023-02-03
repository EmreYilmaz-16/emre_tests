<cffunction name="TLFormat" returntype="string" output="false">
    <!--- <cfargument name="money" type="numeric" required="true"> sorunlar duzelince alttaki yerine acilacak--->
    <cfargument name="money">
    <cfargument name="no_of_decimal" required="no" default="2">
    <cfargument name="is_round" type="boolean" required="no" default="true">
    <cfscript>
    /*if (not len(arguments.money)) return 0;*/
    if (not len(arguments.money)) return '';
    arguments.money = trim(arguments.money);
    if (arguments.money contains 'E') arguments.money = ReplaceNoCase(NumberFormat(arguments.money),',','','all');
    if (arguments.money contains '-'){
        negativeFlag = 1;
        arguments.money = ReplaceNoCase(arguments.money,'-','','all');}
    else negativeFlag = 0;
    if(not isnumeric(arguments.no_of_decimal)) arguments.no_of_decimal= 2;	
    nokta = Find('.', arguments.money);
    if (nokta)
        {
        if(arguments.is_round) /* 20050823 and arguments.no_of_decimal */ 
        {
            rounded_value = CreateObject("java", "java.math.BigDecimal");
            rounded_value.init(arguments.money);
            rounded_value = rounded_value.setScale(arguments.no_of_decimal, rounded_value.ROUND_HALF_UP);
            rounded_value = rounded_value.toString();
            if(rounded_value contains '.') /*10.00 degeri yerine 10 dondurmek icin*/
            {
                if(listlast(rounded_value,'.') eq 0)
                    rounded_value = listfirst(rounded_value,'.');
            }
            arguments.money = rounded_value;
            if (arguments.money contains 'E') 
            {
                first_value = listgetat(arguments.money,1,'E-');
                first_value = ReplaceNoCase(first_value,',','.');
                last_value = ReplaceNoCase(listgetat(arguments.money,2,'E-'),'0','','all');
                for(kk_float=1;kk_float lte last_value;kk_float=kk_float+1)
                {
                    zero_info = ReplaceNoCase(first_value,'.','');
                    first_value = '0.#zero_info#';
                }
                arguments.money = first_value;
                first_value = listgetat(arguments.money,1,'.');
                arguments.money = "#first_value#.#Left(listgetat(arguments.money,2,'.'),8)#";
                if(arguments.money lt 0.00000001) arguments.money = 0;
                if(Find('.', arguments.money))
                {
                    arguments.money = "#first_value#,#Left(listgetat(arguments.money,2,'.'),8)#";
                    return arguments.money;
                }
            }
        }
        if(arguments.money neq 0) nokta = Find('.', arguments.money);
        if(ceiling(arguments.money) neq arguments.money){
            tam = ceiling(arguments.money)-1;
            onda = Mid(arguments.money, nokta+1,arguments.no_of_decimal);
            if(len(onda) lt arguments.no_of_decimal)
                onda = onda & RepeatString(0,arguments.no_of_decimal-len(onda));
            }
        else{
            tam = arguments.money;
            onda = RepeatString(0,arguments.no_of_decimal);}
        }
    else{
        tam = arguments.money;
        onda = RepeatString(0,arguments.no_of_decimal);
        }
    textFormat='';
    t=0;
    if (len(tam) gt 3) 
        {
        for (k=len(tam); k; k=k-1)
            {
            t = t+1;
            if (not (t mod 3)) textFormat = '.' & mid(tam, k, 1) & textFormat; 
            else textFormat = mid(tam, k, 1) & textFormat;
            } 
        if (mid(textFormat, 1, 1) is '.') textFormat =  "#right(textFormat,len(textFormat)-1)#,#onda#";
        else textFormat =  "#textFormat#,#onda#";
        }
    else
        textFormat = "#tam#,#onda#";
        
    if (negativeFlag) textFormat =  "-#textFormat#";
    
    if (not arguments.no_of_decimal) 
        textFormat = ListFirst(textFormat,',');
    return textFormat;
    </cfscript>
</cffunction>