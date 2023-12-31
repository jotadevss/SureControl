import 'package:asp/asp.dart';
import 'package:elevo/src/utils/constants.dart';
import 'package:elevo/src/core/logic/app_logic.dart';
import 'package:elevo/src/core/logic/dashboard_logic.dart';
import 'package:elevo/src/core/logic/transaction/incomes_logic.dart';
import 'package:elevo/src/router.dart';
import 'package:elevo/src/ui/common/components/appbar.dart';
import 'package:elevo/src/ui/common/components/button.dart';
import 'package:elevo/src/ui/common/components/gap.dart';
import 'package:elevo/src/ui/pages/dashboard/components/pie_chart_dashboard_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncomesDashboardPage extends StatefulWidget {
  const IncomesDashboardPage({super.key});

  @override
  State<IncomesDashboardPage> createState() => _IncomesDashboardPageState();
}

class _IncomesDashboardPageState extends State<IncomesDashboardPage> {
  @override
  void initState() {
    loadIncomesDashboardAction.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(() => isLoadingState.value);
    final sections = context.select(() => incomesSectionsAtom.value);
    final dtos = context.select(() => incomesDtoAtom.value);
    return Scaffold(
      body: (isLoading)
          ? const Center(child: CircularProgressIndicator(color: kPrimaryColor))
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: getStatusBar(context) + 10, left: kMarginHorizontal + 4, right: kMarginHorizontal + 4),
                child: IncomesTransactions.currentMonthIncomes.isEmpty
                    ? Column(
                        children: [
                          ElevoAppBar(
                            enableAction: true,
                            isCenter: false,
                            assetName: 'lib/assets/icons/arrow-left.svg',
                            action: () {
                              context.pop();
                            },
                          ),
                          const Gap(height: 32),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: kGrayColor.withOpacity(0.2)),
                            ),
                            child: Column(
                              children: [
                                const Gap(height: 32),
                                const Icon(
                                  Icons.trending_up_rounded,
                                  color: kPrimaryColor,
                                  size: 44,
                                ),
                                const Gap(height: 20),
                                const Text(
                                  'No incomes\nregistered!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(height: 20),
                                const Text(
                                  'Add your first incomes and\nstart managing your finances',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff929292),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Gap(height: 32),
                                ButtonWidget(
                                  iconAssetName: 'lib/assets/icons/wallet-money.svg',
                                  title: 'Add transaction',
                                  color: kPrimaryColor,
                                  onTap: () {
                                    context.push(AppRouter.INPUT_DATA_PAGE_ROUTER);
                                  },
                                ),
                                const Gap(height: 32),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          ElevoAppBar(
                            enableAction: true,
                            isCenter: false,
                            assetName: 'lib/assets/icons/arrow-left.svg',
                            action: () {
                              context.pop();
                            },
                          ),
                          const Gap(height: 24),
                          PieChartDashboardWidget(
                            label: "Incomes",
                            icon: const Icon(Icons.trending_up_rounded, color: kPrimaryColor),
                            colorIcon: null,
                            svgPath: null,
                            dtos: dtos,
                            value: IncomesTransactions.totalCurrentMonthIncomesValue,
                            dashboard: PieChart(PieChartData(
                              sections: sections,
                              pieTouchData: PieTouchData(
                                touchCallback: (event, response) {
                                  if (!event.isInterestedForInteractions && response == null || response?.touchedSection == null) {
                                    touchedIndexIncomesAction.value = -1;
                                    return;
                                  }
                                  touchedIndexIncomesAction.value = response!.touchedSection!.touchedSectionIndex;
                                },
                              ),
                            )),
                          ),
                          const Gap(height: 32),
                          InkWell(
                            onTap: () {
                              context.pushReplacement(AppRouter.HISTORIC_PAGE_ROUTER);
                            },
                            borderRadius: BorderRadius.circular(99),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                border: Border.all(color: kGrayColor.withOpacity(0.2)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Gap(width: 16),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Incomes Added',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Text(
                                            'Recent trasactions',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  CircleAvatar(
                                    backgroundColor: kPrimaryColor.withOpacity(0.1),
                                    radius: 26,
                                    child: Text(
                                      IncomesTransactions.allIncomes.length.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Gap(height: 64),
                        ],
                      ),
              ),
            ),
    );
  }
}
