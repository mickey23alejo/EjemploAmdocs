xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";
(:: import schema at "../XSD/BalanceManagementServiceLocalCl_v001.xsd" ::)
declare namespace ns1="http://www.kruger.com.ec/";
(:: import schema at "../../AmdocsCkABP/WSDL/RPL/RPL1RechargeServicesBS.wsdl" ::)
declare namespace ns3="http://telefonica.cl/TefResponseHeader/V1";
(:: import schema at "../../AmdocsCommon/XSD/TefResponseHeaderCl_v001.xsd" ::)
declare namespace ec. = "java:ec.com.kruger.ejb.rPL1RechargeServicesConverter.converter";

declare namespace ec.1 = "java:ec.com.kruger.ejb.rpl1rechargeservices.viewrecharges";

declare variable $viewRechargesResponse as element() (:: schema-element(ns1:viewRechargesResponse) ::) external;
declare variable $tefHeaderResType as element() (:: element(*, ns3:TefHeaderRes) ::) external;
declare variable $units as xs:string external;

declare function local:ejbViewRechargesResponseToViewRechargesResponse($units as xs:string,$tefHeaderResType as element() (:: element(*, ns3:TefHeaderRes) ::),$viewRechargesResponse as element() (:: schema-element(ns1:viewRechargesResponse) ::)) as element() (:: schema-element(ns2:ViewRechargesResponse) ::) {
    <ns2:ViewRechargesResponse>
        <ns3:TefHeaderRes>
            {
                if ($tefHeaderResType/ns3:TefHeaderRes/ns3:idMessage)
                then <ns3:idMessage>{fn:data($tefHeaderResType/ns3:TefHeaderRes/ns3:idMessage)}</ns3:idMessage>
                else ()
            }
            <ns3:serviceName>{fn:data($tefHeaderResType/ns3:TefHeaderRes/ns3:serviceName)}</ns3:serviceName>
            <ns3:responseDateTime>{fn:current-dateTime()}</ns3:responseDateTime>
            <ns3:transactionID>{fn:data($tefHeaderResType/ns3:TefHeaderRes/ns3:transactionID)}</ns3:transactionID>
        </ns3:TefHeaderRes>
        <ns2:ViewRechargesResponseData>
            <ns2:viewRechargesResponse>
                <ns2:rechargeIdentificationInfo>
                    <ns2:rechargeId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeIdentInfo/rcgId)}</ns2:rechargeId>
                    <ns2:periodKey>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeIdentInfo/periodKey)}</ns2:periodKey>
                    <ns2:bucketKey>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeIdentInfo/bucketKey)}</ns2:bucketKey></ns2:rechargeIdentificationInfo>
                <ns2:rechargeDatesInfo>
                    <ns2:rechargeReferenceDate>{fn-bea:date-from-dateTime(fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeDatesInfo/rcgRefDate))}</ns2:rechargeReferenceDate>
                    <ns2:processDate>{fn-bea:date-from-dateTime(fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeDatesInfo/processDate))}</ns2:processDate>
                    <ns2:logicalDate>{fn-bea:date-from-dateTime(fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeDatesInfo/logicalDate))}</ns2:logicalDate>
                    <ns2:rechargeRequestDate>{fn-bea:date-from-dateTime(fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeDatesInfo/rcgReqDate))}</ns2:rechargeRequestDate>
                </ns2:rechargeDatesInfo>
                <ns2:rechargeAmountsInfo>
                    <ns2:inputAmount>
                        <ns2:amount>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeAmountsInfo/inputAmt)}</ns2:amount>
                        <ns2:units>{$units}</ns2:units>
                    </ns2:inputAmount>
                    <ns2:rechargeChannelAmount>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeAmountsInfo/rcgChlAmt)}</ns2:rechargeChannelAmount>
                    <ns2:ppsBalance>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeAmountsInfo/ppsBalance)}</ns2:ppsBalance>
                    <ns2:ppsNewBalance>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeAmountsInfo/ppsNewBalance)}</ns2:ppsNewBalance>
                    <ns2:ppsAmount>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeAmountsInfo/ppsAmt)}</ns2:ppsAmount>
                </ns2:rechargeAmountsInfo>
                <ns2:rechargeBalanceExpirationInfo>
                    <ns2:rechargeNumberOfDays>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBalanceExpirationInfo/rcgNumOfDays)}</ns2:rechargeNumberOfDays>
                    <ns2:balanceExpirationDate>{fn-bea:date-from-dateTime(fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBalanceExpirationInfo/balExpDateCalc))}</ns2:balanceExpirationDate>
                </ns2:rechargeBalanceExpirationInfo>
                <ns2:rechargeLogInfo>
                    <ns2:rechargeMainId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeLogInfo/rmdMainId)}</ns2:rechargeMainId>
                    <ns2:rechargeValue>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeLogInfo/rmdVals)}</ns2:rechargeValue>
                    <ns2:channelDetailMainId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeLogInfo/cdMainId)}</ns2:channelDetailMainId>
                    <ns2:channelDetailValue>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeLogInfo/cdVals)}</ns2:channelDetailValue>
                    <ns2:channelDetailUniqueId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeLogInfo/cdUniqueId)}</ns2:channelDetailUniqueId>
                    <ns2:clientTimeStamp>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeLogInfo/clientTimeStamp)}</ns2:clientTimeStamp>
                    <ns2:radTimeStamp>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeLogInfo/radTimeStamp)}</ns2:radTimeStamp>
                    <ns2:rplTimeStamp>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeLogInfo/rplTimeStamp)}</ns2:rplTimeStamp>
                    <ns2:subscriberIdValue>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeLogInfo/subIdVals)}</ns2:subscriberIdValue>
                    <ns2:typeOfCharge>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeLogInfo/typeOfCharge)}</ns2:typeOfCharge>
                </ns2:rechargeLogInfo>
                <ns2:rechargeStatusInfo>
                    <ns2:rechargeStatus>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeStatusInfo/rcgStatus)}</ns2:rechargeStatus>
                    <ns2:lastStatusUpdateDate>{fn-bea:date-from-dateTime(fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeStatusInfo/lastStsUpdate))}</ns2:lastStatusUpdateDate>
                    <ns2:releaseRechargeType>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeStatusInfo/relRcgType)}</ns2:releaseRechargeType>
                    <ns2:cdCancelReferenceId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeStatusInfo/cdCancelRefId)}</ns2:cdCancelReferenceId>
                    <ns2:cancelRechargeType>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeStatusInfo/cancelRcgType)}</ns2:cancelRechargeType>
                    <ns2:releaseRechargeId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeStatusInfo/relRcgId)}</ns2:releaseRechargeId>
                </ns2:rechargeStatusInfo>
                <ns2:rechargeTypeInfo>
                    <ns2:rechargeMethodCode>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeTypeInfo/methodCode)}</ns2:rechargeMethodCode>
                    <ns2:rechargeMethodGroup>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeTypeInfo/methodGroup)}</ns2:rechargeMethodGroup>
                    <ns2:rechargeMethodType>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeTypeInfo/methodType)}</ns2:rechargeMethodType>
                    <ns2:rechargeChannelCode>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeTypeInfo/channelCode)}</ns2:rechargeChannelCode>
                    <ns2:rechargeType>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeTypeInfo/rcgType)}</ns2:rechargeType>
                    <ns2:splitRechargeSequence>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeTypeInfo/splitRcgSeq)}</ns2:splitRechargeSequence>
                </ns2:rechargeTypeInfo>
                <ns2:rechargeBucketInfo>
                    <ns2:bucketId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBucketInfo/bucketId)}</ns2:bucketId>
                    <ns2:billingAccountNumber>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBucketInfo/ban)}</ns2:billingAccountNumber>
                    <ns2:billingArrangementId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBucketInfo/ben)}</ns2:billingArrangementId>
                    <ns2:prepaidBucketId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBucketInfo/bucketId)}</ns2:prepaidBucketId>
                    <ns2:paymentChannelName>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBucketInfo/pcnName)}</ns2:paymentChannelName>
                    <ns2:customerId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBucketInfo/customerId)}</ns2:customerId>
                    <ns2:crmExternalId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBucketInfo/crmExternalId)}</ns2:crmExternalId>
                    <ns2:currency>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBucketInfo/currency)}</ns2:currency>
                    <ns2:balanceExpirationDate>{fn-bea:date-from-dateTime(fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeBucketInfo/balExpDate))}</ns2:balanceExpirationDate>
                </ns2:rechargeBucketInfo>
                <ns2:subscriber>
                    <ns2:subscriberId>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeSubscriberInfo/subscriberNo)}</ns2:subscriberId>
                    <ns2:primaryResourceType>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeSubscriberInfo/primaryResourceType)}</ns2:primaryResourceType>
                    <ns2:primaryResourceValue>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/rechargeSubscriberInfo/primaryResourceValue)}</ns2:primaryResourceValue>
                </ns2:subscriber>
                <ns2:accumulationsAmountsInfo>
                    <ns2:installmentAmount>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/accumulationsAmounts/instlAmt)}</ns2:installmentAmount>
                    <ns2:regularBonusAmount>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/accumulationsAmounts/regBonusAmt)}</ns2:regularBonusAmount>
                    <ns2:additionalBonusAmount>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/accumulationsAmounts/addBonusAmt)}</ns2:additionalBonusAmount>
                    <ns2:reduceByAmount>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/accumulationsAmounts/reduceAmt)}</ns2:reduceByAmount>
                    <ns2:debitAmount>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/accumulationsAmounts/debtAmt)}</ns2:debitAmount>
                    <ns2:createChargeAmount>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/accumulationsAmounts/createChargeAmt)}</ns2:createChargeAmount>
                    <ns2:loanAmount>{fn:data($viewRechargesResponse/ns1:return/rechargeHeaderList/accumulationsAmounts/loanAmt)}</ns2:loanAmount>
                </ns2:accumulationsAmountsInfo>
            </ns2:viewRechargesResponse>
        </ns2:ViewRechargesResponseData>
    </ns2:ViewRechargesResponse>
};

local:ejbViewRechargesResponseToViewRechargesResponse($units,$tefHeaderResType,$viewRechargesResponse)