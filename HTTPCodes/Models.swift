//
//  Models.swift
//  HTTPCodes
//
//  Created by Sergey Dolgikh on 27.06.2024.
//

import Foundation


struct Category: Hashable {
    let name: String
    let description: String
    var codes: [ResponseStatus]
}

struct ResponseStatus: Hashable {
    let code: Int
    let name: String
    let description: String
    
    var codeAndName: String { String(code) + " " + name }
}


extension Category {
    
    static var all: [Category] = [
        .informationalResponses,
        .successfulResponses,
        .redirectionMessages,
        .clientErrorResponses,
        .serverErrorResponses,
    ]
    
    static var informationalResponses = Category(
        name: "Информационные коды",
        description: "Данная группа отвечает за передачу данных. Коды этого типа свидетельствуют о том, что запрос принят сервером и обрабатывается.",
        codes: [
            ResponseStatus(
                code: 100,
                name: "Continue",
                description: "Временный код ответа, означающий начало принятия запроса к его последующей обработке. "
            ),
            ResponseStatus(
                code: 101,
                name: "Switching Protocols",
                description: "Сообщает о переключении сервера на протокол, которые был указан в заголовке Upgrade запроса клиента."
            ),
            ResponseStatus(
                code: 102,
                name: "Processing",
                description: "Информация о том, что запрос принят сервером и находится в обработке, но этот процесс еще не завершен."
            ),
            ResponseStatus(
                code: 103 ,
                name: "Early Hints",
                description: "Используется для предварительной загрузки данных пока сервер формирует полный ответ."
            ),
        ]
    )
    
    static var successfulResponses = Category(
        name: "Успешная обработка запроса",
        description: "Коды группы сообщают, что запрос не только принят сервером, но и успешно обработан.",
        codes: [
            ResponseStatus(
                code: 200,
                name: "OK",
                description: "Один из самых популярных ответов. Он свидетельствует о том, что обмен данными между клиентом и сервером прошли успешно. Именно код ответа 200 ждут от ресурса, чтобы проверить, что все работает как надо: сайт загружен, файл открывается и т.д."
            ),
            ResponseStatus(
                code: 201,
                name: "Created",
                description: "Информирует об успешном создании нового ресурса в результате выполнения запроса. Например, была создана новая страница. Если сервер по каким-то причинам не смог обработать запрос и ресурс не был создан, то код ответа будет 202."
            ),
            ResponseStatus(
                code: 202,
                name: "Accepted",
                description: "Сообщает, что сервер принял запрос, но не завершил его обработку."
            ),
            ResponseStatus(
                code: 203,
                name: "Non-Authoritative Information",
                description: "Отвечает об успешной обработке запроса с оговоркой на то, что передаваемая информация была предоставлена не из исходного сервера, а другого источника (например, резервной копии) и может быть неактуальной. "
            ),
            ResponseStatus(
                code: 204,
                name: "No Content",
                description: "Сообщает об успешном принятии и обработке запроса, а также о том, что у сервера нет содержимого для отправки пользователю."
            ),
            ResponseStatus(
                code: 205,
                name: "Partial Content",
                description: "Свидетельствует о частичном выполнении GET-запроса сервером, возвращая только запрошенную пользователем часть контента. Этот код встречается при использовании кэширования. "
            ),
        ]
    )
    
    static var redirectionMessages = Category(
        name: "Коды редиректов",
        description: "Данная группа кодов состояния сообщает о перенаправлении пользователя с его согласием или без него.",
        codes: [
            ResponseStatus(
                code: 300,
                name: "Multiple Choices",
                description: "Ответ срабатывает при условии, что по указанному запросу существует несколько вариантов URL. При таком варианте пользователь или User-agent должен выбрать альтернативный адрес."
            ),
            ResponseStatus(
                code: 301,
                name: "Moved Permanently",
                description: "Свидетельствует о перемещении ранее проиндексированного URL на новый адрес. Это команда роботу индексировать новую страницу вместо старой."
            ),
            ResponseStatus(
                code: 302,
                name: "Found, 302 Moved Temporarily",
                description: "Сообщает, что ранее проиндексированный URL был временно перемещен по другому адресу. При этом страница остается в индексе, а в ответе указывается новый адрес запрашиваемого URL."
            ),
            ResponseStatus(
                code: 303,
                name: "See Other",
                description: "Указывает пользователю, что запрошенная страница находится по другому адресу с запросом GET. "
            ),
            ResponseStatus(
                code: 304,
                name: "Not Modified",
                description: "Показывает, что запрашиваемая страница или объект не были изменены с момента последнего обновления кэша данного документа."
            ),
            ResponseStatus(
                code: 305,
                name: "Use Proxy",
                description: "Сообщает пользователю, что запрашиваемый ресурс доступен только через прокси. Данные по прокси указаны в ответе сервера."
            ),
            ResponseStatus(
                code: 307,
                name: "Temporary Redirect",
                description: "Код схож с 302, сообщая о временном перемещении ресурса на другой адрес. Разница заключается в способе обращения к ресурсу, который должен быть получен тем же методом, что и предыдущий запрос."
            )
        ]
    )
    
