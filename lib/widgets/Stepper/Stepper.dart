import 'package:flutter/Material.dart';

// ignore: must_be_immutable
class Mystepper extends StatelessWidget {
  int? currentindex;
  Mystepper({super.key, this.currentindex});

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
                      "Delivery",
                      style: _getStepperTextStyle(0, context),
                    ),
                    Text(
                      "Address",
                      style: _getStepperTextStyle(1, context),
                    ),
                    Text(
                      "Payment",
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
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor,
            )),
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
          color: isCompleted ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
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
