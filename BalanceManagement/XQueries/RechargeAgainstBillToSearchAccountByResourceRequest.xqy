xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)
declare namespace ns2="http://www.kruger.com.ec/";
(:: import schema at "../../AmdocsCkABP/WSDL/CM/SearchServicesWSDL.wsdl" ::)

declare namespace amd = "java:amdocs.csm3g.datatypes";

declare variable $rechargeAgainstBillRequest as element() (:: schema-element(ns1:RechargeAgainstBillRequest) ::) external;

declare function local:rechargeAgainstBillToSearchAccountByResourceRequest($rechargeAgainstBillRequest as element() (:: schema-element(ns1:RechargeAgainstBillRequest) ::)) as element() (:: schema-element(ns2:searchAccountByResource) ::) {
    <ns2:searchAccountByResource>
        <ns2:arg0>
            <parameterType>C</parameterType>
            <parameterValue>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:MSISDNOrigin/ns1:number)}</parameterValue>
        </ns2:arg0>
    </ns2:searchAccountByResource>
};

local:rechargeAgainstBillToSearchAccountByResourceRequest($rechargeAgainstBillRequest)