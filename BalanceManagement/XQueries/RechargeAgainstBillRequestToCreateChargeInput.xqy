xquery version "1.0" encoding "utf-8";
(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)
declare namespace ns2="http://www.kruger.com.ec/";
(:: import schema at "../../AmdocsCkABP/WSDL/Invoicing/ChargeServiceBS.wsdl" ::)

declare namespace amd = "java:amdocs.bl3g.datatypes";

declare variable $BAid as xs:long external;
declare variable $rechargeAgainstBillRequest as element() (:: schema-element(ns1:RechargeAgainstBillRequest) ::) external;

declare function local:rechargeAgainstBillRequestToCreateChargeInput($BAid as xs:long, 
                                                                     $rechargeAgainstBillRequest as element() (:: schema-element(ns1:RechargeAgainstBillRequest) ::)) 
                                                                     as element() (:: schema-element(ns2:createCharge) ::) {
<ns2:createCharge>
	<ns2:arg0>            
		<attributesList>
			<attributeName>{fn:string("MSISDN")}</attributeName>
			<attributeType>{fn:string-to-codepoints("S")}</attributeType>
			<value>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:MSISDNOrigin/ns1:number)}</value>
		</attributesList>
		<attributesList>
			<attributeName>{fn:string("Target MSISDN")}</attributeName>
			<attributeType>{fn:string-to-codepoints("S")}</attributeType>
			<value>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:MSISDNTarget/ns1:number)}</value>
		</attributesList>
		<attributesList>
			<attributeName>{fn:string("Recharge channel")}</attributeName>
			<attributeType>{fn:string-to-codepoints("S")}</attributeType>
			<value>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:paymentChannel/ns1:referenceId)}</value>
		</attributesList>
		<attributesList>
			<attributeName>Charge description</attributeName>
			<attributeType>{fn:string-to-codepoints("S")}</attributeType>
			<value>Cargo por recarga</value>
		</attributesList>
		<attributesList>
			<attributeName>Activity code</attributeName>
			<attributeType>{fn:string-to-codepoints("S")}</attributeType>
			<value>PR</value>
		</attributesList>
		<attributesList>
			<attributeName>Original charge amount</attributeName>
			<attributeType>{fn:string-to-codepoints("D")}</attributeType>
			<value>0</value>
		</attributesList>
            {
            if($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:customerBillingCharge/ns1:chargeCodeDescription) then 
		<description>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:customerBillingCharge/ns1:chargeCodeDescription)}</description>
            else ()
            }
		<chargeCode>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:customerBillingCharge/ns1:chargeCode)}</chargeCode>
            {
            if($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:customerBillingCharge/ns1:chargeType) then
		<chargeType>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:customerBillingCharge/ns1:chargeType)}</chargeType>
            else()
            }
		<pcn>
            {
              if(fn:empty($BAid))
              then 
                    0
              else
                  fn:data($BAid)
            }</pcn>
		<amount>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:createChargeAmount/ns1:amount)}</amount>
		<effectiveDate>{fn:dateTime(fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:chargeEffectiveDate/ns1:effectiveDate),xs:time("00:00:00"))}</effectiveDate>
		<serviceReciverId>{
              if(fn:empty($BAid))
              then 
                    0
              else
                  fn:data($BAid)
            }</serviceReciverId>
		<serviceReciverType>{fn:string-to-codepoints("B")}</serviceReciverType>

		<amountCurrency>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:rechargeMethodInfo/ns1:rechargeAmount/ns1:units)}</amountCurrency>
		<chargeOrigin>{fn:data($rechargeAgainstBillRequest/ns1:RechargeAgainstBillRequestData/ns1:customerBillingCharge/ns1:chargeOrigin)}</chargeOrigin>


	</ns2:arg0>
</ns2:createCharge>

};

local:rechargeAgainstBillRequestToCreateChargeInput($BAid, $rechargeAgainstBillRequest)