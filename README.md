# Домашнее задание к занятию "`#«Основы Terraform. Yandex Cloud» - Ощепков Дмитрий`"

### Инструкция по выполнению домашнего задания

1. Сделайте fork [репозитория c шаблоном решения](https://github.com/netology-code/sys-pattern-homework) к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/gitlab-hw или https://github.com/имя-вашего-репозитория/8-03-hw).
2. Выполните клонирование этого репозитория к себе на ПК с помощью команды `git clone`.
3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
   - впишите вверху название занятия и ваши фамилию и имя;
   - в каждом задании добавьте решение в требуемом виде: текст/код/скриншоты/ссылка;
   - для корректного добавления скриншотов воспользуйтесь инструкцией [«Как вставить скриншот в шаблон с решением»](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md);
   - при оформлении используйте возможности языка разметки md. Коротко об этом можно посмотреть в [инструкции по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md).
4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`).
5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
6. Любые вопросы задавайте в чате учебной группы и/или в разделе «Вопросы по заданию» в личном кабинете.

Желаем успехов в выполнении домашнего задания.
---

### Задание 1

В качестве ответа всегда полностью прикладывайте ваш terraform-код в git. Убедитесь что ваша версия Terraform ~>1.12.0

Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
Создайте сервисный аккаунт и ключ. service_account_key_file.
Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную vms_ssh_public_root_key.
Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
Подключитесь к консоли ВМ через ssh и выполните команду  curl ifconfig.me. Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address". Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: eval $(ssh-agent) && ssh-add Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;
Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.
В качестве решения приложите:

скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;
скриншот консоли, curl должен отобразить тот же внешний ip-адрес;
ответы на вопросы.

Ответ:в конфигурации main.tf был не верно указан параметр CPU, так как минимальное количество ядер должно быть 2 а не 1. 
Так же в конфигурации main.tf был не верно указан параметр platform_id = "standart-v4". Должно быть platform_id = "standard-v4а" так как это прописано в документации Yandex Cloud.
В той же конфигурации main.tf значение параметра serial-port-enable = 1 но должно обозначаться в кавычках: serial-port-enable = "1" так как yandex-cloud принимает атрибут metadata только в формате строки. 
Так же изменена переменная 

```

ssh-keys           = "ubuntu:${coalesce(var.vms_ssh_root_key, local.default_ssh_key)}" 
```

как и в конфигурации variables.tf теперь

```

 description = "Override default SSH key (if not set, uses local file from locals.tf)"
  default     = null.
```

В конфигурацию locals.tf добавлено значение 

```

locals {
  default_ssh_key = file("/home/skk/.ssh/id_ed25519.pub")
}
```
Данные изменения удобней так как путь фиксирован и ключ нежелательно выкладывать в публичный репозиторий.
Параметр preemptible = true может пригодиться в обучении для экономии средств, так как прерываемы машины после отключения оплачиваются в несколько раз дешевле. 
core_fraction = 5 так же экономит средства на счёте пользователя, так как устанавливает потребление ресурсов процессоров серверов Yandex-cloud всего на 5%. 

скриншот ЛК Yandex Cloud с созданной ВМ
![Console-yandex-ip.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-02.md/blob/main/img/Console-yandex-ip.jpg)
скриншот консоли
![ifconfig-ip.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-02.md/blob/main/img/ifconfig-ip.jpg)

---

### Задание 2

1. Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
3. Проверьте terraform plan. Изменений быть не должно.


![exercise№2.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-02.md/blob/main/img/exercise%E2%84%962.jpg)


---

### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores  = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf'). ВМ должна работать в зоне "ru-central1-b"
3. Примените изменения.

![ifconfig-ip2.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-02.md/blob/main/img/ifconfig-ip2.jpg)

### Задание 4

1. Объявите в файле outputs.tf один output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
2. Примените изменения.
В качестве решения приложите вывод значений ip-адресов команды terraform output.

![terraform output.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-02.md/blob/main/img/terraform%20output.jpg)


### Задание 5


1. В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
2. Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
3. Примените изменения.

![local.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-02.md/blob/main/img/local.jpg)

### Задание 6


1. Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедините их в единую map-переменную vms_resources и внутри неё конфиги обеих ВМ в виде вложенного map(object).

```
пример из terraform.tfvars:
vms_resources = {
  web={
    cores=2
    memory=2
    core_fraction=5
    hdd_size=10
    hdd_type="network-hdd"
    ...
  },
  db= {
    cores=2
    memory=4
    core_fraction=20
    hdd_size=10
    hdd_type="network-ssd"
    ...
  }
}
```

2. Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.

```
пример из terraform.tfvars:
metadata = {
  serial-port-enable = 1
  ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
}
```

3. Найдите и закоментируйте все, более не используемые переменные проекта.
4. Проверьте terraform plan. Изменений быть не должно

![exercise№6.jpg](https://github.com/OshchepkovDP/ter-homeworks-hw-02.md/blob/main/img/exercise%E2%84%966.jpg)
