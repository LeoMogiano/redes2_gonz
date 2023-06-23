import 'package:flutter/material.dart';
import 'package:helloworld/models/User.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _user = User(name: '', email: '', role: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              MyTextFieldContainer(
                labelText: 'Nombre',
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    _user.name = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null; // Sin errores de validación
                },
              ),
              const SizedBox(height: 20),
              MyTextFieldContainer(
                labelText: 'Correo electrónico',
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _user.email = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su correo';
                  }
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);
                  return regExp.hasMatch(value)
                      ? null
                      : 'El correo no es válido';
                },
              ),
              const SizedBox(height: 20),
              MyDateFieldContainer(
                labelText: 'Fecha de nacimiento',
                selectedDate: _user.fechaNac,
                onChanged: (value) {
                  setState(() {
                    _user.fechaNac = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Este campo es requerido';
                  }
                  // Aquí puedes agregar una validación de formato de fecha si lo deseas
                  return null; // Sin errores de validación
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MyTextFieldContainer(
                      labelText: 'Teléfono',
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        // Aquí puedes realizar alguna acción con el número de teléfono ingresado
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo es requerido';
                        }
                        // Aquí puedes agregar una validación de formato de teléfono si lo deseas
                        return null; // Sin errores de validación
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: MyTextFieldContainer(
                      labelText: 'Cel Emergencia',
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        // Aquí puedes realizar alguna acción con el contacto de emergencia ingresado
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo es requerido';
                        }
                        return null; // Sin errores de validación
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MyTextFieldContainer(
                labelText: 'Carnet (ID)',
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  // Aquí puedes realizar alguna acción con el carnet ingresado
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null; // Sin errores de validación
                },
              ),
              const SizedBox(height: 20),
              MyDropdownFormField<String>(
                labelText: 'Grupo',
                items: [
                  const DropdownMenuItem<String>(
                    value: 'Pacientes',
                    child: Text('Pacientes'),
                  ),
                  const DropdownMenuItem<String>(
                    value: 'Personal Médico',
                    child: Text('Personal Médico'),
                  ),
                ],
                value: _user.group,
                onChanged: (value) {
                  setState(() {
                    _user.group = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null; // Sin errores de validación
                },
              ),
              const SizedBox(height: 20),
              if (_user.group == 'Pacientes')
                MyDropdownFormField<String>(
                  labelText: 'Rol',
                  items: [
                    const DropdownMenuItem<String>(
                      value: 'Asegurado',
                      child: Text('Asegurado'),
                    ),
                    const DropdownMenuItem<String>(
                      value: 'No Asegurado',
                      child: Text('No Asegurado'),
                    ),
                  ],
                  value: _user.role,
                  onChanged: (value) {
                    setState(() {
                      _user.role = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null; // Sin errores de validación
                  },
                ),
              if (_user.group == 'Personal Médico')
                MyDropdownFormField<String>(
                  labelText: 'Rol',
                  items: [
                    const DropdownMenuItem<String>(
                      value: 'Doctor',
                      child: Text('Doctor'),
                    ),
                    const DropdownMenuItem<String>(
                      value: 'Enfermero',
                      child: Text('Enfermero'),
                    ),
                  ],
                  value: _user.role,
                  onChanged: (value) {
                    setState(() {
                      _user.role = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null; // Sin errores de validación
                  },
                ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: MyDropdownFormField<String>(
                      labelText: 'Sexo',
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'Masculino',
                          child: Text('Masculino'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Femenino',
                          child: Text('Femenino'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Otro',
                          child: Text('Otro'),
                        ),
                      ],
                      value: _user.sexo,
                      onChanged: (value) {
                        setState(() {
                          _user.sexo = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo es requerido';
                        }
                        return null; // Sin errores de validación
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: MyDropdownFormField<String>(
                      labelText: 'Tipo Sangre',
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'ORH+',
                          child: Text('ORH +'),
                        ),
                        // Agrega aquí todos los tipos de sangre necesarios
                      ],
                      value: _user.tipoSangre,
                      onChanged: (value) {
                        setState(() {
                          _user.tipoSangre = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo es requerido';
                        }
                        return null; // Sin errores de validación
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // El formulario es válido, puedes realizar la acción deseada aquí
                    // Por ejemplo, guardar los datos en la base de datos o enviarlos a través de una API
                  }
                },
                child: const Text('Guardar'),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextFieldContainer extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final int? maxLength;
  final FormFieldValidator<String>? validator;

  const MyTextFieldContainer({
    Key? key,
    required this.labelText,
    required this.keyboardType,
    required this.onChanged,
    this.maxLength,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        onChanged: onChanged,
        maxLength: maxLength,
        style: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
            color: Colors.grey[600],
          ),
          suffix: const SizedBox(height: 20),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          counterText: '',
        ),
        validator: validator,
      ),
    );
  }
}

class MyDropdownFormField<T> extends StatelessWidget {
  final String labelText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final FormFieldValidator<T>? validator;

  const MyDropdownFormField({
    Key? key,
    required this.labelText,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: DropdownButtonFormField<T>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: value,
        items: items,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
            color: Colors.grey[600],
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      ),
    );
  }
}

class MyDateFieldContainer extends StatelessWidget {
  final String labelText;
  final ValueChanged<DateTime?> onChanged;
  final FormFieldValidator<DateTime>? validator;

  final DateTime? selectedDate;

  const MyDateFieldContainer({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.validator,
    this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: ListTile(
        title: Text(
          selectedDate != null
              ? selectedDate!.toString()
              : 'Selecciona una fecha',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
            color: Colors.grey[600],
          ),
        ),
        trailing: const Icon(Icons.calendar_today),
        onTap: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          ).then((selectedDate) {
            if (selectedDate != null) {
              onChanged(selectedDate);
            }
          });
        },
      ),
    );
  }
}
