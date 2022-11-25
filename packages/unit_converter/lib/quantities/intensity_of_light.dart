import '../conversion/conversion_node.dart';
import '../conversion/conversion_tree.dart';
import '../unit_converter.dart';
import '../units/intensity_of_light_unit.dart';
import '../units/unit.dart';
import 'base_quantity.dart';
import 'dart:math';

class IntensityOfLight extends BaseQuantity<IntensityOfLight> {
  static final ConversionTree<IntensityOfLight> _tree = ConversionTree<IntensityOfLight>(
    data: ConversionNode<IntensityOfLight>(
      unit: IntensityOfLightUnit.candela,
      children: [
        ConversionNode<IntensityOfLight>(
          unit: IntensityOfLightUnit.candelagerman,
          coefficientProduct: 95/100,
        ),
        ConversionNode<IntensityOfLight>(
          unit: IntensityOfLightUnit.candelauk,
          coefficientProduct: 90/100,
        ),
      ],  
  ),
  );

  IntensityOfLight({required super.value, required super.unit});

  @override
  num convertTo(
    Unit<IntensityOfLight> to,
  ) {
    return Conversion<IntensityOfLight>(_tree).convert(super.value, super.unit, to);
  }

  static List<String> getAllUnits() {
    List<ConversionNode<IntensityOfLight>> nodes = _tree.data.getTreeAsList();
    List<String> units = [];

    for (ConversionNode<IntensityOfLight> node in nodes) {
      units.add(node.unit.symbol);
    }
    return units;
  }
}
