# fly.io-Nginx-proxy-manager
Pasos:
1. Instalar Fly CLI
2. Iniciar sesión con el comando flyctl auth login
3. Abrir terminal, powershell y acceder a la carpeta de la plantilla
4. Renombrar la plantilla a utilizar a Dockerfile
5. Ejecutar "fly launch" pero no iniciar el deploy para crear el archivo de configuración "fly.toml"
Cuanto nos aparezca "Would you like to deploy now? (y/N)" escribimos "n" y pulsamos enter.
6. Editar archivo "fly.toml" y  debajo de [env]  agregar las siguientes línea:

Asignar unidad persistente myapp_data a la ubicación /config
Donde Nginx guarda sus configuraciones
```
[mounts]
  destination = "/config"
  source = "myapp_data"
```

Permitir al contenedor escuchar los puertos 443, 81 (El puerto 80 ya lo escucha por default)

```
[[services]]
  internal_port = 4443
  protocol = "tcp"

  [[services.ports]]
    port = 443

[[services]]
  internal_port = 8181
  protocol = "tcp"

  [[services.ports]]
    port = 81
```

7. Crear una unidad persistente con el comando "fly volumes create myapp_data --region lhr --size 1"
Es importante tener en cuenta que en total solo podemos tener 3GB en total de unidades persistente
pero lo recomendable es tener solo 1GB para poder asignar 1GB a los 3 contenedors gratuitos.

8. Ejecutamos "fly launch" para desplegar el contenedor de nuesta APP.

Al terminar mostrará un mensaje así, eso quiere decir que se ha desplegado correctamente!

![alt text](https://i.ibb.co/ccwX81S/Screenshot-2.jpg)

9. Para acceder a Nginx puede hacerlo desde la IP y el dominio, agregando el puerto 81.
Los datos se sesión por default son:
user:admin@example.com

Password:changeme

![alt text](https://i.ibb.co/86mLxzm/Screenshot-3.jpg)

A disfrutar!
