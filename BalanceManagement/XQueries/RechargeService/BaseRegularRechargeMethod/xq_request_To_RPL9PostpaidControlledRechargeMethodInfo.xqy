xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="java:amdocs.rpm.datatypes";


declare namespace ns0="http://www.kruger.com.ec/";
(:: import schema at "../../../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)
declare namespace java2="java:ec.com.kruger.ejb.rPL1RechargeServicesConverter.converter";
declare variable $RechargeServiceRequest as element()  external;

declare function local:func($RechargeServiceRequest as element() ) as element()  {
<ns0:arg1>

        {if (string-length($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)) then (
	<paySourceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
        )else()}
        { if ($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units/text() != "") then (
	<currency>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>) else (  <currency>CLP</currency>) }
	<amount>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
        {if ($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:debtCovered) then (
	<cashRechargeMethodInfo>
		<coverDebitInd>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:debtCovered)}</coverDebitInd>
	</cashRechargeMethodInfo>
        )else()}
	<rechargeMethod>RPL9PostpaidControlledRechargeMethodInfo</rechargeMethod>
</ns0:arg1>
};

local:func($RechargeServiceRequest)