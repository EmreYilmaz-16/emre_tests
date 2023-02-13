<cfset request.self="/PROJECTS/MyWallet/index.cfm">
<cfset PROJECT_PATH="/PROJECTS/MyWallet/">
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous">
    </script>
    
</head>

<body>
<div class="container">
   <div class="row">
    <div class="col col-3"
    <cfquery name="getAccTypes" datasource="#dsn#">
        SELECT * FROM ACCOUNT_TYPES
    </cfquery>
<table class="table table-sm table-striped">
<cfoutput query="getAccTypes">
    <tr>
        <th colspan="2">
            #ACCOUNT_TYPE#
        </th>
    </tr>
    <tr>
        <td style="width:15px"></td>
        <td>
            <table class="table table-sm table-striped">
                <cfquery name="getAcc" datasource="#dsn#">
                    SELECT * FROM ACCOUNTS WHERE ACCOUNT_TYPE_ID=#ACCOUNT_TYPE_ID#
                </cfquery>
                <cfset ttl=0>
                <cfloop query="getAcc">
                    <cfquery name="getQ" datasource="#dsn#">
                        SELECT SUM (AMOUNT) as AMOUNT FROM(
                            SELECT  * FROM (
                            SELECT A1.ACCOUNT_NAME AS AC_1,A2.ACCOUNT_NAME AS AC_2,EC.EXPENSE_CAT,PT.PROCESS_TYPE_ID,PT.PROCESS_TYPE,A1.MONEY M1,A2.MONEY M2,
                            IOO.FROM_ACCOUNT,IOO.TO_ACCOUNT,IOO.DESCRIPTION

                            ,
                            CASE WHEN PT.PROCESS_TYPE_ID =1 THEN AMOUNT
                            WHEN IOO.FROM_ACCOUNT=#getAcc.ACCOUNT_ID# THEN -1*AMOUNT WHEN IOO.TO_ACCOUNT=#getAcc.ACCOUNT_ID# THEN AMOUNT
                            END AS AMOUNT
                            FROM INCOME_OUTGOING AS IOO
                            LEFT JOIN ACCOUNTS AS A1 ON A1.ACCOUNT_ID=IOO.FROM_ACCOUNT
                            LEFT JOIN ACCOUNTS AS A2 ON A2.ACCOUNT_ID=IOO.TO_ACCOUNT
                            LEFT JOIN EXPENSE_CATS AS EC ON EC.EXPENSE_CAT_ID=IOO.EXPENSE_CAT
                            LEFT JOIN PROCESS_TYPES AS PT ON PT.PROCESS_TYPE_ID=IOO.PROCESS_TYPE
                            ) AS T WHERE FROM_ACCOUNT=#getAcc.ACCOUNT_ID# OR TO_ACCOUNT=#getAcc.ACCOUNT_ID#
                        ) AS T2
                    </cfquery>
                    <tr onclick="getData(this,#getAcc.ACCOUNT_ID#)">
                        <td  style="width:85%" <cfif getQ.AMOUNT lt 0>class="text-danger"<cfelseif getQ.AMOUNT gt 0>class="text-success"<cfelse>class="text-dark"</cfif> >#ACCOUNT_NAME#</td>
                        <td style="width:10%;text-align:right" <cfif getQ.AMOUNT lt 0>class="text-danger"<cfelseif getQ.AMOUNT gt 0>class="text-success"<cfelse>class="text-dark"</cfif> >#TLFormat(getQ.AMOUNT)#</td>
                        <td style="width:5%" <cfif getQ.AMOUNT lt 0>class="text-danger"<cfelseif getQ.AMOUNT gt 0>class="text-success"<cfelse>class="text-dark"</cfif>>#getAcc.MONEY#</td>
                    </tr>
                </cfloop>
            </table>
        </td>
    </tr>
</cfoutput>
</table>
</div>
<div class="col col-9" id="detay">

