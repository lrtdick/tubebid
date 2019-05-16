<?php

namespace AlibabaCloud\Aegis\V20161111;

use AlibabaCloud\ApiResolverTrait;

/**
 * @deprecated
 *
 * @method static AegisApiResolver aegisApiResolver(array $options = [])
 * @method static AutoUpgradeSas autoUpgradeSas(array $options = [])
 * @method static BatchDeleteWhiteList batchDeleteWhiteList(array $options = [])
 * @method static CreateCondition createCondition(array $options = [])
 * @method static CreateInstance createInstance(array $options = [])
 * @method static CreateLogQuery createLogQuery(array $options = [])
 * @method static CreateOrUpdateGroup createOrUpdateGroup(array $options = [])
 * @method static CreateOrUpdateRule createOrUpdateRule(array $options = [])
 * @method static CreateSuspiciousExport createSuspiciousExport(array $options = [])
 * @method static CreateTypeWhiteList createTypeWhiteList(array $options = [])
 * @method static CreateUserSetting createUserSetting(array $options = [])
 * @method static CreateUserWhiteList createUserWhiteList(array $options = [])
 * @method static DeleteCondition deleteCondition(array $options = [])
 * @method static DeleteCustomizeReport deleteCustomizeReport(array $options = [])
 * @method static DeleteLogQuery deleteLogQuery(array $options = [])
 * @method static DeleteRule deleteRule(array $options = [])
 * @method static DeleteRuleGroup deleteRuleGroup(array $options = [])
 * @method static DeleteSearchCondition deleteSearchCondition(array $options = [])
 * @method static DeleteStrategy deleteStrategy(array $options = [])
 * @method static DescribeAlarmEventDetail describeAlarmEventDetail(array $options = [])
 * @method static DescribeAlarmEventList describeAlarmEventList(array $options = [])
 * @method static DescribeAllRegionsStatistics describeAllRegionsStatistics(array $options = [])
 * @method static DescribeApiBuySummary describeApiBuySummary(array $options = [])
 * @method static DescribeAssetDetailByUuid describeAssetDetailByUuid(array $options = [])
 * @method static DescribeAssetList describeAssetList(array $options = [])
 * @method static DescribeAssetSummary describeAssetSummary(array $options = [])
 * @method static DescribeAttackAnalysisData describeAttackAnalysisData(array $options = [])
 * @method static DescribeBuySummary describeBuySummary(array $options = [])
 * @method static DescribeConcernNecessity describeConcernNecessity(array $options = [])
 * @method static DescribeCustomizeReportChartData describeCustomizeReportChartData(array $options = [])
 * @method static DescribeCustomizeReportChartList describeCustomizeReportChartList(array $options = [])
 * @method static DescribeCustomizeReportConfigDetail describeCustomizeReportConfigDetail(array $options = [])
 * @method static DescribeCustomizeReportList describeCustomizeReportList(array $options = [])
 * @method static DescribeDataSource describeDataSource(array $options = [])
 * @method static DescribeEmgNotice describeEmgNotice(array $options = [])
 * @method static DescribeEmgUserAgreement describeEmgUserAgreement(array $options = [])
 * @method static DescribeEmgVulGroup describeEmgVulGroup(array $options = [])
 * @method static DescribeEventCountCurve describeEventCountCurve(array $options = [])
 * @method static DescribeEventLevelCount describeEventLevelCount(array $options = [])
 * @method static DescribeExportInfo describeExportInfo(array $options = [])
 * @method static DescribeFilterFields describeFilterFields(array $options = [])
 * @method static DescribeGroupList describeGroupList(array $options = [])
 * @method static DescribeHistogram describeHistogram(array $options = [])
 * @method static DescribeHostTotalCount describeHostTotalCount(array $options = [])
 * @method static DescribeHostWafs describeHostWafs(array $options = [])
 * @method static DescribeHosts describeHosts(array $options = [])
 * @method static DescribeInstanceStatistics describeInstanceStatistics(array $options = [])
 * @method static DescribeLogInfo describeLogInfo(array $options = [])
 * @method static DescribeLogItems describeLogItems(array $options = [])
 * @method static DescribeLogMeta describeLogMeta(array $options = [])
 * @method static DescribeLogQuery describeLogQuery(array $options = [])
 * @method static DescribeLogShipperStatus describeLogShipperStatus(array $options = [])
 * @method static DescribeLoginLogs describeLoginLogs(array $options = [])
 * @method static DescribeMacConfig describeMacConfig(array $options = [])
 * @method static DescribeMachineConfig describeMachineConfig(array $options = [])
 * @method static DescribeNsasSuspEventType describeNsasSuspEventType(array $options = [])
 * @method static DescribeOperateInfo describeOperateInfo(array $options = [])
 * @method static DescribePropertyScheduleConfig describePropertyScheduleConfig(array $options = [])
 * @method static DescribePropertyUserDetail describePropertyUserDetail(array $options = [])
 * @method static DescribeQuaraFile describeQuaraFile(array $options = [])
 * @method static DescribeRiskType describeRiskType(array $options = [])
 * @method static DescribeRiskWhiteList describeRiskWhiteList(array $options = [])
 * @method static DescribeRisks describeRisks(array $options = [])
 * @method static DescribeRuleList describeRuleList(array $options = [])
 * @method static DescribeSasAssetStatistics describeSasAssetStatistics(array $options = [])
 * @method static DescribeSasAssetStatisticsColumn describeSasAssetStatisticsColumn(array $options = [])
 * @method static DescribeSasLeftCondition describeSasLeftCondition(array $options = [])
 * @method static DescribeSearchCondition describeSearchCondition(array $options = [])
 * @method static DescribeSecurityStatInfo describeSecurityStatInfo(array $options = [])
 * @method static DescribeStrategy describeStrategy(array $options = [])
 * @method static DescribeStrategyExecDetail describeStrategyExecDetail(array $options = [])
 * @method static DescribeStrategyTarget describeStrategyTarget(array $options = [])
 * @method static DescribeStratety describeStratety(array $options = [])
 * @method static DescribeStratetyDetail describeStratetyDetail(array $options = [])
 * @method static DescribeSummaryInfo describeSummaryInfo(array $options = [])
 * @method static DescribeSuspEventDetail describeSuspEventDetail(array $options = [])
 * @method static DescribeSuspEventExportInfo describeSuspEventExportInfo(array $options = [])
 * @method static DescribeSuspEventQuaraFiles describeSuspEventQuaraFiles(array $options = [])
 * @method static DescribeSuspEventTypes describeSuspEventTypes(array $options = [])
 * @method static DescribeSuspEventUserSetting describeSuspEventUserSetting(array $options = [])
 * @method static DescribeSuspEvents describeSuspEvents(array $options = [])
 * @method static DescribeSuspTrendStatistics describeSuspTrendStatistics(array $options = [])
 * @method static DescribeSuspiciousEvents describeSuspiciousEvents(array $options = [])
 * @method static DescribeSuspiciousExportInfo describeSuspiciousExportInfo(array $options = [])
 * @method static DescribeSuspiciousOverallConfig describeSuspiciousOverallConfig(array $options = [])
 * @method static DescribeSuspiciousUUIDConfig describeSuspiciousUUIDConfig(array $options = [])
 * @method static DescribeTopRiskyAssets describeTopRiskyAssets(array $options = [])
 * @method static DescribeTotalStatistics describeTotalStatistics(array $options = [])
 * @method static DescribeUserSetting describeUserSetting(array $options = [])
 * @method static DescribeUserTypeWhiteList describeUserTypeWhiteList(array $options = [])
 * @method static DescribeUserWhiteList describeUserWhiteList(array $options = [])
 * @method static DescribeUuidConfig describeUuidConfig(array $options = [])
 * @method static DescribeUuidStatistics describeUuidStatistics(array $options = [])
 * @method static DescribeVersionConfig describeVersionConfig(array $options = [])
 * @method static DescribeVulDetails describeVulDetails(array $options = [])
 * @method static DescribeVulList describeVulList(array $options = [])
 * @method static DescribeVulnerabilitySummary describeVulnerabilitySummary(array $options = [])
 * @method static DescribeWarning describeWarning(array $options = [])
 * @method static DescribeWebLockBindList describeWebLockBindList(array $options = [])
 * @method static DescribeWebLockConfigList describeWebLockConfigList(array $options = [])
 * @method static DescribeWebLockEvents describeWebLockEvents(array $options = [])
 * @method static DescribeWebLockMachineList describeWebLockMachineList(array $options = [])
 * @method static DescribeWebLockStatus describeWebLockStatus(array $options = [])
 * @method static DescribeWebshell describeWebshell(array $options = [])
 * @method static DescribeYesterdayStatistics describeYesterdayStatistics(array $options = [])
 * @method static Describesummary describesummary(array $options = [])
 * @method static DownloadLog downloadLog(array $options = [])
 * @method static ExecStrategy execStrategy(array $options = [])
 * @method static ExportSuspEvents exportSuspEvents(array $options = [])
 * @method static ExportWarning exportWarning(array $options = [])
 * @method static GetAccountStatistics getAccountStatistics(array $options = [])
 * @method static GetCrackStatistics getCrackStatistics(array $options = [])
 * @method static GetEntityList getEntityList(array $options = [])
 * @method static GetStatistics getStatistics(array $options = [])
 * @method static GetStatisticsByUuid getStatisticsByUuid(array $options = [])
 * @method static ModifyAssetGroup modifyAssetGroup(array $options = [])
 * @method static ModifyBatchIgnoreVul modifyBatchIgnoreVul(array $options = [])
 * @method static ModifyConcernNecessity modifyConcernNecessity(array $options = [])
 * @method static ModifyEmgVulSubmit modifyEmgVulSubmit(array $options = [])
 * @method static ModifyLogMetaStatus modifyLogMetaStatus(array $options = [])
 * @method static ModifyMachineConfig modifyMachineConfig(array $options = [])
 * @method static ModifyOpenLogShipper modifyOpenLogShipper(array $options = [])
 * @method static ModifySasAssetStatisticsColumn modifySasAssetStatisticsColumn(array $options = [])
 * @method static ModifySearchCondition modifySearchCondition(array $options = [])
 * @method static ModifyStrategy modifyStrategy(array $options = [])
 * @method static ModifyStrategyTarget modifyStrategyTarget(array $options = [])
 * @method static ModifyWebLockCreateConfig modifyWebLockCreateConfig(array $options = [])
 * @method static ModifyWebLockDeleteConfig modifyWebLockDeleteConfig(array $options = [])
 * @method static ModifyWebLockMachineList modifyWebLockMachineList(array $options = [])
 * @method static ModifyWebLockRefresh modifyWebLockRefresh(array $options = [])
 * @method static ModifyWebLockStatus modifyWebLockStatus(array $options = [])
 * @method static ModifyWebLockUpdateConfig modifyWebLockUpdateConfig(array $options = [])
 * @method static OperateSuspiciousEvent operateSuspiciousEvent(array $options = [])
 * @method static OperateSuspiciousOverallConfig operateSuspiciousOverallConfig(array $options = [])
 * @method static OperateSuspiciousTargetConfig operateSuspiciousTargetConfig(array $options = [])
 * @method static OperateWarning operateWarning(array $options = [])
 * @method static OperateWebVul operateWebVul(array $options = [])
 * @method static OperationCustomizeReportChart operationCustomizeReportChart(array $options = [])
 * @method static OperationSuspEvents operationSuspEvents(array $options = [])
 * @method static PushAllTask pushAllTask(array $options = [])
 * @method static QueryCrackEvent queryCrackEvent(array $options = [])
 * @method static QueryLoginEvent queryLoginEvent(array $options = [])
 * @method static ReleaseInstance releaseInstance(array $options = [])
 * @method static RenewInstance renewInstance(array $options = [])
 * @method static RollbackQuaraFile rollbackQuaraFile(array $options = [])
 * @method static RollbackSuspEventQuaraFile rollbackSuspEventQuaraFile(array $options = [])
 * @method static SaveCustomizeReportConfig saveCustomizeReportConfig(array $options = [])
 * @method static SaveSuspEventUserSetting saveSuspEventUserSetting(array $options = [])
 * @method static TransformLeakage transformLeakage(array $options = [])
 * @method static UpdateCustomizeReportStatus updateCustomizeReportStatus(array $options = [])
 * @method static UpgradeInstance upgradeInstance(array $options = [])
 */
class Aegis
{
    use ApiResolverTrait;
}