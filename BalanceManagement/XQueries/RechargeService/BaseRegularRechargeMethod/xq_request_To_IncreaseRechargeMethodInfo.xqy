xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="java:amdocs.rpm.datatypes";

declare namespace java2="java:ec.com.kruger.ejb.rPL1RechargeServicesConverter.converter";
declare namespace ns0="http://www.kruger.com.ec/";
(:: import schema at "../../../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)

declare variable $RechargeServiceRequest as element()external;

declare function local:func($RechargeServiceRequest as element()) as element()  {
<ns0:arg1>

        {if (string-length($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)) then (
	<paySourceId>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
        )else()}
        { if ($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units/text() != "") then (
	<currency>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>)  else (  <currency>CLP</currency>) }
	<amount>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>

	<rechargeMethod>IncreaseRechargeMethodInfo</rechargeMethod>
	<increaseRechargeMethodInfo>
		<reasonCode>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reasonCode)}</reasonCode>
		<l3ReasonDesc/>
			{if(fn:empty($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:calculateExpiryDate/text())) then 
		<calcExpDateInd>78</calcExpDateInd> 
			else
		<calcExpDateInd>{fn:string-to-codepoints($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:calculateExpiryDate/text())}</calcExpDateInd>
            }
		<increaseType>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:increaseType)}</increaseType>
	</increaseRechargeMethodInfo>
</ns0:arg1>
};

local:func($RechargeServiceRequest)