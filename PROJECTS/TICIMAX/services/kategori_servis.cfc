<cfcomponent>
    <cfset web_service_url="https://ashleyturkiye.ticimaxtest.com/Servis/UrunServis.svc">
    <cfset UyeKodu="W7JB3M4QAJO0PFW28RV46EP6FLVR7K">
    <cffunction name="getKategori" access="remote">
        <cfargument name="Id" default="">                
        <cfxml variable="Kategori_data"><cfoutput>
            <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">
            <soapenv:Header/>
            <soapenv:Body>
               <tem:SelectKategori>                  
                  <tem:UyeKodu>#UyeKodu#</tem:UyeKodu>
                  <cfif len(arguments.Id)>
                    <tem:kategoriID>#arguments.Id#</tem:kategoriID>
                </cfif>
               </tem:SelectKategori>
            </soapenv:Body>
         </soapenv:Envelope></cfoutput>
        </cfxml>
        <cfhttp url="#web_service_url#" method="post" result="httpResponse">
            <cfhttpparam type="header" name="content-type" value="text/xml">
            <cfhttpparam type="header" name="SOAPAction" value="http://tempuri.org/IUrunServis/SelectKategori">
            <cfhttpparam type="header" name="content-length" value="#len(Kategori_data)#">
            <cfhttpparam type="header" name="charset" value="utf-8">
            <cfhttpparam type="xml" name="message" value="#trim(Kategori_data)#">
        </cfhttp>
        <cfset Kategoriler = xmlParse(httpResponse.filecontent)>
        <cfset Kategoriler=Kategoriler.Envelope.Body.SelectKategoriResponse.SelectKategoriResult.XmlChildren>
        <cfset KategoriCount=arrayLen(Kategoriler)>
        <cfset KategoriArr=arrayNew(1)>
        <!---<cfset KategoriQuery=queryNew("Aktif,ID,Icerik,KategoriMenuGoster,Kod,PID,SeoAnahtarKelime,SeoSayfaAciklama,SeoSayfaBaslik,Sira,Tanim,Url","VARCHAR,VARCHAR,VARCH")>--->
<cfloop from="1" to="#KategoriCount#" index="i">
    <cfset Kategori=Kategoriler[i]>
    <cfscript>
        var Kategori_data={
            Aktif:Kategori.Aktif.XmlText,
            ID:Kategori.ID.XmlText,
            Icerik:Kategori.Icerik.XmlText,
            KategoriMenuGoster:Kategori.KategoriMenuGoster.XmlText,
            Kod:Kategori.Kod.XmlText,
            PID:Kategori.PID.XmlText,
            SeoAnahtarKelime:Kategori.SeoAnahtarKelime.XmlText,
            SeoSayfaAciklama:Kategori.SeoSayfaAciklama.XmlText,
            SeoSayfaBaslik:Kategori.SeoSayfaBaslik.XmlText,
            Sira:Kategori.Sira.XmlText,
            Tanim:Kategori.Tanim.XmlText,
            Url:Kategori.Url.XmlText
        };
        arrayAppend(KategoriArr,Kategori_data);
    </cfscript>
</cfloop>
<cfset DuzenlenmisArr=arrayNew(1)>
<cfloop array="#KategoriArr#" item="it" index="ix">
    <cfif it.PID eq 0>
        <cfscript>
            arrayAppend(DuzenlenmisArr,it);
            ArrayDeleteAt(myArray,i)
        </cfscript>
    </cfif>
</cfloop>

  <cfdump var="#DuzenlenmisArr#">
    </cffunction>
</cfcomponent>