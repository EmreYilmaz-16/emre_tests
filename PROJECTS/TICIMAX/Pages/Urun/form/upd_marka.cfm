<cfparam name="attributes.id" default="11">

<cfscript>
  UrunServis= createObject("component","#TicimaxServicePath#.marka_servis");
  Markalar=UrunServis.getMarka(attributes.id);
  Marka=Markalar[1];
</cfscript>


<cfform method="post" action="#request.self#?fuseaction=#attributes.fuseaction#&id=#attributes.ID#">
  <input type="hidden" name="is_submit" value="1">
  <cfoutput>
  <div class="form-group">
     <!--- <select name="Aktif">
        <option <cfif Marka.AKTIF eq "true">selected</cfif> value="1">Aktif</option>
        <option <cfif Marka.AKTIF eq "false">selected</cfif> value="0">Pasif</option>
      </select>      ----->
      <input type="radio" name="Aktif" value="true">Aktif
      <input type="radio" name="Aktif" value="false">Pasif
  </div>
  <div class="form-group">
    <label>Marka Adı</label>
    <input type="text" name="Tanim" value="#Marka.TANIM#">
  </div>
  <div class="form-group">
    <label>Tanım 2</label>
    <input type="text" name="Breadcrumb" value="#Marka.Breadcrumb#">
  </div>
  <div class="form-group">
    <label>İçerik</label>
    <textarea name="Icerik">#Marka.Icerik#</textarea>
  </div>
  <div class="form-group">
    <label>Seo Anahtar Kelime</label>
    <input type="text" name="SeoAnahtarKelime" value="#Marka.SEOANAHTARKELIME#">
  </div>
  <div class="form-group">
    <label>Seo Sayfa Açıklama</label>
    <textarea name="SeoSayfaAciklama">#Marka.SEOSAYFAACIKLAMA#</textarea>
  </div>
  <div class="form-group">
    <label>Seo Sayfa Başlık</label>
    <input type="text" name="SeoSayfaBaslik" value="#Marka.SeoSayfaBaslik#">
    
  </div>
</cfoutput>
<input  type="submit">
</cfform>

<cfif isDefined("attributes.is_submit")>
 <cfset Marka_.Tanim=attributes.tanim>
 <cfset Marka_.SeoAnahtarKelime=attributes.SeoAnahtarKelime>
 <cfset Marka_.SEOSAYFAACIKLAMA=attributes.SEOSAYFAACIKLAMA>
 <cfset Marka_.SeoSayfaBaslik=attributes.SeoSayfaBaslik>
 <cfset Marka_.Breadcrumb=attributes.Breadcrumb>
 <cfset Marka_.AKTIF=attributes.Aktif>
 <cfset Marka_.Icerik=attributes.Icerik>
  <cfscript>
    UrunServis= createObject("component","#TicimaxServicePath#.marka_servis");
    Markalar=UrunServis.SaveMarka(attributes.id,Marka_);    
  </cfscript>


</cfif>





 