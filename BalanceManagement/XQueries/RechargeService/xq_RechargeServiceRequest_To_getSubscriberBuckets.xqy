xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="http://www.kruger.com.ec/";


declare namespace amd = "java:amdocs.rpm.datatypes";

declare variable $RechargeServiceRequest as element()  external;

declare function local:func($RechargeServiceRequest as element() ) as element()  {
    <ns2:getSubscriberBuckets>
        <ns2:arg0>            
            <primaryResourceType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceType)}</primaryResourceType>
            <primaryResourceValue>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceValue)}</primaryResourceValue>
        </ns2:arg0>
    </ns2:getSubscriberBuckets>
};

local:func($RechargeServiceRequest)