xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";


declare namespace tel="http://www.kruger.com.ec/";
declare namespace java="java:amdocs.galaxy.RPL1RechargeServices";
declare namespace java1="java:amdocs.rpm.datatypes";

declare variable $rechargeServiceRequest as element() external;

declare function local:func($rechargeServiceRequest as element() ) as element()  {
    <tel:rechargeService>
         <tel:arg0>
         </tel:arg0>
         <tel:arg1>
            <currency></currency>
			<amount></amount>
			<rechargeMethod></rechargeMethod>
         </tel:arg1>
         <tel:arg2>
            {
            if(fn:empty($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:prepaidBucket/ns1:paymentCategory/text())) then
            ()
            else
            <pcnPaymentCategory>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:prepaidBucket/ns1:paymentCategory)}</pcnPaymentCategory>
            }
            {
            if(fn:empty($rechargeServiceRequest/ns1:BucketId/text())) then
            ()
            else
            <pcn>{fn:data($rechargeServiceRequest/ns1:BucketId)}</pcn>
            }
         </tel:arg2>
         <tel:arg3>
             {
             if(fn:empty($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceType/text())) then
             ()
             else
             <primaryResourceType>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceType)}</primaryResourceType>
             }
             {
             if(fn:empty($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceValue/text())) then
             ()
             else
             <primaryResourceValue>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceValue)}</primaryResourceValue>
             }
         </tel:arg3>
      </tel:rechargeService>

};

local:func($rechargeServiceRequest)