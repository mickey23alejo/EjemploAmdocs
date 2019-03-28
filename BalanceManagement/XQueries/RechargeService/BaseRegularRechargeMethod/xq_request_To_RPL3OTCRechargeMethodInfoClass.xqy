xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="java:amdocs.rpm.datatypes";

declare namespace java2="java:ec.com.kruger.ejb.rPL1RechargeServicesConverter.converter";
declare namespace ns0="http://www.kruger.com.ec/";
(:: import schema at "../../../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)

declare variable $rechargeServiceRequest as element() external;

declare function local:func($rechargeServiceRequest as element()) as element()  {
<ns0:arg1>

        {if ((string-length($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId))) then (
	<paySourceId>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
        )else()}
        { if ($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units/text() != "") then (
	<currency>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>) else (  <currency>CLP</currency>) }
	<amount>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>

	<rechargeMethod>RPL3OTCRechargeMethodInfo</rechargeMethod>

	<rPL3OTCRechargeMethodInfo>
		<reasonCode>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reasonCode)}</reasonCode>
		<l3ReasonDesc/>
		{ if(fn:empty($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:offerInstanceId/text())) then 
			<l3OfferInst>0</l3OfferInst>
		  else
		<l3OfferInst>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:offerInstanceId)}</l3OfferInst>
		}
		{ if(fn:empty($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:offerId/text())) then 
		<l3OfferId>0</l3OfferId>
		else
		<l3OfferId>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:offerId)}</l3OfferId>
		}
		<reduceType>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargePM/ns1:reduceType)}</reduceType>
	</rPL3OTCRechargeMethodInfo>

</ns0:arg1>

};

local:func($rechargeServiceRequest)