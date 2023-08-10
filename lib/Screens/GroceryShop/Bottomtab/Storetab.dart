import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Providers/storeprovider.dart';

import '../InhomeScreens/storedetail.dart';

class StoreTab extends StatelessWidget {
  const StoreTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedStore = Provider.of<StoreProvider>(context).selectedStore;

    return Storesdetailscreen(
      imagepath: selectedStore?.image ?? 'images/Group 7066.png',
      isfav: selectedStore?.isfav ?? false,
      location: selectedStore?.location ?? 'no data',
      rating: selectedStore?.rating ?? 0,
      title: selectedStore?.title ?? 'Blazzing Store',
    );
  }
}
