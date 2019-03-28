xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns2="http://www.zweicom.com/wsdl/schema";


declare namespace ns3 = "http://telefonica.cl/TefRequestHeader/V1";

declare variable $RechargeServiceRequest as element() external;
declare variable $RechargeServiceResponse as element()  external;

declare function local:func($RechargeServiceRequest as element() , 
                            $RechargeServiceResponse as element() ) 
                            as element()  {
    <ns2:requestNotifyRechtoSOS>
        <MSISDN>{fn:data($RechargeServiceRequest/ns1:RechargeServiceRequestData/ns1:Subscriber/ns1:primaryResourceValue)}</MSISDN>
        <requestDateTime>{fn-bea:date-from-dateTime($RechargeServiceRequest/ns3:TefHeaderReq/ns3:transactionTimestamp)}</requestDateTime>
        <amount>{fn:data($RechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:inputAmount/ns1:amount)}</amount>        
        <ppsNewBalance>{fn:data($RechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeAmountsInfo/ns1:ppsNewBalance)}</ppsNewBalance>
        <balExpDate>{fn:data($RechargeServiceResponse/ns1:RechargeServiceResponseData/ns1:rechargeBucketInfo/ns1:balanceExpirationDate)}</balExpDate>
    </ns2:requestNotifyRechtoSOS>
    
};

local:func($RechargeServiceRequest, $RechargeServiceResponse)