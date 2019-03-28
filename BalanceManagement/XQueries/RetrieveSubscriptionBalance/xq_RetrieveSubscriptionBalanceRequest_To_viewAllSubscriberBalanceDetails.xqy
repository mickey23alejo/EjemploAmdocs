xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="http://www.kruger.com.ec/";
(:: import schema at "../../../AmdocsCkABP/WSDL/RPL/RPL1SubscriberServicesBS.wsdl" ::)

declare namespace amd = "java:amdocs.rpm.datatypes";

declare variable $RetrieveSubscriptionBalanceRequest as element() external;

declare function local:func($RetrieveSubscriptionBalanceRequest as element() ) as element()  {
    <ns2:viewAllSubscriberBalanceDetails>
        <ns2:arg0>
            <primaryResourceValue>{fn:data($RetrieveSubscriptionBalanceRequest/ns1:RetrieveSubscriptionBalanceRequestData/ns1:subscriber/ns1:primaryResourceValue)}</primaryResourceValue>
            <primaryResourceType>{fn:data($RetrieveSubscriptionBalanceRequest/ns1:RetrieveSubscriptionBalanceRequestData/ns1:subscriber/ns1:primaryResourceType)}</primaryResourceType>
        </ns2:arg0>

    </ns2:viewAllSubscriberBalanceDetails>
   
};

local:func($RetrieveSubscriptionBalanceRequest)