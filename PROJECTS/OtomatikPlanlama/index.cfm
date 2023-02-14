<cfset request.self="/PROJECTS/OtomatikPlanlama/index.cfm">

<cfquery name="getData" datasource="#dsn#">
    SELECT  * FROM Tablo1
</cfquery>



<cfset HNo=week(now(),"ISO")>
<cfloop query="getData">
    <cfset DETAY=DETAIL>
    <cfset AktifHafta=AktifHaftaGetir(BRAND_ID,DETAY,HNo,2022,QUANTITY)>        
    <cfquery name="Upd" datasource="#dsn#">
        UPDATE WEEK_PBS_001 SET TOTAL_AMOUNT=TOTAL_AMOUNT+#QUANTITY# WHERE ID=#AktifHafta#
    </cfquery>
    <cfoutput>
<table border="1">    
    <tr>
        <th>Aktfi Hafta</th>
        <th>Miktar</th>
        <th>Marka</th>
        <th>Hafta No</th>
        <th>Max</th>
    </tr>
    <TR>
       
        <td>
            #AktifHafta#
        </td>
        <td>#QUANTITY#</td>
        <td>#BRAND_ID#</td>
        <td>#HNo#</td>
        <td>#DETAY#</td>
    </TR>
</table>  </cfoutput>  
</cfloop>

<cffunction name="AktifHaftaGetir">
    <cfargument name="BRAND_ID">
    <cfargument name="DETAIL">
    <cfargument name="HAFTA_NO">
    <cfargument name="HAFTA_YIL">
    <cfargument name="QUANTITY">
    <cfset AktifHafta=0>
    <cfquery name="HaftaVarmi" datasource="#dsn#">
         SELECT TOP 1 * FROM WEEK_PBS_001 WHERE 1=1
            AND BRAND_ID=#arguments.BRAND_ID#
            AND WEEK_NUMBER = #arguments.HAFTA_NO#  
            AND WEEK_YEAR = #arguments.HAFTA_YIL#  
    </cfquery>
    <cfif HaftaVarmi.recordCount>
        <cfif HaftaVarmi.IS_CLOSED_ACT eq 1 or HaftaVarmi.IS_CONVERT_REAL eq 1>
            <cfset arguments.HAFTA_NO=arguments.HAFTA_NO+1>
            <cfset AktifHafta=AktifHaftaGetir(arguments.BRAND_ID,arguments.DETAIL,arguments.HAFTA_NO,arguments.HAFTA_YIL,arguments.QUANTITY)>
        <cfelse>
            <cfif (HaftaVarmi.TOTAL_AMOUNT+arguments.QUANTITY) lt arguments.DETAIL>
                <cfset AktifHafta=HaftaVarmi.ID>
                <cfreturn AktifHafta>
            <cfelse>
                <cfscript>
                    closeWeek(HaftaVarmi.Id);
                </cfscript>
                <cfset arguments.HAFTA_NO=arguments.HAFTA_NO+1>
                <cfset AktifHafta=AktifHaftaGetir(arguments.BRAND_ID,arguments.DETAIL,arguments.HAFTA_NO,arguments.HAFTA_YIL,arguments.QUANTITY)>
            </cfif>

        </cfif>
    <cfelse>
        <cfset AktifHafta=HaftaAc(arguments.BRAND_ID,arguments.HAFTA_NO,arguments.HAFTA_YIL)>
    </cfif>
<cfreturn AktifHafta>
</cffunction>

<cffunction name="HaftaAc">
    <cfargument name="BRAND_ID">    
    <cfargument name="HAFTA_NO">
    <cfargument name="HAFTA_YIL">
    <cfquery name="MakeHafta" datasource="#dsn#" result="Res">
        INSERT INTO WEEK_PBS_001 (WEEK_NUMBER,IS_CONVERT_REAL,TOTAL_AMOUNT,BRAND_ID,IS_CLOSED_ACT,WEEK_YEAR)
        VALUES (#arguments.HAFTA_NO#,0,0,#arguments.BRAND_ID#,0,#arguments.HAFTA_YIL#)
    </cfquery>
<cfreturn Res.IDENTITYCOL>
</cffunction>
<cffunction name="closeWeek">
    <cfargument name="ID">
    <cfquery name="upd" datasource="#dsn#">
        UPDATE WEEK_PBS_001 SET IS_CLOSED_ACT=1 WHERE ID=#arguments.ID#
    </cfquery>
</cffunction>

    <!---[ID] [int] IDENTITY(1,1) NOT NULL,
	[WEEK_NUMBER] [int] NULL,
	[IS_CONVERT_REAL] [bit] NULL,
	[TOTAL_AMOUNT] [float] NULL,
	[BRAND_ID] [int] NULL,
	[IS_CLOSED_ACT] [bit] NULL,
	[WEEK_YEAR] [int] NULL,--->


    <cffunction name="AktifHaftaGetirMe">
        <cfargument name="BRAND_ID">
        <cfargument name="DETAIL">
        <cfargument name="HAFTA_NO">
        <cfargument name="HAFTA_YIL">
        <cfargument name="QUANTITY">
        <cfset AktifHafta=0>
        
        <cfquery name="HaftaVarmi" datasource="#dsn#">
            SELECT TOP 1 * FROM WEEK_PBS_001 WHERE 1=1
            AND BRAND_ID=#arguments.BRAND_ID#
            AND WEEK_NUMBER = #arguments.HAFTA_NO#  
            AND WEEK_YEAR = #arguments.HAFTA_YIL#  
        </cfquery>
        <cfif HaftaVarmi.recordCount>
            <cfquery name="HaftaDurum" datasource="#dsn#">
                SELECT TOP 1 * FROM WEEK_PBS_001 WHERE 1=1 
                AND ID=#HaftaVarmi.ID#
                AND TOTAL_AMOUNT+#arguments.QUANTITY# < #arguments.DETAIL#
            </cfquery>
            <cfif HaftaDurum.recordCount>
                <cfset AktifHafta=HaftaDurum.ID>
                <cfquery name="lst" datasource="#dsn#">
                        SELECT * FROM WEEK_PBS_001 WHERE WEEK_NUMBER > #arguments.HAFTA_NO# AND  WEEK_YEAR>#arguments.HAFTA_YIL# AND IS_CLOSED_ACT =0
                </cfquery>
                <cfif lst.recordCount>
                    <cfset AktifHafta=HaftaDurum.ID>
                <cfelse>
                    <cfscript>
                       
                    </cfscript>
                </cfif>

            <cfelse>
                
            </cfif>
        
        <cfelse>
            <cfquery name="MakeHafta" datasource="#dsn#" result="Res">
                        INSERT INTO WEEK_PBS_001 (WEEK_NUMBER,IS_CONVERT_REAL,TOTAL_AMOUNT,BRAND_ID,IS_CLOSED_ACT,WEEK_YEAR)
                        VALUES (#arguments.HAFTA_NO#,0,0,#arguments.BRAND_ID#,0,#arguments.HAFTA_YIL#)
            </cfquery>
            <cfdump var="#Res.IDENTITYCOL#">
            <cfset AktifHafta=Res.IDENTITYCOL>
        </cfif>                       
        <cfreturn AktifHafta>
    </cffunction>