xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";


declare namespace ns2 = "http://telefonica.cl/TefError/V1";

declare variable $rechargeServiceFault as element() external;

declare function local:func($rechargeServiceFault as element() ) as xs:string {
    fn:data($rechargeServiceFault/ns1:Error/ns2:details/ns2:cause)
};

local:func($rechargeServiceFault)