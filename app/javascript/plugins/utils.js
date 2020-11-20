import $ from 'jquery';
import Cookie from 'js-cookie';

export async function ajaxRequest(url, data, type) {
    let options = {
        type: type,
        url: `/api${url}` + (type === "GET" ? $.param(data) : ""),
        contentType: "application/json; charset=utf-8"
    }
    if (type === "POST") options["data"] = JSON.stringify(data);
    let token;
    if (token = Cookie.get('jwt')) options["beforeSend"] = (xhr) => { xhr.setRequestHeader('Authorization', `Bearer ${token}`) }
    try {
        return $.ajax(options);
    } catch (e) {
        console.log("err: ");
        console.log(e);
        return {}
    }
}