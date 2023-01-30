<cfcomponent>
    <cfset web_service_url="https://ashleyturkiye.ticimaxtest.com/Servis/UrunServis.svc">
    <cfset UyeKodu="W7JB3M4QAJO0PFW28RV46EP6FLVR7K">
    <cffunction name="getMarka" access="remote">
        <cfargument name="Id" default="">        
        <cfxml variable="marka_data"><cfoutput>
            <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">
                <soapenv:Header/>
                <soapenv:Body>
                <tem:SelectMarka>        
                    <tem:UyeKodu>#UyeKodu#</tem:UyeKodu>
                    <cfif len(arguments.Id)>
                        <tem:markaID>#arguments.Id#</tem:markaID>
                    </cfif>
                </tem:SelectMarka>
                </soapenv:Body>
            </soapenv:Envelope></cfoutput>
        </cfxml>
        <cfhttp url="#web_service_url#" method="post" result="httpResponse">
        <cfhttpparam type="header" name="content-type" value="text/xml">
        <cfhttpparam type="header" name="SOAPAction" value="http://tempuri.org/IUrunServis/SelectMarka">
        <cfhttpparam type="header" name="content-length" value="#len(marka_data)#">
        <cfhttpparam type="header" name="charset" value="utf-8">
        <cfhttpparam type="xml" name="message" value="#trim(marka_data)#">
        </cfhttp>
        <cfsavecontent  variable="control5">
            <cfdump var="#httpResponse#">
             </cfsavecontent>
             <cffile action="write" file = "c:\getMarka_01.html" output="#control5#"></cffile>
        <cfset ARR_Marka=arrayNew(1)>
        <cftry>
            <cfset Markalar = xmlParse(httpResponse.filecontent)>
            <cfset Markalar = Markalar.Envelope.Body.SelectMarkaResponse.SelectMarkaResult.XmlChildren>
            <cfset markaCount=arraylen(Markalar)>
            <cfloop from="1" to="#markaCount#" index="i">
                <cfset Marka = Markalar[i]>
                <cfscript>
                    Marka_={
                        Aktif:Marka.Aktif.XmlText,
                        Breadcrumb:Marka.Breadcrumb.XmlText,
                        EklemeTarihi:Marka.EklemeTarihi.XmlText,
                        GuncellemeTarihi:Marka.GuncellemeTarihi.XmlText,
                        ID:Marka.ID.XmlText,
                        Icerik:Marka.Icerik.XmlText,
                        Resim:Marka.Resim.XmlText,
                        SeoAnahtarKelime:Marka.SeoAnahtarKelime.XmlText,
                        SeoSayfaAciklama:Marka.SeoSayfaAciklama.XmlText,
                        SeoSayfaBaslik:Marka.SeoSayfaBaslik.XmlText,
                        Sira:Marka.Sira.XmlText,
                        Tanim:Marka.Tanim.XmlText,
                        Url:Marka.Url.XmlText
                    };
                    arrayAppend(ARR_Marka,Marka_)
                </cfscript>
            </cfloop>
            <cfreturn ARR_Marka>
        <cfcatch>
            <cfsavecontent  variable="control5">
              <cfdump var="#cfcatch#">
               </cfsavecontent>
               <cffile action="write" file = "c:\getMarka.html" output="#control5#"></cffile>
            <cfreturn ARR_Marka>
        </cfcatch>
        </cftry>
    </cffunction>
    <cffunction name="SaveMarka">
        <cfargument name="MarkaId" default="">
        <cfargument name="Marka">
        <cfxml variable="marka_data"><cfoutput>
            <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:ns="http://schemas.datacontract.org/2004/07/">
                <soapenv:Header/>
                <soapenv:Body>
                    <tem:SaveMarka>
                        <!--Optional:-->
                        <tem:UyeKodu>#UyeKodu#</tem:UyeKodu>
                        <!--Optional:-->
                        <tem:marka>
                            <!--Optional:-->
                            <ns:Aktif>#arguments.Marka.Aktif#</ns:Aktif>                    
                            <cfif len(arguments.MarkaId)><ns:ID>#arguments.MarkaId#</ns:ID></cfif>            
                            <ns:SeoAnahtarKelime>#arguments.Marka.SeoAnahtarKelime#</ns:SeoAnahtarKelime>
                            <!--Optional:-->
                            <ns:SeoSayfaAciklama>#arguments.Marka.SeoSayfaAciklama#</ns:SeoSayfaAciklama>
                            <!--Optional:-->
                            <ns:SeoSayfaBaslik>#arguments.Marka.SeoSayfaBaslik#</ns:SeoSayfaBaslik>            
                            <ns:Tanim>#arguments.Marka.Tanim#</ns:Tanim> 
                            <ns:Icerik>#arguments.Marka.Icerik#</ns:Icerik>
                            <ns:Breadcrumb>#arguments.Marka.Breadcrumb#</ns:Breadcrumb>                       
                        </tem:marka>
                    </tem:SaveMarka>
                </soapenv:Body>
            </soapenv:Envelope></cfoutput>
        </cfxml>
        <cfhttp url="#web_service_url#" method="post" result="httpResponse">
            <cfhttpparam type="header" name="content-type" value="text/xml">
            <cfhttpparam type="header" name="SOAPAction" value="http://tempuri.org/IUrunServis/SaveMarka">
            <cfhttpparam type="header" name="content-length" value="#len(marka_data)#">
            <cfhttpparam type="header" name="charset" value="utf-8">
            <cfhttpparam type="xml" name="message" value="#trim(marka_data)#">
        </cfhttp>
        <cfreturn httpResponse>
    </cffunction>
</cfcomponent>