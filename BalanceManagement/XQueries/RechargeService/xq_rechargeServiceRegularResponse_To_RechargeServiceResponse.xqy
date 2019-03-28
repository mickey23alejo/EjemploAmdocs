xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace typ="http://telefonica.cl/ChargeCalculationAndBalanceManagement/BalanceManagement/V1/types";

declare namespace ns1="http://www.kruger.com.ec/";



declare namespace amd = "java:ec.com.kruger.ejb.rpl1rechargeservices.rechargeservices";

declare variable $rechargeServiceRegularResponse as element()  external;

declare function local:func($rechargeServiceRegularResponse as element() ) as element()  {
    <typ:RechargeServiceResponse>         
         <typ:RechargeServiceResponseData>
            <typ:rechargeIdentificationInfo>
                <typ:rechargeId>{fn:data($rechargeServiceRegularResponse//rechargeIdentInfo/rcgId)}</typ:rechargeId>
                <typ:periodKey>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeIdentInfo/periodKey)}</typ:periodKey>
                <typ:bucketKey>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeIdentInfo/bucketKey)}</typ:bucketKey>
            </typ:rechargeIdentificationInfo>
            <typ:rechargeDatesInfo>
                <typ:rechargeReferenceDate>{fn:adjust-dateTime-to-timezone(fn:data($rechargeServiceRegularResponse/ns1:return/rechargeDatesInfo/rcgRefDate),())}</typ:rechargeReferenceDate>
                <typ:processDate>{fn:adjust-dateTime-to-timezone(fn:data($rechargeServiceRegularResponse/ns1:return/rechargeDatesInfo/processDate),())}</typ:processDate>
                <typ:logicalDate>{fn:adjust-dateTime-to-timezone(fn:data($rechargeServiceRegularResponse/ns1:return/rechargeDatesInfo/logicalDate),())}</typ:logicalDate>
                <typ:rechargeRequestDate>{fn:adjust-dateTime-to-timezone(fn:data($rechargeServiceRegularResponse/ns1:return/rechargeDatesInfo/rcgReqDate),())}</typ:rechargeRequestDate>
            </typ:rechargeDatesInfo>
            <typ:rechargeAmountsInfo>
               <!--Optional:-->
               <typ:inputAmount>
                 {
                 if(fn:contains($rechargeServiceRegularResponse/ns1:return/rechargeAmountsInfo/inputAmt/text(), '.')) then 
                 <typ:amount>{concat(substring-before($rechargeServiceRegularResponse/ns1:return/rechargeAmountsInfo/inputAmt/text(), '.'),'.', substring(substring-after($rechargeServiceRegularResponse/ns1:return/rechargeAmountsInfo/inputAmt/text(), '.'),1,2))}</typ:amount> else
                 <typ:amount>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeAmountsInfo/inputAmt)}</typ:amount>
                 }                  
                 <typ:units>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeAmountsInfo/inputCurrency)}</typ:units>
               </typ:inputAmount>
                <typ:rechargeChannelAmount>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeAmountsInfo/rcgChlAmt)}</typ:rechargeChannelAmount>
                <typ:ppsBalance>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeAmountsInfo/ppsBalance)}</typ:ppsBalance>
                <typ:ppsNewBalance>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeAmountsInfo/ppsNewBalance)}</typ:ppsNewBalance>
                <typ:ppsAmount>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeAmountsInfo/ppsAmt)}</typ:ppsAmount>
            </typ:rechargeAmountsInfo>
            <typ:rechargeBalanceExpirationInfo>
                <typ:rechargeNumberOfDays>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeBalanceExpirationInfo/rcgNumOfDays)}</typ:rechargeNumberOfDays>
{ if ($rechargeServiceRegularResponse/ns1:return/rechargeBalanceExpirationInfo/balExpDateCalc != "") then (
                <typ:balanceExpirationDate>{fn-bea:date-from-dateTime($rechargeServiceRegularResponse/ns1:return/rechargeBalanceExpirationInfo/balExpDateCalc)}</typ:balanceExpirationDate>) else ()}
            </typ:rechargeBalanceExpirationInfo>
            <typ:rechargeLogInfo>
                <typ:rechargeMainId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeLogInfo/rmdMainId)}</typ:rechargeMainId>
                <typ:rechargeValue>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeLogInfo/rmdVals)}</typ:rechargeValue>
                <typ:channelDetailMainId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeLogInfo/cdMainId)}</typ:channelDetailMainId>
                <typ:channelDetailValue>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeLogInfo/cdVals)}</typ:channelDetailValue>
                <typ:channelDetailUniqueId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeLogInfo/cdUniqueId)}</typ:channelDetailUniqueId>
                <typ:clientTimeStamp>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeLogInfo/clientTimeStamp)}</typ:clientTimeStamp>
                <typ:radTimeStamp>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeLogInfo/radTimeStamp)}</typ:radTimeStamp>
                <typ:rplTimeStamp>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeLogInfo/rplTimeStamp)}</typ:rplTimeStamp>
                <typ:subscriberIdValue>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeLogInfo/subIdVals)}</typ:subscriberIdValue>
            </typ:rechargeLogInfo>
            <typ:rechargeTypeInfo>
                <typ:rechargeMethodCode>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeTypeInfo/methodCode)}</typ:rechargeMethodCode>
                <typ:rechargeMethodGroup>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeTypeInfo/methodGroup)}</typ:rechargeMethodGroup>
                <typ:rechargeMethodType>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeTypeInfo/methodType)}</typ:rechargeMethodType>
                <typ:rechargeChannelCode>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeTypeInfo/channelCode)}</typ:rechargeChannelCode>
                <typ:rechargeType>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeTypeInfo/rcgType)}</typ:rechargeType>
                <typ:splitRechargeSequence>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeTypeInfo/splitRcgSeq)}</typ:splitRechargeSequence>
            </typ:rechargeTypeInfo>
            <typ:rechargeStatusInfo>
                <typ:rechargeStatus>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeStatusInfo/rcgStatus)}</typ:rechargeStatus>
                <typ:lastStatusUpdateDate>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeStatusInfo/lastStsUpdate)}</typ:lastStatusUpdateDate>
                <typ:releaseRechargeType>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeStatusInfo/relRcgType)}</typ:releaseRechargeType>
                <typ:cdCancelReferenceId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeStatusInfo/cdCancelRefId)}</typ:cdCancelReferenceId>
                <typ:cancelRechargeType>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeStatusInfo/cancelRcgType)}</typ:cancelRechargeType>
                <typ:releaseRechargeId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeStatusInfo/relRcgId)}</typ:releaseRechargeId>
            </typ:rechargeStatusInfo>
            <typ:rechargeBucketInfo>
                <typ:bucketId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeBucketInfo/bucketId)}</typ:bucketId>
                <typ:billingAccountNumber>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeBucketInfo/ban)}</typ:billingAccountNumber>
                <typ:billingArrangementId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeBucketInfo/ben)}</typ:billingArrangementId>
                <typ:prepaidBucketId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeBucketInfo/pcn)}</typ:prepaidBucketId>
                <typ:paymentChannelName>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeBucketInfo/pcnName)}</typ:paymentChannelName>
                <typ:customerId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeBucketInfo/customerId)}</typ:customerId>
                <typ:crmExternalId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeBucketInfo/crmExternalId)}</typ:crmExternalId>
                <typ:currency>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeBucketInfo/currency)}</typ:currency>
				{if ($rechargeServiceRegularResponse/ns1:return/rechargeBucketInfo/balExpDate != "") then (
                <typ:balanceExpirationDate>{fn-bea:date-from-dateTime($rechargeServiceRegularResponse/ns1:return/rechargeBucketInfo/balExpDate)}</typ:balanceExpirationDate>) else ()}
            </typ:rechargeBucketInfo>
            <typ:subscriber>
                <typ:subscriberId>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeSubscriberInfo/subscriberNo)}</typ:subscriberId>
                <typ:primaryResourceType>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeSubscriberInfo/primaryResourceType)}</typ:primaryResourceType>
                <typ:primaryResourceValue>{fn:data($rechargeServiceRegularResponse/ns1:return/rechargeSubscriberInfo/primaryResourceValue)}</typ:primaryResourceValue>
            </typ:subscriber>
            <!--Optional:-->
            <typ:accumulationsAmountsInfo>
                <typ:installmentAmount>{fn:data($rechargeServiceRegularResponse/ns1:return/accumulationsAmounts/instlAmt)}</typ:installmentAmount>
                <typ:regularBonusAmount>{fn:data($rechargeServiceRegularResponse/ns1:return/accumulationsAmounts/regBonusAmt)}</typ:regularBonusAmount>
                <typ:additionalBonusAmount>{fn:data($rechargeServiceRegularResponse/ns1:return/accumulationsAmounts/addBonusAmt)}</typ:additionalBonusAmount>
                <typ:reduceByAmount>{fn:data($rechargeServiceRegularResponse/ns1:return/accumulationsAmounts/reduceAmt)}</typ:reduceByAmount>
                <typ:debitAmount>{fn:data($rechargeServiceRegularResponse/ns1:return/accumulationsAmounts/debtAmt)}</typ:debitAmount>
                <typ:createChargeAmount>{fn:data($rechargeServiceRegularResponse/ns1:return/accumulationsAmounts/createChargeAmt)}</typ:createChargeAmount>
                <typ:loanAmount>{fn:data($rechargeServiceRegularResponse/ns1:return/accumulationsAmounts/loanAmt)}</typ:loanAmount>
            </typ:accumulationsAmountsInfo>
         </typ:RechargeServiceResponseData>
      </typ:RechargeServiceResponse>
};

local:func($rechargeServiceRegularResponse)