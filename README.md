Trabajo practico aydoo-2018 MailMerger de Matias Delgado y Rodrigo Borda
===========================
[![Build Status](https://travis-ci.org/Matuchinn/tp-aydoo-2018.svg?branch=master)](https://travis-ci.org/Matuchinn/tp-aydoo-2018)

AYDOO TP 2018: MailMerger
Es una aplicación que permite hacer envíos de mails masivos a partir de una plantilla, un archivo de contactos  y un archivo de datos

El template tiene ciertos placeholders que la aplicación reemplaza por datos obtenidos del archivo de datos al momento de enviar los mails.
Las direcciones a las que deben ser enviados los mails se encuentran en el archivo de contactos.

Soporte de etiquetas especiales:
<date:i> : debe reemplazarse por la fecha actual en formato inverso: AAAA-MM-DD
<date:d>: debe reemplazarse por la fecha actual en formato: DD-MM-AAAA
<empty(pais,argentina)>: si el placeholder “pais” no está definido en el archivo de datos, entonces utilizar el valor “argentina”
<sum(monto1, monto2)>: debe reemplazarse por la suma de los placesholders monto1 y monto2
<time> => imprime la hora actual en el formato de 24 horas o sea: 16:15 (dos digitos para la hora y otros dos para los minutos)
<time:12> imprime la hora actual en formato 12 horas, o sea 4:15 pm (dos digitos para los minutos y la cantidad de mínima posible de dígitos para la hora)

Comportamiento esperado
La aplicación debería enviar el siguiente mail a juanperez@test.com y maria.gonzalez@test.com.

Remitente: universidad@untref.com
Asunto: Invitación a fiesta de fin de año
Hola Juan,

Por medio del presente mail te estamos invitando a la cena de fin de año de la UNTREF, que se desarrollará en el Centro de estudios (avenida Directorio 887, Caseros), el día 5 de diciembre.
Por favor confirmar su participación enviando un mail a fiesta@untref.com.

Sin otro particular.
La dirección

