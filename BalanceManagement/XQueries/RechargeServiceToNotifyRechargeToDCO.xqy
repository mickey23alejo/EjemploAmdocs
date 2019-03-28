xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://ws.tiaxa.net/dco2msclSoapService/";
(:: import schema at "../../TelefonicaDCO/WSDL/dco2msclSoapService%20(1).wsdl" ::)
declare namespace ns1="http://www.kruger.com.ec/";
(:: import schema at "../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)
declare namespace ns3="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)

declare namespace ec. = "java:ec.com.kruger.ejb.rpl1rechargeservices.rechargeservices";

declare namespace ns4 = "http://telefonica.cl/TefRequestHeader/V1";

declare variable $rechargeServiceResponse as element() (:: schema-element(ns1:rechargeServiceResponse) ::) external;
declare variable $RechargeServiceRequest as element() (:: schema-element(ns3:RechargeServiceRequest) ::) external;

declare function local:rechargeServiceToNotifyRechargeToDCO($rechargeServiceResponse as element() (:: schema-element(ns1:rechargeServiceResponse) ::),
                                                            $RechargeServiceRequest as element() (:: schema-element(ns3:RechargeServiceRequest) ::)
                                                            ) as element() (:: schema-element(ns2:NotifyRechargeRequest) ::) {
    <ns2:NotifyRechargeRequest>
        <msisdn>{fn:data($rechargeServiceResponse/ns1:return/rechargeSubscriberInfo/subscriberNo)}</msisdn>
        <requestDateTime>{fn-bea:date-from-dateTime(fn:data($RechargeServiceRequest/ns4:TefHeaderReq/ns4:transactionTimestamp))}</requestDateTime>
        <amount>{fn:data($rechargeServiceResponse/ns1:return/rechargeAmountsInfo/inputAmt)}</amount>
        <ppsNewBalance>{fn:data($rechargeServiceResponse/ns1:return/rechargeAmountsInfo/ppsNewBalance)}</ppsNewBalance>
        <balExpDate>{fn:data($rechargeServiceResponse/ns1:return/rechargeBucketInfo/balExpDate)}</balExpDate>
    </ns2:NotifyRechargeRequest>
};

local:rechargeServiceToNotifyRechargeToDCO($rechargeServiceResponse,$RechargeServiceRequest)