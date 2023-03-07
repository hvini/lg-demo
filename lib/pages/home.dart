import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lg_demo/widgets/custom_text_button_widget.dart';
import 'package:lg_demo/widgets/custom_text_field_widget.dart';

import '../galaxy/galaxy_cubit.dart';
import '../providers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GalaxyCubit _galaxyCubit;

  @override
  void initState() {
    _galaxyCubit = galaxyConnectCubitProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocBuilder<GalaxyCubit, GalaxyState>(
        bloc: _galaxyCubit,
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'LG Demo',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: <Widget>[
                CustomTextButtonWidget(
                  iconData: Icons.restart_alt,
                  label: 'reboot',
                  onPressed: () =>
                      state.client != null && !state.client!.isClosed
                          ? _galaxyCubit.reboot()
                          : null,
                ),
                CustomTextButtonWidget(
                  iconData: Icons.power_off,
                  label: 'shutdown',
                  onPressed: () =>
                      state.client != null && !state.client!.isClosed
                          ? _galaxyCubit.shutdown()
                          : null,
                ),
                CustomTextButtonWidget(
                  iconData: Icons.rocket_launch,
                  label: 'relaunch',
                  onPressed: () =>
                      state.client != null && !state.client!.isClosed
                          ? _galaxyCubit.relaunchEarth()
                          : null,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      'Quick connection',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Form(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomTextFieldWidget(
                                enabled: false,
                                labelText: 'hostname',
                                initialValue: state.hostname,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: CustomTextFieldWidget(
                                enabled: false,
                                labelText: 'port',
                                initialValue: state.port.toString(),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: CustomTextFieldWidget(
                            autovalidate: state.showErrors,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Rrrequired';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            labelText: 'Ip Address',
                            initialValue: state.ipAddress,
                            onChanged: (value) =>
                                _galaxyCubit.ipAddressChanged(value),
                          ),
                        ),
                        CustomTextFieldWidget(
                          autovalidate: state.showErrors,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Rrrequired';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          labelText: 'Password',
                          initialValue: state.password,
                          onChanged: (value) =>
                              _galaxyCubit.passwordChanged(value),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton.icon(
                      label: const Text('Connect'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xff328267),
                      ),
                      icon: !state.loading
                          ? Icon(Icons.bolt)
                          : Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.all(2.0),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            ),
                      onPressed: () => state.loading ||
                              state.client != null && !state.client!.isClosed
                          ? null
                          : _galaxyCubit.connect(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
