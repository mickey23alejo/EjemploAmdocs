xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/LocationManagement/Address/V1/types";
(:: import schema at "../../XSD/AddressGatewayServiceLocal_v001.xsd" ::)
declare namespace ns2="http://xUpdateEmailValidationStatusWS.updateemail.webservice.crm.crmimpl.ch.com";
(:: import schema at "../../../AmdocsCkCRM/XSD/com.ch.crmimpl.crm.webservice.updateemail.xsd" ::)

declare variable $UpdateEmailValidationStatusRequest as element() (:: schema-element(ns1:UpdateEmailValidationStatusRequest) ::) external;

declare function local:serviceInputToUpdateEmailValidationStatus($UpdateEmailValidationStatusRequest as element() (:: schema-element(ns1:UpdateEmailValidationStatusRequest) ::)) as element() (:: schema-element(ns2:updateEmailValidationStatus) ::) {
    <ns2:updateEmailValidationStatus>
        <Request>
            <emailAddress>{fn:data($UpdateEmailValidationStatusRequest/ns1:UpdateEmailValidationStatusRequest_Data/ns1:emailAddress/ns1:eMailAddress)}</emailAddress>
            <entityId>{fn:data($UpdateEmailValidationStatusRequest/ns1:UpdateEmailValidationStatusRequest_Data/ns1:entity/ns1:entityId)}</entityId>
            <entityType>{fn:data($UpdateEmailValidationStatusRequest/ns1:UpdateEmailValidationStatusRequest_Data/ns1:entity/ns1:entityType)}</entityType>
        </Request>
    </ns2:updateEmailValidationStatus>
};

local:serviceInputToUpdateEmailValidationStatus($UpdateEmailValidationStatusRequest)