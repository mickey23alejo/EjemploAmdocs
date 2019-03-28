xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns0="http://www.kruger.com.ec/";
(:: import schema at "../../../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)
declare namespace java1="java:amdocs.rpm.datatypes";

declare namespace java2="java:ec.com.kruger.ejb.rPL1RechargeServicesConverter.converter";
declare variable $RechargeServiceRequest as element() external;

declare function local:func($RechargeServiceRequest as element() ) as element()  {
    <ns0:arg0>
        <location>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:location)}</location>
        <referenceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:referenceId)}</referenceId>
        <comments>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:comments)}</comments>
        <requestDateTime>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:requestDate)}</requestDateTime>
        <bulkTransaction>78</bulkTransaction>
        <l3TransactionID></l3TransactionID>
        <l3ValRcgAmtInd>78</l3ValRcgAmtInd>
        <pointOfSale>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:pointOfSale)}</pointOfSale>
        <distributor>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:distributor)}</distributor>
        <authorizationCode>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:authorizationCode)}</authorizationCode>
        <typeOfCharge></typeOfCharge>
        <hub>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:hub)}</hub>
        <rateCode>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:paymentChannel/ns1:rateCode)}</rateCode>
<channelType>RPL3POSChannelInfo</channelType>
    </ns0:arg0>
};

local:func($RechargeServiceRequest)