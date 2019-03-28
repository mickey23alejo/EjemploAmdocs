xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.kruger.com.ec/";
(:: import schema at "../../AmdocsCkABP/WSDL/CM/AccountServicesBS.wsdl" ::)

declare namespace amd = "java:amdocs.csm3g.datatypes";

declare variable $accountNo as xs:string external;

declare function local:searchAccountByResourceResponseToGetAccountBillingArrangementListRequest($accountNo as xs:string) as element() (:: schema-element(ns1:getAccountBillingArrangementList) ::) {
    <ns1:getAccountBillingArrangementList>
        <ns1:arg0>
            <accountNo>{fn:data($accountNo)}</accountNo>
        </ns1:arg0>
    </ns1:getAccountBillingArrangementList>
};

local:searchAccountByResourceResponseToGetAccountBillingArrangementListRequest($accountNo)