xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.kruger.com.ec/";
(:: import schema at "../../../AmdocsCkABP/WSDL/RPL/RPL1SubscriberServicesBS.wsdl" ::)

declare namespace ec. = "java:ec.com.kruger.ejb.rpl1subscriberservices.subscriberservices";

declare variable $getSubscriberBucketsResponse as element() (:: schema-element(ns1:getSubscriberBucketsResponse) ::) external;

declare function local:func($getSubscriberBucketsResponse as element() (:: schema-element(ns1:getSubscriberBucketsResponse) ::)) as xs:integer {
    fn:data($getSubscriberBucketsResponse/ns1:return/bucketIdInfo/pcn)
};

local:func($getSubscriberBucketsResponse)