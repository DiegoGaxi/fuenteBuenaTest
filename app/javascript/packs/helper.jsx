export const formatDate = (date) => {
    if ((date.getMonth() + 1) < 10) {
        var mes = "0" + (date.getMonth() + 1);
    } else {
        var mes = (date.getMonth() + 1);
    }
    return (date.getFullYear() + "-" + mes + "-" + date.getDate())
}

export const formatDateHours = (date) => {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}

export const fecha_hoy = () => {
    var x = new Date();
    var y = x.getFullYear().toString();
    var m = (x.getMonth() + 1).toString();
    var d = x.getDate().toString();
    (d.length == 1) && (d = '0' + d);
    (m.length == 1) && (m = '0' + m);
    var yyyymmdd = y + '-' + m + '-' + d;
    return yyyymmdd;
}

export const fecha_dia_anterior = () => {
    var x = new Date();
    var y = x.getFullYear().toString();
    var m = (x.getMonth() + 1).toString();
    var d = (x.getDate() - 1).toString();
    (d.length == 1) && (d = '0' + d);
    (m.length == 1) && (m = '0' + m);
    var yyyymmdd = y + '-' + m + '-' + d;
    return yyyymmdd;
}

export const fecha_mes_anterior = () => {
    var x = new Date();
    if (x.getMonth() == 0) {
        var y = (x.getFullYear() - 1).toString();
        var m = "12";
    } else {
        var y = x.getFullYear().toString();
        var m = (x.getMonth()).toString();
    }
    var d = x.getDate().toString();
    (d.length == 1) && (d = '0' + d);
    (m.length == 1) && (m = '0' + m);
    var yyyymmdd = y + '-' + m + '-' + d;
    return yyyymmdd;
}

export const formatNumero = (n, currency) => {
    if (n == null || n == "" || n == "undefined") {
        return 0;
    } else if (parseFloat(n) >= 0) {
        return currency + "" + parseFloat(n).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
    }
    else if (parseFloat(n) < 0) {
        return "(" + currency + "" + (parseFloat(n) * -1).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,") + ")";
    }
    else {
        return 'NaN';
    }
}

export const FormatDate = (date) => {
    var aux, months, newDate, dias, diaNumero
    months = [
        "Enero",
        "Febrero",
        "Marzo",
        "Abril",
        "Mayo",
        "Junio",
        "Julio",
        "Agosto",
        "Septiembre",
        "Octubre",
        "Noviembre",
        "Diciembre"];

    dias = [
        'Domingo',
        'Lunes',
        'Martes',
        'Miércoles',
        'Jueves',
        'Viernes',
        'Sábado',
    ]

    diaNumero = new Date(date).getDay();

    if (date == null) {
        date = ""
    }
    aux = date.split("-")

    newDate = (date == "") ? "" : dias[diaNumero + 1] + " " + aux[2] + " de " + months[aux[1] - 1]
    return newDate
}