</div>
</div>
</div>
<script>
var loader_div_message_="Yükleniyor..."
var deger_ = 0;
    function getData(el,id) {
        console.log(arguments)
        AjaxPageLoad("Projects/MyWallet/Pages/getAccDetail.cfm?ACCOUNT_ID="+id,"detay")
    }
    function AjaxPageLoad(url,target,error_detail,loader_message,li_id,loadFunction,xml){
	if(xml)
		xml = 1;
	else
		xml = 0;
		if($("#"+target).css('display') != 'none' || xml == 1)
		{
			function ajax_tab(li_id)
				{
					var ullist=li_id.parentNode.getElementsByTagName("li");//gelen li nin üstü olan ul nin içinde olan li lerin listesi
					for (var i=0; i < ullist.length; i++) //ul içindeki lileri döndürüyoruz
					{
						if(li_id.id == ullist[i].id)//eğer tıklanan  li_id ise classını değiştiriyoruz.
						ullist[i].className="selected";
						else//degilse classını boşaltıyoruz.
						ullist[i].className=""
					}
				}
			function set_html(target,html)
				{
					deger_ = deger_ + 1;
					//object gönderilmişse, AJAX windowa content yüklenecek demektir.
					if(typeof(target) == 'object')
					{
						target.setBody(html);
						target.render();
						target.center();
					//IDsi gönderilen elemente yüklenecek demektir
					} else 
						{
							try
							{
							document.getElementById(target).innerHTML = html;
							}
							catch(err)
							{
							return false;
							}
						}
				}
			var ajaxConn=GetAjaxConnector();		
			var url_len=list_len(url,'=');
			if(url_len > 3)
				{
				new_url = list_getat(url,1,'&');
				for(u_l=2;u_l<=url_len;u_l++)
					{
						var new_variable = list_getat(list_getat(url,u_l,'&'),1,'=');
						var new_value = encodeURIComponent(list_getat(list_getat(url,u_l,'&'),2,'='));
						new_url += ( new_variable != '' || (new_variable != '' && new_value != '') ) ? '&'+new_variable+'='+new_value : "";
					}
				}
			else
				{
				new_url = url;
				}
			var new_url = new_url + '&ajax=1&ajax_box_page=1&isAjax=1';
			var request=AjaxRequest(ajaxConn,new_url,"get", null, function() {
				if ((ajaxConn.readyState==4 && ajaxConn.status == 200)) {
					if(li_id)//li id gönderilmiş ise
					ajax_tab(li_id);
					set_html(target, ajaxConn.responseText.replace(/\u200B/g,''));
					ajax_request_script(ajaxConn.responseText.replace(/\u200B/g,''));
					if(loadFunction)
						window[loadFunction]();
				} else if (ajaxConn.readyState==4) {
					if (error_detail == true) {
						set_html(target, ajaxConn.responseText.replace(/\u200B/g,''));
					} else {
						set_html(target, '<strong style="color:red">Hata Oluştu</strong>');
					}
				}
			});
			if(request) {
				if(loader_message == undefined) loader_message = loader_div_message_;
				set_html(target,'<div id="divPageLoad"><?xml version="1.0" encoding="utf-8"?><svg width="32px" height="32px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid" class="uil-ring-alt"><rect x="0" y="0" width="100" height="100" fill="none" class="bk"></rect><circle cx="50" cy="50" r="40" stroke="rgba(255,255,255,0)" fill="none" stroke-width="10" stroke-linecap="round"></circle><circle cx="50" cy="50" r="40" stroke="#ff8a00" fill="none" stroke-width="6" stroke-linecap="round"><animate attributeName="stroke-dashoffset" dur="2s" repeatCount="indefinite" from="0" to="502"></animate><animate attributeName="stroke-dasharray" dur="2s" repeatCount="indefinite" values="150.6 100.4;1 250;150.6 100.4"></animate></circle></svg></div>');
				return true;
			} else {
				return false;
			}
		}
}
function GetAjaxConnector() {
	// Kullanım: myAjaxConnector = GetAjaxConnector();
    var xmlHttp=null;
    try{
        // Firefox, Opera 8.0+, Safari
        xmlHttp=new XMLHttpRequest();
    }catch (e){
        // Internet Explorer
        try{
            xmlHttp=new ActiveXObject('Msxml2.XMLHTTP');
        }catch (e){
            xmlHttp=new ActiveXObject('Microsoft.XMLHTTP');
        }
    }
	if (xmlHttp==null) {
		alert ('Tarayıcınız Ajax Desteklemiyor!');
		return;
    }
    return xmlHttp;
}
function list_len(gelen,delim)
/* cf deki listlen in javascript hali*/
{
	var gelen = gelen.toString();
	if(!delim) delim = ',';
	if(gelen.length == 0)
		return 0;
	else
		return gelen.split(delim).length;
}
function AjaxRequest(ajaxConnector,url,method,data,callback) {
	
	if (ajaxConnector!=null)
	{
		if(url.indexOf('&ajax=1') == -1)
			ajaxUrl = '&ajax=1&';
		else
			ajaxUrl = '';

		if (data != null)
			if(method.toLowerCase() == 'get') dataUrl = data;
			else dataUrl = '';
		else
			dataUrl = '';
		if(url.substr(0,4) == 'http')
			ajaxConnector.open(method,url+ajaxUrl+dataUrl, true);
		else
			ajaxConnector.open(method,'/'+url+ajaxUrl+dataUrl, true);
		ajaxConnector.setRequestHeader('If-Modified-Since', 'Sat, 1 Jan 2000 00:00:00 GMT');
		ajaxConnector.setRequestHeader('Content-Type','application/x-www-form-urlencoded; charset=utf-8');
/*		if (data != null) {
			ajaxConnector.setRequestHeader('Content-length', data.length);//alert(data);//form ile gelen değerleri görmek için alert'i açın eksik değer varmı kontrol edebilirsiniz.;
		}
*/
		/*ajaxConnector.setRequestHeader('Connection', 'close');*/ //bu case 25 ekim 2011 de yunus ozay tarafından kaldirildi
		/*
		Bu satır önemlidir. Zira, ColdFusion is_ajax_requesy() fonksiyonu, gelen bu request'i inceler.
		Aşağıdaki header sayesinde, request'in bir ajax request olduğuna karar verir
		*/
		ajaxConnector.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		ajaxConnector.onreadystatechange=callback;
		ajaxConnector.send(data);
		return true;
	}
	return false;
}
function ajax_request_script(html){
	var hd = document.getElementsByTagName("head")[0];
	var re = /(?:<script([^>]*)?>)((\n|\r|.)*?)(?:<\/script>)/ig;
	var srcRe = /\ssrc=([\'\"])(.*?)\1/i;
	var typeRe = /\stype=([\'\"])(.*?)\1/i;
	var match;
	while(match = re.exec(html)){
		var attrs = match[1];
		var srcMatch = attrs ? attrs.match(srcRe) : false;
		var htmlTemplate = attrs ? attrs.match(typeRe) : false;
		var textToEval = "";
		if (htmlTemplate && htmlTemplate[2] == "text/html") {}
		else if(srcMatch && srcMatch[2]){
			var scriptFound = false;
			for(pageScripts=0;pageScripts<window.document.scripts.length;pageScripts++)
			//Ajax olarak açılan sayfa ile belgedeki sayfa arasında aynı scriptler iki kere yüklenebiliyor. Bu durumda hata veriyordu diye for case'i kurulup tekrarlanan scriptler engellendi.
			{
				if(!scriptFound && window.document.scripts[pageScripts].src.indexOf(srcMatch[2]) > 0 && (srcMatch[2].indexOf('cfform.js') != -1 || srcMatch[2].indexOf('masks.js') != -1))
				{
					scriptFound = true;
					break;
				}
			}
			if (!scriptFound) {
				var s = document.createElement("script");
				s.src = srcMatch[2];
				var typeMatch = attrs.match(typeRe);
				if(typeMatch && typeMatch[2]){
				s.type = typeMatch[2];
				}
				hd.appendChild(s);
			}
		}else if(match[2] && match[2].length > 0){
			textToEval = match[2].replace("<!--", "").replace("-->", "").replace("//-->", "");
			if(window.execScript) { 
				window.execScript(textToEval);
			} else {
				window.eval(textToEval);
			}
		}
	}
	return html.replace(/(?:<script.*?>)((\n|\r|.)*?)(?:<\/script>)/ig, "");
}
</script>

    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous">
    </script>
</body>

</html>