    static var clientErrorResponses = Category(
        name: "Ошибки клиента",
        description: "Коды состояний данной группы сообщают об ошибках клиента, при которых сервер не может вызвать запрашиваемый результат.",
        codes: [
            ResponseStatus(
                code: 400,
                name: "Bad Request",
                description: "Ошибка свидетельствует от том, что сервер не понял запрос пользователя из-за синтаксической ошибки."
            ),
            ResponseStatus(
                code: 401,
                name: "Unauthorized",
                description: "Сообщает о необходимости быть авторизованным для получения запрашиваемого доступа. Возникает при неправильном вводе данных пользователем при авторизации."
            ),
            ResponseStatus(
                code: 403,
                name: "Forbidden",
                description: "Запрет доступа к запрашиваемой странице. Доступ может быть ограничен настройками индексации или запрещен для определенных IP."
            ),
            ResponseStatus(
                code: 404,
                name: "Not Found",
                description: "Пожалуй, самая распространенная ошибка. Сообщает о том, что запрашиваемая страница не найдена. Самая частая причина - ошибка в написании адреса."
            ),
            ResponseStatus(
                code: 405,
                name: "Method Not Allowed",
                description: "Сообщает, что в запросе используется метод, который не поддерживается сервером."
            ),
            ResponseStatus(
                code: 406,
                name: "Not Acceptable",
                description: "Указывает, что запрашиваемый пользователем контент не может быть распознан. Причины могут быть в кодировке, методе сжатия или формате объекта."
            ),
            ResponseStatus(
                code: 407,
                name: "Proxy Authentication Required",
                description: "Сообщает, что доступ может быть предоставлен только при авторизации через прокси-сервер."
            ),
            ResponseStatus(
                code: 408,
                name: "Request Timeout",
                description: "Сервер прервал соединение с пользователем из-за слишком долгого ожидания. Данный ответ не возвращается если пользователь принудительно отменил запрос или соединение прервалось по иным причинам."
            ),
            ResponseStatus(
                code: 409,
                name: "Conflict",
                description: "Посылаемый пользователем запрос вызывает конфликт с сервером или другим обращением."
            ),
            ResponseStatus(
                code: 410,
                name: "Gone",
                description: "Ответ сервера при запросе к странице или объекту, который был удален и более недоступен."
            ),
            ResponseStatus(
                code: 411,
                name: "Length Required",
                description: "Отказ сервера на обработку запроса если в нем не указан Content-Length заголовка."
            ),
            ResponseStatus(
                code: 413,
                name: "Request Entity Too Large",
                description: "Сервер не может обработать обращение из-за слишком большого размера запроса."
            ),
            ResponseStatus(
                code: 414,
                name: "Request-URL Too Long",
                description: "Сервер не может обработать обращение если в запросе указан слишком длинный URL."
            ),
            ResponseStatus(
                code: 415,
                name: "Unsupported Media Type",
                description: "Формат запроса пользователя не может быть обработан. Такое встречается при загрузке данных неподходящего формата."
            ),
            ResponseStatus(
                code: 416,
                name: "Requested Range Not Satisfiable",
                description: "Отказ сервера на выполнение запроса из-за некорректного значения поля Range."
            ),
            ResponseStatus(
                code: 417,
                name: "Expectation Failed",
                description: "Отказ сервера на выполнение запроса из-за некорректного значения поля Expect."
            ),
            ResponseStatus(
                code: 422,
                name: "Unprocessable Entity",
                description: "Сервер принял и распознал запрос, но не может его выполнить из-за наличия логической ошибки."
            ),
            ResponseStatus(
                code: 423,
                name: "Locked",
                description: "Запрашиваемая пользователем страница заблокирована. Как правило, это делается для защиты содержимого данной страницы или объекта."
            ),
            ResponseStatus(
                code: 424,
                name: "Failed Dependency",
                description: "Выполнение текущего запроса зависит от исхода других связанных с ней операций. Если условия не будут соблюдены, то соединение будет разорвано."
            ),
            ResponseStatus(
                code: 426,
                name: "Upgrade Required",
                description: "Ошибка указывает на необходимость обновить протокол. Встречается, когда сервер запрашивает https-соединение, которое не может быть предоставлено клиентом."
            ),
            ResponseStatus(
                code: 429,
                name: "Too Many Requests",
                description: "Возникает при превышении лимита отправляемых пользователем запросов за короткий промежуток времени. Часто используется настройками безопасности."
            ),
        ]
    )
    
