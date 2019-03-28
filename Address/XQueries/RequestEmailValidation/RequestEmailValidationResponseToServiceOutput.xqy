xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/CustomerOrderManagement/CustomerOrderTrackingManagement/requestEmailValidations/types";
(:: import schema at "../../../TelefonicaAddress/WSDL/requestEmailValidations%20v2.wsdl" ::)
declare namespace ns2="http://telefonica.cl/LocationManagement/Address/V1/types";
(:: import schema at "../../XSD/AddressGatewayServiceLocal_v001.xsd" ::)


declare namespace ns3 = "http://telefonica.cl/TefResponseHeader/V1";
(:: import schema at "../../../AmdocsCommon/XSD/TefResponseHeaderCl_v001.xsd" ::)

declare variable $tefHeaderResType as element() (:: element(*, ns3:TefHeaderRes) ::) external;
declare variable $RequestEmailValidationsResponse as element() (:: schema-element(ns1:RequestEmailValidationsResponse) ::) external;

declare function local:requestEmailValidationResponseToServiceOutput($tefHeaderResType as element() (:: element(*, ns3:TefHeaderRes) ::),$RequestEmailValidationsResponse as element() (:: schema-element(ns1:RequestEmailValidationsResponse) ::)) as element() (:: schema-element(ns2:RequestEmailValidationResponse) ::) {
    <ns2:RequestEmailValidationResponse>
        <ns3:TefHeaderRes>
            {
                if ($tefHeaderResType/ns3:TefHeaderRes/ns3:idMessage)
                then <ns3:idMessage>{fn:data($tefHeaderResType/ns3:TefHeaderRes/ns3:idMessage)}</ns3:idMessage>
                else ()
            }
            <ns3:serviceName>{fn:data($tefHeaderResType/ns3:TefHeaderRes/ns3:serviceName)}</ns3:serviceName>
            <ns3:responseDateTime>{fn:current-dateTime()}</ns3:responseDateTime>
            <ns3:transactionID>{fn:data($tefHeaderResType/ns3:TefHeaderRes/ns3:transactionID)}</ns3:transactionID>
        </ns3:TefHeaderRes>
        <ns2:RequestEmailValidationResponse_Data>
            <ns2:acknowledge>
                <ns2:isSuccess>{fn:data($RequestEmailValidationsResponse/ns1:Acknowledge)}</ns2:isSuccess>
            </ns2:acknowledge>
        </ns2:RequestEmailValidationResponse_Data>
    </ns2:RequestEmailValidationResponse>
};
local:requestEmailValidationResponseToServiceOutput($tefHeaderResType,$RequestEmailValidationsResponse)