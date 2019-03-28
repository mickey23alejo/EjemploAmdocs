xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";


declare namespace ns2 = "http://telefonica.cl/TefRequestHeader/V1";

declare variable $rechargeServiceRequest as element()  external;
declare variable $bucketID as xs:string external;

declare function local:func($rechargeServiceRequest as element() ,$bucketID as xs:string) as element()  {
    <ns1:RechargeServiceRequest>
        <ns2:TefHeaderReq>
          {$rechargeServiceRequest/ns2:TefHeaderReq/*}
        </ns2:TefHeaderReq>
        <ns1:BucketId>{xs:int($bucketID)}</ns1:BucketId>
        <ns1:RechargeServiceRequestData>
          {$rechargeServiceRequest/ns1:RechargeServiceRequestData/*}
        </ns1:RechargeServiceRequestData>
    </ns1:RechargeServiceRequest>
};

local:func($rechargeServiceRequest,$bucketID)