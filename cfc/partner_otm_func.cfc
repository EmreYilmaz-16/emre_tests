<cfcomponent>
	<cfset dsn = application.systemParam.params().dsn>
    
    <!--- Genel --->
    <cffunction name="GetCuuretCurrencyVal" access="remote" returnType="string" returnFormat="JSON">
        <cfargument  name="currParam">
        <cfquery name="GetCurr" datasource="#dsn#">
        select * from w3Partner.SETUP_MONEY where RECORD_DATE =(select MAX(RECORD_DATE) from w3Partner.SETUP_MONEY WHERE MONEY='#currParam#') and  MONEY='#currParam#'
        </cfquery>

        <cfreturn "#GetCurr.RATE2#">
    </cffunction>

    <cffunction name="getProductWithBarcode" access="remote" returnType="string" returnFormat="JSON">
        <cfargument  name="product_barcode">
        <cfquery name="getProduct" datasource="#dsn#">
                select P.BARCOD,PU.PRODUCT_UNIT_ID,PRODUCT_NAME,TAX,PC.PRICE,PC.PRICE_KDV,S.STOCK_ID,S.PRODUCT_ID,PU.MAIN_UNIT from w3Partner.w3Partner_product.PRODUCT AS P
                LEFT JOIN w3Partner.w3Partner_product.STOCKS AS S ON S.PRODUCT_ID=P.PRODUCT_ID
                LEFT JOIN w3Partner.w3Partner_product.PRICE_STANDART AS PC ON PC.PRODUCT_ID=S.PRODUCT_ID
                LEFT JOIN w3Partner.w3Partner_product.PRODUCT_UNIT AS PU ON PU.PRODUCT_ID=P.PRODUCT_ID
                WHERE PC.PRICESTANDART_STATUS=1 AND PC.PURCHASESALES=1 --AND P.PRODUCT_ID=4233
                AND PRICE_KDV>0 AND P.BARCOD='#arguments.product_barcode#'

        </cfquery> 
        <cfset retWal=structNew()>
        <cfset RetWal.RecordCount=getProduct.recordcount>
        <cfscript>
            Product={
                PRODUCT_NAME:getProduct.PRODUCT_NAME,
                PRODUCT_ID:getProduct.PRODUCT_ID,
                STOCK_ID:getProduct.STOCK_ID,
                BARCOD:getProduct.BARCOD,
                PRODUCT_UNIT_ID:getProduct.PRODUCT_UNIT_ID,
                TAX:getProduct.TAX,
                PRICE:getProduct.PRICE,
                PRICE_KDV:getProduct.PRICE_KDV,
                MAIN_UNIT:getProduct.MAIN_UNIT
                

            };
        </cfscript>
        <cfset retWal.data=Product>
<cfreturn Replace(SerializeJSON(retWal),'//','')>
    </cffunction>

</cfcomponent>