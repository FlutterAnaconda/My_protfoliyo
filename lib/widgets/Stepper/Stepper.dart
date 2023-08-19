import 'package:flutter/Material.dart';

// ignore: must_be_immutable
class Mystepper extends StatelessWidget {
  int? currentindex;
  final String firsttext;
  final String secondtext;
  final String thridtext;
  Mystepper({super.key, this.currentindex, required this.firsttext, required this.secondtext, required this.thridtext});

  @override
  Widget build(BuildContext context) {
    return stepperwidget(context);
  }

  Widget stepperwidget(BuildContext context) => SizedBox(
        height: 68,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // _buildStepperIcon(0),
                  _buildDummyStepper(context),
                  Expanded(
                    child: Divider(
                        thickness: 3, color: Theme.of(context).primaryColor),
                  ),
                  _buildStepperIcon(1, context),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: currentindex! >= 1
                          ? Theme.of(context).primaryColor
                          : Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  _buildStepperIcon(2, context),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      firsttext,
                      style: _getStepperTextStyle(0, context),
                    ),
                    Text(
                      secondtext,
                      style: _getStepperTextStyle(1, context),
                    ),
                    Text(
                      thridtext,
                      style: _getStepperTextStyle(2, context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildDummyStepper(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xff07CD6E),
                const Color(0xFF059F55).withOpacity(0.86),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(15),
            ),
        child: const Center(
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 20,
          ),
        ));
  }

  Widget _buildStepperIcon(int stepIndex, BuildContext context) {
    bool isCompleted = currentindex! >= stepIndex;
    // bool isInProgress = _currentPage! == stepIndex;

    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: isCompleted ? null : Colors.white,
          gradient:isCompleted? LinearGradient(
            colors: [
              const Color(0xff07CD6E),
              const Color(0xFF059F55).withOpacity(0.86),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ):null,
          borderRadius: BorderRadius.circular(15),
          border:isCompleted? null:Border.all(
            width: 2,
            color: Theme.of(context).primaryColor,
          )),
      child: isCompleted
          ? const Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
            )
          : Icon(
              Icons.circle,
              color: Theme.of(context).primaryColor,
              size: 22,
            ),
    );
  }

  TextStyle _getStepperTextStyle(int stepIndex, BuildContext context) {
    bool isCompleted = currentindex! > stepIndex;

    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: isCompleted ? Theme.of(context).primaryColor : Colors.black45,
    );
  }
}
