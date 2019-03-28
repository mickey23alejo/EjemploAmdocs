xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://telefonica.cl/LocationManagement/Address/V1/types";
(:: import schema at "../../XSD/AddressGatewayServiceLocal_v001.xsd" ::)
declare namespace ns1="http://xUpdateEmailValidationStatusWS.updateemail.webservice.crm.crmimpl.ch.com";
(:: import schema at "../../../AmdocsCkCRM/XSD/com.ch.crmimpl.crm.webservice.updateemail.xsd" ::)

declare namespace ns3="http://telefonica.cl/TefResponseHeader/V1";
(:: import schema at "../../../AmdocsCommon/XSD/TefResponseHeaderCl_v001.xsd" ::)

declare variable $TefHeaderRes as element() (:: element(*, ns3:TefHeaderRes) ::) external;
declare variable $updateEmailValidationStatusResponse as element() (:: schema-element(ns1:updateEmailValidationStatusResponse) ::) external;

declare function local:updateEmailValidationStatusToServiceOutput($TefHeaderRes as element() (:: element(*, ns3:TefHeaderRes) ::),$updateEmailValidationStatusResponse as element() (:: schema-element(ns1:updateEmailValidationStatusResponse) ::)) as element() (:: schema-element(ns2:UpdateEmailValidationStatusResponse) ::) {
    <ns2:UpdateEmailValidationStatusResponse>
        <ns3:TefHeaderRes>
            {
                if ($TefHeaderRes/ns3:TefHeaderRes/ns3:idMessage)
                then <ns3:idMessage>{fn:data($TefHeaderRes/ns3:TefHeaderRes/ns3:idMessage)}</ns3:idMessage>
                else ()
            }
            <ns3:serviceName>{fn:data($TefHeaderRes/ns3:TefHeaderRes/ns3:serviceName)}</ns3:serviceName>
            <ns3:responseDateTime>{fn:current-dateTime()}</ns3:responseDateTime>
            <ns3:transactionID>{fn:data($TefHeaderRes/ns3:TefHeaderRes/ns3:transactionID)}</ns3:transactionID>
        </ns3:TefHeaderRes>
        <ns2:UpdateEmailValidationStatusResponseData>
            <ns2:acknowledge>
                <ns2:isSuccess>{fn:true()}</ns2:isSuccess>
            </ns2:acknowledge>
        </ns2:UpdateEmailValidationStatusResponseData>
    </ns2:UpdateEmailValidationStatusResponse>
};

local:updateEmailValidationStatusToServiceOutput($TefHeaderRes, $updateEmailValidationStatusResponse)