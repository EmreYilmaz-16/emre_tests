<cfset request.self="/PROJECTS/TICIMAX/index.cfm">
<cfset PROJECT_PATH="/PROJECTS/TICIMAX/">
<cfset TicimaxServicePath="PROJECTS.TICIMAX.services">
<cfset ProjectId=1>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticimax</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous">
    </script>
    <link href="/PROJECTS/TICIMAX/css/main.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col col-2">
                <cfquery name="getFamilies" datasource="#dsn#">
                    SELECT * FROM FAMILIES WHERE PROJECT_ID=#ProjectId#
                </cfquery>
                <ul class="list-group">
                    <cfoutput query="getFamilies">
                    <li class="list-group-item">
                        #FAMILY_NAME#
                        <cfquery name="getModule" datasource="#dsn#">
                            SELECT * FROM MODULES WHERE FAMILY_ID=#FAMILY_ID#
                        </cfquery>
                        <cfif getModule.recordCount>
                            <ul class="list-group">
                            <cfloop query="getModule">
                                <li class="list-group-item">
                                    #MODULE_NAME#
                                    <cfquery name="getPages" datasource="#dsn#">
                                        SELECT * FROM PAGES WHERE MODULE_ID=#getModule.MODULE_ID# AND IS_MENU=1
                                    </cfquery>  
                                    <cfif getPages.recordCount>
                                        <div class="list-group">
                                            <cfloop query="getPages">
                                                <a class="list-group-item" href="#request.self#?fuseaction=#getPages.FACT#">
                                                    #PAGE_NAME#
                                                </a>
                                            </cfloop>
                                        </div>
                                    </cfif>
                                </li>
                            </cfloop>
                        </ul>
                        </cfif>
                    </li>
                    </cfoutput>
                </ul>
            </div>
            <div class="col col-10">
                <div class="container">
                    Ticimax Web Projesi 
                                               
                    <cfif isDefined("attributes.fuseaction") and len(attributes.fuseaction)>
                        <cfquery name="getPage" datasource="#dsn#">
                            SELECT * FROM PAGES WHERE FACT='#attributes.fuseaction#' and  PROJECT_ID=#ProjectId# 
                        </cfquery>
                        
                        <cfif getPage.recordCount>
                            <cfinclude template="#PROJECT_PATH##getPage.FILE_PATH#">
                        <cfelse>
                            <cfinclude template="/PROJECTS/TICIMAX/Pages/_500.cfm">
                        </cfif>
                        
                    </cfif>                        
                </div>
            </div>
        </div>
    </div>


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