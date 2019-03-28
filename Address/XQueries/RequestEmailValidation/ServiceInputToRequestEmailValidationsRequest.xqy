xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/CustomerOrderManagement/CustomerOrderTrackingManagement/requestEmailValidations/types";
(:: import schema at "../../../TelefonicaAddress/WSDL/requestEmailValidations%20v2.wsdl" ::)
declare namespace ns2="http://telefonica.cl/LocationManagement/Address/V1/types";
(:: import schema at "../../XSD/AddressGatewayServiceLocal_v001.xsd" ::)

declare variable $RequestEmailValidationRequest as element() (:: schema-element(ns2:RequestEmailValidationRequest) ::) external;

declare function local:serviceInputToRequestEmailValidationsRequest($RequestEmailValidationRequest as element() (:: schema-element(ns2:RequestEmailValidationRequest) ::)) as element() (:: schema-element(ns1:RequestEmailValidationsRequest) ::) {
    <ns1:RequestEmailValidationsRequest>
        <ns1:contactIdType>{fn:data($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:identification/ns2:identificationType)}</ns1:contactIdType>
        {
          if(fn:data(fn:upper-case($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:identification/ns2:identificationType))='RUT') then (
              <ns1:identificationNumber>{fn:substring(fn:data($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:identification/ns2:identificationNumber),1,fn:string-length(fn:data($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:identification/ns2:identificationNumber))-1)}</ns1:identificationNumber>
          ) else(<ns1:identificationNumber>{fn:data($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:identification/ns2:identificationNumber)}</ns1:identificationNumber>)
        }
        {
            if(fn:data(fn:upper-case($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:identification/ns2:identificationType))='RUT') 
              then <ns1:identificationCode>{  fn:substring(fn:data(($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:identification/ns2:identificationNumber)) ,
        fn:string-length(fn:data(($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:identification/ns2:identificationNumber))) ,
        fn:string-length(fn:data(($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:identification/ns2:identificationNumber))))}</ns1:identificationCode>
            else()
        }        
        <ns1:firstName>{fn:data($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:firstName)}</ns1:firstName>
        <ns1:lastName>{fn:data($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:lastName)}</ns1:lastName>
        <ns1:entityType>{fn:data($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:entity/ns2:entityType)}</ns1:entityType>
        <ns1:entityId>{fn:data($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:entity/ns2:entityId)}</ns1:entityId>
        {
            if ($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:correlation/ns2:correlationId)
            then <ns1:correlativoId>{fn:data($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:correlation/ns2:correlationId)}</ns1:correlativoId>
            else ()
        }
        <ns1:emailAddress>{fn:data($RequestEmailValidationRequest/ns2:RequestEmailValidationRequest_Data/ns2:emailAddress/ns2:eMailAddress)}</ns1:emailAddress>
    </ns1:RequestEmailValidationsRequest>
};

local:serviceInputToRequestEmailValidationsRequest($RequestEmailValidationRequest)