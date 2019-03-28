xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)
declare namespace ns2="http://www.kruger.com.ec/";
(:: import schema at "../../AmdocsCkABP/WSDL/RPL/RPL1SubscriberServicesBS.wsdl" ::)

declare namespace amd = "java:amdocs.rpm.datatypes";

declare variable $RechargeServiceRequest as element() (:: schema-element(ns1:RechargeServiceRequest) ::) external;

declare function local:rechargeServiceRequestToGetSubscriberBuckets($RechargeServiceRequest as element() (:: schema-element(ns1:RechargeServiceRequest) ::)) as element() (:: schema-element(ns2:getSubscriberBuckets) ::) {
    <ns2:getSubscriberBuckets>
        <ns2:arg0>
            <primaryResourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceType)}</primaryResourceType>
            <primaryResourceValue>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceValue)}</primaryResourceValue></ns2:arg0>
    </ns2:getSubscriberBuckets>
};

local:rechargeServiceRequestToGetSubscriberBuckets($RechargeServiceRequest)