xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="http://www.kruger.com.ec/";
declare namespace java="java:amdocs.rpm.datatypes";

declare namespace tel="http://www.kruger.com.ec/";
(:: import schema at "../../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)

declare variable $viewRechargesRequest as element()  external;

declare function local:func($viewRechargesRequest as element() ) as element() (:: schema-element(tel:viewRecharges) ::) {
         <ns2:viewRecharges>
         <ns2:arg0>
             <primaryResourceType>{fn:data($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:subscriberDetails/ns1:primaryResourceType)}</primaryResourceType>
             <primaryResourceValue>{fn:data($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:subscriberDetails/ns1:primaryResourceValue)}</primaryResourceValue>
         </ns2:arg0>
         <ns2:arg1>
             <fromDate>{fn:adjust-dateTime-to-timezone(fn:dateTime($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:fromDate,xs:time("00:00:00")), ())}</fromDate>
             <toDate>{fn:adjust-dateTime-to-timezone(fn:dateTime($viewRechargesRequest/ns1:ViewRechargesRequestData/ns1:toDate,xs:time("00:00:00")),())}</toDate>
         </ns2:arg1>
      </ns2:viewRecharges>

};

local:func($viewRechargesRequest)