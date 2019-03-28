xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="java:amdocs.rpm.datatypes";

declare namespace java2="java:ec.com.kruger.ejb.rPL1RechargeServicesConverter.converter";
declare namespace ns0="http://www.kruger.com.ec/";
(:: import schema at "../../../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)

declare variable $rechargeServiceRequest as element() external;

declare function local:func($rechargeServiceRequest as element() ) as element()  {
    <ns0:arg1>
     
        {if (string-length($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)) then (
        <paySourceId>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:paySourceId)}</paySourceId>
        )else()}
        { if ($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units/text() != "") then (
        <currency>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</currency>)  else (  <currency>CLP</currency>) }
        <amount>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:amount)}</amount>
        <creditCardRechargeMethodInfo>
            {if ($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:debtCovered) then (
            <coverDebitInd>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:rechargeMethodInfo/ns1:debtCovered)}</coverDebitInd>
            )else()}
            {
            if(fn:empty($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:creditCardPM/ns1:expirationDate/text())) then
            ()
            else
            <creditCardExpDate>{fn:dateTime($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:creditCardPM/ns1:expirationDate,xs:time("12:00:00"))}</creditCardExpDate>        
            }
            <creditCardNumber>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:creditCardPM/ns1:creditCardNumber)}</creditCardNumber>
            <creditCardType>{fn:data($rechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:creditCardPM/ns1:creditCardType)}</creditCardType>
        </creditCardRechargeMethodInfo>       
        <rechargeMethod>CreditCardRechargeMethodInfo</rechargeMethod>
    </ns0:arg1>
};

local:func($rechargeServiceRequest)