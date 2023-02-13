<cfquery name="getOrderRow" datasource="#dsn3#">
    SELECT  ORR.QUANTITY,P.PRODUCT_NAME,PB.BRAND_NAME,PB.DETAIL,PB.BRAND_ID FROM w3elsgs_1.ORDER_ROW AS ORR 
LEFT JOIN w3elsgs_1.ORDERS AS O ON ORR.ORDER_ID =O.ORDER_ID
LEFT JOIN w3elsgs_product.PRODUCT AS P ON P.PRODUCT_ID=ORR.PRODUCT_ID
LEFT JOIN w3elsgs_product.PRODUCT_CAT_BRANDS AS PCB ON PCB.PRODUCT_CAT_ID=P.PRODUCT_CATID
LEFT JOIN w3elsgs_product.PRODUCT_BRANDS AS PB ON PCB.BRAND_ID=PB.BRAND_ID
WHERE ORR.ORDER_ID >10000 AND O.PURCHASE_SALES=1 AND P.PRODUCT_CODE LIKE 'M.%'
ORDER BY BRAND_ID
</cfquery>



<cfset HNo=week(now(),"ISO")>
<cfloop query="getOrderRow">
    <cfset AktifHafta=AktifHaftaGetir(BRAND_ID,DETAIL,HNo,2022,QUANTITY)>
    <cfquery name="Upd" datasource="#dsn3#">
        UPDATE WEEK_PBS_001 SET TOTAL_AMOUNT=TOTAL_AMOUNT+#QUANTITY# WHERE ID=#AktifHafta#
    </cfquery>
    
Aktif Hafta =<cfdump var="#AktifHafta#"> <br>
</cfloop>

    <!---[ID] [int] IDENTITY(1,1) NOT NULL,
	[WEEK_NUMBER] [int] NULL,
	[IS_CONVERT_REAL] [bit] NULL,
	[TOTAL_AMOUNT] [float] NULL,
	[BRAND_ID] [int] NULL,
	[IS_CLOSED_ACT] [bit] NULL,
	[WEEK_YEAR] [int] NULL,--->


    <cffunction name="AktifHaftaGetir">
        <cfargument name="BRAND_ID">
        <cfargument name="DETAIL">
        <cfargument name="HAFTA_NO">
        <cfargument name="HAFTA_YIL">
        <cfargument name="QUANTITY">
        <cfset AktifHafta=0>
        
        <cfquery name="HaftaVarmi" datasource="#dsn3#">
            SELECT TOP 1 * FROM WEEK_PBS_001 WHERE 1=1
            AND BRAND_ID=#arguments.BRAND_ID#
            AND WEEK_NUMBER = #arguments.HAFTA_NO#  
            AND WEEK_YEAR = #arguments.HAFTA_YIL#  
        </cfquery>
        <cfif HaftaVarmi.recordCount>
            <cfquery name="HaftaDurum" datasource="#dsn3#">
                SELECT TOP 1 * FROM WEEK_PBS_001 WHERE 1=1 
                AND ID=#HaftaVarmi.ID#
                AND TOTAL_AMOUNT+#arguments.QUANTITY# < #arguments.DETAIL#
            </cfquery>
            <cfif HaftaDurum.recordCount>
                <cfset AktifHafta=HaftaDurum.ID>
                <cfquery name="lst" datasource="#dsn3#">
                        SELECT * FROM WEEK_PBS_001 WHERE WEEK_NUMBER > #arguments.HAFTA_NO# AND  WEEK_YEAR>#arguments.HAFTA_YIL# AND IS_CLOSED_ACT =0
                </cfquery>
                <cfif lst.recordCount>
                    <cfset AktifHafta=HaftaDurum.ID>
                <cfelse>
                    <cfscript>
                      //  AktifHaftaGetir(arguments.BRAND_ID,arguments.DETAIL,arguments.HAFTA_NO+1,arguments.HAFTA_YIL,arguments.QUANTITY)
                    </cfscript>
                </cfif>

            <cfelse>
                
            </cfif>
        
        <cfelse>
            <cfquery name="MakeHafta" datasource="#dsn3#" result="Res">
                        INSERT INTO WEEK_PBS_001 (WEEK_NUMBER,IS_CONVERT_REAL,TOTAL_AMOUNT,BRAND_ID,IS_CLOSED_ACT,WEEK_YEAR)
                        VALUES (#arguments.HAFTA_NO#,0,0,#arguments.BRAND_ID#,0,#arguments.HAFTA_YIL#)
            </cfquery>
            <cfdump var="#Res.IDENTITYCOL#">
            <cfset AktifHafta=Res.IDENTITYCOL>
        </cfif>                       
        <cfreturn AktifHafta>
    </cffunction>
