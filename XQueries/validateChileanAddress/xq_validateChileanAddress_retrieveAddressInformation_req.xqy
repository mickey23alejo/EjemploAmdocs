xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/LocationManagement/Address/V1/types";

declare namespace ns2 = "http://telefonica.cl/TefRequestHeader/V1";

declare variable $req as element()  external;
declare variable $idMessage as xs:string external;

declare function local:func($idMessage as xs:string, $req as element() ) as element()  {
    <ns1:RetrieveAddressInformationRequest>
        <ns2:TefHeaderReq>
            <ns2:userLogin>{fn:data($req/ns2:TefHeaderReq/ns2:userLogin)}</ns2:userLogin>
            <ns2:serviceChannel>{fn:data($req/ns2:TefHeaderReq/ns2:serviceChannel)}</ns2:serviceChannel>
            {
                if ($req/ns2:TefHeaderReq/ns2:sessionCode)
                then <ns2:sessionCode>{fn:data($req/ns2:TefHeaderReq/ns2:sessionCode)}</ns2:sessionCode>
                else ()
            }
            <ns2:application>{fn:data($req/ns2:TefHeaderReq/ns2:application)}</ns2:application>            
            <ns2:idMessage>{fn:data($idMessage)}</ns2:idMessage>                     
            <ns2:ipAddress>{fn:data($req/ns2:TefHeaderReq/ns2:ipAddress)}</ns2:ipAddress>
            {
                if ($req/ns2:TefHeaderReq/ns2:functionalityCode)
                then <ns2:functionalityCode>{fn:data($req/ns2:TefHeaderReq/ns2:functionalityCode)}</ns2:functionalityCode>
                else ()
            }
            <ns2:transactionTimestamp>{fn:data($req/ns2:TefHeaderReq/ns2:transactionTimestamp)}</ns2:transactionTimestamp>
            <ns2:serviceName>{fn:data($req/ns2:TefHeaderReq/ns2:serviceName)}</ns2:serviceName>
            <ns2:version>{fn:data($req/ns2:TefHeaderReq/ns2:version)}</ns2:version>
        </ns2:TefHeaderReq>
        <ns1:RetrieveAddressInformationRequest_data>
            <ns1:addressCode>{fn:data($req/ns1:ValidateAddressRequest_data/ns1:normalizationCode)}</ns1:addressCode>
        </ns1:RetrieveAddressInformationRequest_data>
    </ns1:RetrieveAddressInformationRequest>
};

local:func($idMessage,$req)