xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)
declare namespace ns2="http://www.kruger.com.ec/";
(:: import schema at "../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)

declare namespace amd = "java:amdocs.rpm.datatypes";

declare variable $viewRechargesRequest as element() (:: schema-element(ns1:ViewRechargesRequest) ::) external;


declare function local:viewRechargesRequestToEjbViewRechargesRequest($viewRechargesRequest as element() (:: schema-element(ns1:ViewRechargesRequest) ::)) as element() (:: schema-element(ns2:viewRecharges) ::) {
    <ns2:viewRecharges>
        <ns2:arg0>
            {
                if (fn:empty($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:subscriberDetails/ns1:primaryResourceType/text())) then
                    <primaryResourceType/>                    
                else
                    <primaryResourceType>{fn:data($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:subscriberDetails/ns1:primaryResourceType)}</primaryResourceType>
            }
            {
                if (fn:empty($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:subscriberDetails/ns1:primaryResourceValue/text())) then
                    <primaryResourceValue/>                    
                else
                    <primaryResourceValue>{fn:data($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:subscriberDetails/ns1:primaryResourceValue)}</primaryResourceValue>
            }
        </ns2:arg0>
        <ns2:arg1>
            {
                if (fn:empty($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:fromDate/text())) then
                    <fromDate/>
                else
                    <fromDate>{fn:data($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:fromDate)}</fromDate>                    
            }
            {
                if (fn:empty($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:toDate/text())) then
                    <toDate/>                    
                else
                    <toDate>{fn:data($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:toDate)}</toDate>
            }
        </ns2:arg1>
    </ns2:viewRecharges>
};

local:viewRechargesRequestToEjbViewRechargesRequest($viewRechargesRequest)