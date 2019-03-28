xquery version "1.0" encoding "utf-8";


(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)
declare namespace ns2="http://www.zweicom.com/wsdl/schema";
(:: import schema at "../../XSD/NotifyRechargeRequest.xsd" ::)

declare namespace ns3 = "http://telefonica.cl/TefRequestHeader/V1";



declare variable $RechargeServiceRequest as element() (:: schema-element(ns1:RechargeServiceRequest) ::) external;
declare variable $RechargeServiceResponse as element() (:: schema-element(ns1:RechargeServiceResponse) ::) external;

declare function local:func($RechargeServiceRequest as element() (:: schema-element(ns1:RechargeServiceRequest) ::), 
                            $RechargeServiceResponse as element() (:: schema-element(ns1:RechargeServiceResponse) ::)) 
                            as element() (:: schema-element(ns2:NotifyRechargeRequest) ::) {
    <ns2:NotifyRechargeRequest>
        <msisdn>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceValue)}</msisdn>
        <requestDateTime>{fn-bea:date-from-dateTime($RechargeServiceRequest/ns3:TefHeaderReq/ns3:transactionTimestamp)}</requestDateTime>
        <amount>{fn:data($RechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:inputAmount/ns1:amount)}</amount>
        <ppsNewBalance>{fn:data($RechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:ppsNewBalance)}</ppsNewBalance>
        <balExpDate>{fn:data($RechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:balanceExpirationDate)}</balExpDate>
    </ns2:NotifyRechargeRequest>
};

local:func($RechargeServiceRequest, $RechargeServiceResponse)