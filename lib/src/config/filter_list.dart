class PopularFilters {
  PopularFilters({
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;

  static List<PopularFilters> popularFList = <PopularFilters>[
    PopularFilters(
      titleTxt: 'Free Shipping',
      isSelected: false,
    ),
    PopularFilters(
      titleTxt: 'Made in Canada',
      isSelected: false,
    ),
    PopularFilters(
      titleTxt: 'On Sale',
      isSelected: true,
    ),
    PopularFilters(
      titleTxt: 'Free Returns',
      isSelected: false,
    ),
    PopularFilters(
      titleTxt: 'Highly Rated',
      isSelected: false,
    ),
  ];

  static List<PopularFilters> accomodationList = [
    PopularFilters(
      titleTxt: 'Select All',
      isSelected: false,
    ),
    PopularFilters(
      titleTxt: 'Free Returns',
      isSelected: false,
    ),
    PopularFilters(
      titleTxt: 'Returns Accepted',
      isSelected: true,
    ),
    PopularFilters(
      titleTxt: 'Sold Items',
      isSelected: false,
    ),
    PopularFilters(
      titleTxt: 'Listed as Lots',
      isSelected: false,
    ),
    PopularFilters(
      titleTxt: 'Autorised Seller',
      isSelected: false,
    ),
  ];
}
