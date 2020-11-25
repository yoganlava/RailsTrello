import $ from 'jquery';
import { toast } from 'bulma-toast';
import Cookie from 'js-cookie';

export async function ajaxRequest(url, data = {}, type) {
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

export function toastData(data) {
    toast({
        message: data.message ? data.message : data.error,
        type: data.message ? "is-success" : "is-danger",
        dismissible: true
    });
    console.log("toast")
}