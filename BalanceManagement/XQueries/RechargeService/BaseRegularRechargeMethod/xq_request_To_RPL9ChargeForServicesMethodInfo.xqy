xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="java:amdocs.rpm.datatypes";

declare namespace java2="java:ec.com.kruger.ejb.rPL1RechargeServicesConverter.converter";
declare namespace ns0="http://www.kruger.com.ec/";
(:: import schema at "../../../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)

declare variable $rechargeServiceRequest as element() external;

declare function local:func($rechargeServiceRequest as element() ) as element() {
    <ns0:arg1>
     
        {if (string-length($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)) then (
        <paySourceId>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
        )else()}
        { if ($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units/text() != "") then (
        <currency>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>) else (  <currency>CLP</currency>) }
        <amount>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
        <rPL9ChargeForServicesMethodInfo>
            <reasonCode>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reasonCode)}</reasonCode>
            <typeOfCharge>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:typeOfCharge)}</typeOfCharge>
            <chargeCode>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:chargeCode)}</chargeCode>
            <l3ReasonDesc></l3ReasonDesc>
            <reduceType>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reduceType)}</reduceType>
        </rPL9ChargeForServicesMethodInfo>
		
<rechargeMethod>RPL9ChargeForServicesMethodInfo</rechargeMethod>
    </ns0:arg1>
};

local:func($rechargeServiceRequest)