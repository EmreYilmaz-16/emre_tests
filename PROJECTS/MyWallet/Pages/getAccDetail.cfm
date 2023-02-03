<cfquery name="getDetail" datasource="#dsn#">
     SELECT  * FROM (
                            SELECT A1.ACCOUNT_NAME AS AC_1,A2.ACCOUNT_NAME AS AC_2,EC.EXPENSE_CAT,PT.PROCESS_TYPE_ID,PT.PROCESS_TYPE,A1.MONEY M1,A2.MONEY M2,
                            IOO.FROM_ACCOUNT,IOO.TO_ACCOUNT,IOO.DESCRIPTION

                            ,
                            CASE WHEN PT.PROCESS_TYPE_ID =1 THEN AMOUNT
                            WHEN IOO.FROM_ACCOUNT=#attributes.ACCOUNT_ID# THEN -1*AMOUNT WHEN IOO.TO_ACCOUNT=#attributes.ACCOUNT_ID# THEN AMOUNT
                            END AS AMOUNT
                            FROM INCOME_OUTGOING AS IOO
                            LEFT JOIN ACCOUNTS AS A1 ON A1.ACCOUNT_ID=IOO.FROM_ACCOUNT
                            LEFT JOIN ACCOUNTS AS A2 ON A2.ACCOUNT_ID=IOO.TO_ACCOUNT
                            LEFT JOIN EXPENSE_CATS AS EC ON EC.EXPENSE_CAT_ID=IOO.EXPENSE_CAT
                            LEFT JOIN PROCESS_TYPES AS PT ON PT.PROCESS_TYPE_ID=IOO.PROCESS_TYPE
                            ) AS T WHERE FROM_ACCOUNT=#attributes.ACCOUNT_ID# OR TO_ACCOUNT=#attributes.ACCOUNT_ID#
</cfquery>
<cfdump var="#getDetail#">

<table>
    <cfoutput query="getDetail">
    <tr>
        <td>
            #PROCESS_TYPE#<br>
                <cfif FROM_ACCOUNT eq attributes.ACCOUNT_ID>
                    <cfif PROCESS_TYPE_ID eq 4>
                        <i class="fa-solid fa-left">a</i>  #AC_2#
                    </cfif>
                </cfif>
                <cfif TO_ACCOUNT eq attributes.ACCOUNT_ID>
                    <cfif PROCESS_TYPE_ID eq 4>
                        <= #AC_1#
                    </cfif>
                </cfif>
        </td>
    </tr>
</cfoutput>
</table>