import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:practice_clean_arch/ui/componentes/widget_screen_2.dart';
import 'package:practice_clean_arch/ui/componentes/widget_screen_3.dart';
import 'package:practice_clean_arch/ui/componentes/widget_screen_4.dart';
import 'package:practice_clean_arch/ui/componentes/widget_screen_5.dart';

class SliderModel {
  String? image;
  String? title;
  String? description;
  Widget? widget;
  SliderModel({this.image, this.title, this.description, this.widget});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  void setWidget(Widget getWidget) {
    widget = getWidget;
  }

  String? getImage() {
    return image;
  }

  String? getTitle() {
    return title;
  }

  String? getDescription() {
    return description;
  }

  Widget? getWidget() {
    return widget;
  }
}

List<SliderModel> getSliders() {
  List<SliderModel> sliders = <SliderModel>[];
  SliderModel sliderModel = SliderModel();
  sliderModel.setImage('assets/images/giphy1.gif');
  sliderModel.setTitle('¡Ya falta poco!');
  sliderModel.setDescription(
      'Solo unos pasos más y podrás disfrutar de tu cuenta virtual');
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.setImage('assets/images/contrato.gif');
  sliderModel.setTitle('Términos y Condiciones');
  sliderModel.setWidget(const WidgetScreen2());
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.setImage('assets/images/preguntas.gif');
  sliderModel.setTitle('Preguntas de Seguridad');
  sliderModel.setWidget(const WidgetScreen3());
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.setImage('assets/images/imagenes_seguridad.gif');
  sliderModel.setTitle('Imágen de Seguridad');
  sliderModel.setWidget(const WidgetScreen4());
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.setImage("assets/images/notificaciones.gif");
  sliderModel.setTitle("Códigos de Seguridad");
  sliderModel.setWidget(const WidgetScreen5());
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.setImage("assets/images/check.gif");
  sliderModel.setTitle("¡Todo Listo!");
  sliderModel.setDescription(
      "Ya puedes empezar a disfrutar de los beneficios de tu nueva cuenta");
  sliders.add(sliderModel);
  sliderModel = SliderModel();

  return sliders;
}