    static var serverErrorResponses = Category(
        name: "Ошибки сервера",
        description: "В эту группу входят коды ошибок со стороны сервера, когда по тем или иным причинам он не способен обработать запрос или выполнить требуемую операцию. ",
        codes: [
            ResponseStatus(
                code: 500,
                name: "Internal Server Error",
                description: "Код оповещает о возникшей внутренней ошибке сервера или его аварийном отказе."
            ),
            ResponseStatus(
                code: 501,
                name: "Not Implemented",
                description: "Сервер столкнулся с запросом, который не смог распознать. Либо запрос не поддерживается и не может быть обработан."
            ),
            ResponseStatus(
                code: 502,
                name: "Bad Gateway",
                description: "Сообщает о неправильном получении ответа вышестоящего сервера. Частая причина"
            ),
            ResponseStatus(
                code: 503,
                name: "Service Unavailable",
                description: "Указывает на временную недоступность сервера. Причиной может быть его перезагрузка, техническое обслуживание, обращение слишком большого количества пользователей при наличии подобных ограничений. Как правило, сообщение об ошибке содержит параметр Retry-After, информирующий о времени восстановления штатной работы ресурса."
            ),
            ResponseStatus(
                code: 504,
                name: "Gateway Time-out",
                description: "Истек срок ожидания ответа от вышестоящего сервера. Возможные причины: недостаток ресурсов, неполадки с сетевым соединением, ошибки HTTP протокола, настроен слишком короткий срок ожидания."
            ),
            ResponseStatus(
                code: 505,
                name: "HTTP Version Not Supported",
                description: "Используемая в запросе версия протокола HTTP не поддерживается сервером. Встречается при использовании устаревшего формата HTTP-протокола."
            ),
            ResponseStatus(
                code: 506,
                name: "Variant Also Negotiates",
                description: "Сервер не может обработать запрос из-за его неправильной настройки. Сервер зацикливает ответ на себя, выдавая ошибку."
            ),
            ResponseStatus(
                code: 507,
                name: "Insufficient Storage",
                description: "Означает нехватку места на сервере для обработки запросов пользователя. Нужно освободить или увеличить память, либо обратиться в техническую поддержку."
            ),
            ResponseStatus(
                code: 508,
                name: "Loop Detected",
                description: "Ошибка возникает в связи с бесконечным перенаправлением. При обработке запроса возникает петля, что приводит к завершению операции."
            ),
            ResponseStatus(
                code: 509,
                name: "Bandwidth Limit Exceeded",
                description: "Превышен установленный лимит потребления трафика. Ошибка актуальная для интернет-каналов с ограничением по трафику."
            ),
            ResponseStatus(
                code: 510,
                name: "Not Extended",
                description: "Сервер не поддерживает и не может отработать запрашиваемое пользователем расширение. В теле ошибки может быть приведен список доступных расширений."
            ),
            ResponseStatus(
                code: 511,
                name: "Network Authentication Required",
                description: "Сообщает о необходимости авторизации для доступа к сети. Например, если пользователь не авторизовался при подключении к Wi-Fi."
            )
        ]
    )
}
