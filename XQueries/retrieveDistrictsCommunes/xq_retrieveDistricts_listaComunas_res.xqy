xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://comuna.webservices.col.direccionNormalizada.telefonica.cl/";

declare namespace ns2="http://telefonica.cl/LocationManagement/Address/V1/types";


declare variable $retCode as xs:string external;
declare variable $res as element()  external;

declare function local:func($res as element() ) as element()  {
    <ns2:RetrieveDistrictsResponse>      
        <ns2:RetrieveDistrictsResponse_data>
            <ns2:districtsCommunes>
                {
                    for $comunaList in $res/return/comunaListDTO/comunaList
                    return 
                    <ns2:districtsCommunes>
                        <ns2:code>{fn:data($comunaList/idComuna)}</ns2:code>
                        <ns2:name>{fn:data($comunaList/nombreComuna)}</ns2:name>
                    </ns2:districtsCommunes>
                }
            </ns2:districtsCommunes>
            <ns2:status>
                <ns2:code>{fn:data($res/return/codRetorno)}</ns2:code>
                <ns2:description>{fn:data($res/return/desRetorno)}</ns2:description>
            </ns2:status>
        </ns2:RetrieveDistrictsResponse_data>
    </ns2:RetrieveDistrictsResponse>
};

local:func($res)